package com.car.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AppointmentDAO;
import com.car.dao.ParkingLotDAO;
import com.car.model.Appointment;
import com.car.model.Pager;
import com.car.model.ParkingLot;
import com.car.util.DateUtil;

@Component("aAppointmentService")
public class AAppointmentService
{
	private AppointmentDAO appointmentDAO;
	private ParkingLotDAO parkingLotDAO;

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

	// 定时关闭到时间的预约
	@Transactional
	public void finishAppointment()
	{
		// 定时完成精洗预约
		appointmentDAO.finishAppointment(20, 1);
		// 定时完成快洗预约
		appointmentDAO.finishAppointment(40, 0);
	}

	@Transactional
	public Map<String, Object> loadAppoints(Pager pager)
	{
		return appointmentDAO.loadAppoints(pager);
	}

	//加载洗车位的预约
	@Transactional
	public List<Appointment> loadLotAppointment(int storeId, int parkNo)
	{
		return appointmentDAO.loadLotAppointment(storeId, parkNo);
	}

	// 加载店铺预约信息
	@Transactional
	public Map<String, Object> loadStoreAppoints(int storeId, int type, Pager pager)
	{
		return appointmentDAO.loadStoreAppoints(storeId, type, pager);
	}

	// 加载公司预约信息
	@Transactional
	public Map<String, Object> loadCompanyAppoints(int companyId, int type, Pager pager)
	{
		return appointmentDAO.loadCompanyAppointments(companyId, type, pager);
	}

	// 关闭预约
	@Transactional
	public void closeAppointment(Appointment appointment)
	{
		appointment = appointmentDAO.loadAppointmentById(appointment.getId());
		appointment.setState(3);
		appointmentDAO.updateAppointment(appointment);
	}

	@Transactional
	public Map<String, Object> delayAppointment(Appointment appointment)
	{
		Appointment appointment2 = appointmentDAO.loadAppointmentById(appointment.getId());
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		String appointTime = DateUtil.DateToString(appointment.getAppointTime());
		List<Appointment> appointments = appointmentDAO.loadAppointsByTime(appointTime,
				appointment2.getStore().getId());
		List<ParkingLot> parkingLots = parkingLotDAO.loadStoreParkingLots(appointment2.getStore().getId());
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

		if (parkingLots.isEmpty())
		{
			String str = "精洗车位";
			if (appointment.getType() == 1)
				str = "快洗车位";
			res.put("status", 400);
			res.put("error", "该时段" + str + "已满");
		} else
		{
			appointment2.setAppointTime(appointment.getAppointTime());
			appointment2.setParkingLot(parkingLots.get(0));
			// appointment.setCreateTime(new Date());
			appointmentDAO.updateAppointment(appointment2);
		}
		return res;
	}
}
