package com.car.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AppointmentDAO;
import com.car.dao.ParkingLotDAO;
import com.car.dao.UserDAO;
import com.car.model.Appointment;
import com.car.model.Pager;
import com.car.model.ParkingLot;
import com.car.model.User;
import com.car.util.DateUtil;

@Component("appointmentService")
public class AppointmentService
{
	private AppointmentDAO appointmentDAO;
	private ParkingLotDAO parkingLotDAO;
	private UserDAO userDAO;

	public UserDAO getUserDAO()
	{
		return userDAO;
	}

	@Resource(name = "userDAO")
	public void setUserDAO(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	public AppointmentDAO getAppointmentDAO()
	{
		return appointmentDAO;
	}

	@Resource(name = "appointmentDAO")
	public void setAppointmentDAO(AppointmentDAO appointmentDAO)
	{
		this.appointmentDAO = appointmentDAO;
	}

	public ParkingLotDAO getParkingLotDAO()
	{
		return parkingLotDAO;
	}

	@Resource(name = "parkingLotDAO")
	public void setParkingLotDAO(ParkingLotDAO parkingLotDAO)
	{
		this.parkingLotDAO = parkingLotDAO;
	}

	// 加载预约次数
	@SuppressWarnings("rawtypes")
	@Transactional
	public List<Map> loadAppointmentTimes(int storeId, String dateString, int type)
	{
		return appointmentDAO.loadAppointmentsGroupByTime(storeId, dateString, type);
	}

	// 添加预约信息
	@Transactional
	public Map<String, Object> addAppointment(Appointment appointment, String dateString)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);

		/*
		 * Appointment lastAppont =
		 * appointmentDAO.loadUserLastAppointment(appointment.getUser().
		 * getUserNo()); if (lastAppont != null) { Date now = new Date(); //
		 * 上次预约到现在的时间差 long time = now.getTime() -
		 * lastAppont.getCreateTime().getTime(); System.out.println(time); if
		 * (time < 12 * 60 * 60 * 1000) { res.put("status", 400);
		 * res.put("error", "距离上次预约还未到12小时，不能预约！"); return res; } }
		 */
		appointment.setAppointTime(DateUtil.stringToDateTime(dateString));

		// 如果预约时间小于当前时间
		if (appointment.getAppointTime().getTime() - new Date().getTime() < 0)
		{
			res.put("status", 400);
			res.put("error", "预约洗车时间不能小于当前时间！");
			return res;
		}
		// 查询车辆的未完成预约
		List<Appointment> appointments = appointmentDAO.loadAppointmentByCarId(appointment.getUser().getUserNo(),
				appointment.getCar().getId());
		if (appointments != null && appointments.size() > 0)
		{
			res.put("status", 400);
			res.put("error", "该车辆还有未完成的预约，请选择其他车辆！");
			return res;
		}

		String appointTime = dateString;
		// System.out.println(appointTime);
		// System.out.println(appointment.getAppointTime());
		appointments = appointmentDAO.loadAppointsByTime(appointTime, appointment.getStore().getId());
		List<ParkingLot> parkingLots = parkingLotDAO.loadStoreParkingLots(appointment.getStore().getId());
		// 移除已经预约的洗车位
		for (Appointment temp : appointments)
		{
			parkingLots.remove(temp.getParkingLot());
		}
		// 移除精洗或快洗车位 或者已锁定车位
		for (int i = 0; i < parkingLots.size(); i++)
		{
			if (parkingLots.get(i).getType() != appointment.getType() || parkingLots.get(i).getState() == 1)
			{
				parkingLots.remove(i);
				i--;
			}
		}

		// System.out.println(parkingLots.size());

		if (parkingLots.isEmpty())
		{
			String str = "精洗车位";
			if (appointment.getType() == 1)
				str = "快洗车位";
			res.put("status", 400);
			res.put("error", "该时段" + str + "已满");
		} else
		{
			User user = userDAO.loadUserByUserNo(appointment.getUser().getUserNo());
			appointment.setUser(user);
			appointment.setParkingLot(parkingLots.get(0));
			appointment.setCreateTime(new Date());
			appointmentDAO.addAppointment(appointment);
		}
		return res;
	}

	// 加载用户预约
	@Transactional
	public Map<String, Object> loadUserAppointments(String userNo, int type, Pager pager)
	{
		return appointmentDAO.loadUserAppointments(userNo, type, pager);
	}

	// 取消预约
	@Transactional
	public Map<String, Object> cancelAppointment(Appointment appointment)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		appointment = appointmentDAO.loadAppointmentById(appointment.getId());
		Date now = new Date();
		if (appointment.getAppointTime().getTime() - now.getTime() < 15 * 60 * 1000)
		{
			res.put("status", 400);
			res.put("error", "您好，客官！为了保证服务质量，请至少提前15分钟取消预约，或联系店铺客服。");
			return res;
		}
		// 取消
		appointment.setState(2);
		appointmentDAO.updateAppointment(appointment);
		return res;
	}

}
