package com.car.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.AppointmentDAO;
import com.car.model.Appointment;
import com.car.model.Pager;
import com.car.util.Config;
import com.car.util.DateUtil;

@Component("appointmentDAO")
public class AppointmentDAOImpl implements AppointmentDAO
{
	private DataDAO dataDAO;

	public DataDAO getDataDAO()
	{
		return dataDAO;
	}

	@Resource(name = "dataDAO")
	public void setDataDAO(DataDAO dataDAO)
	{
		this.dataDAO = dataDAO;
	}

	// 添加预约
	@Override
	public void addAppointment(Appointment appointment)
	{
		dataDAO.addItem(appointment);
	}

	// 查询某个时段店铺的预约
	@Override
	public List<Appointment> loadAppointsByTime(String appointTime, int storeId)
	{
		String hql = " from Appointment a where a.state=0 and a.store.id=" + storeId + " and a.appointTime='" + appointTime + "'";
		return dataDAO.loadItems(hql);
	}

	// 加载用户预约
	@Override
	public Map<String, Object> loadUserAppointments(String userNo, int type, Pager pager)
	{
		Map<String, Object> res = new HashMap<>();
		pager.setPageSize(Config.APPOINT_PAGER_SIZE);
		String str = " from Appointment a where a.user.userNo='" + userNo + "' ";
		// 预约成功
		if (type == 0)
			str += " and a.state=0";
		// 预约历史
		else
			str += " and a.state!=0";
		String hql = str + " order by a.appointTime desc";
		List<Appointment> appointments = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		res.put("appointments", appointments);
		res.put("pager", pager);
		return res;
	}

	//加载洗车位的预约
	@Override
	public List<Appointment> loadLotAppointment(int storeId, int lotId)
	{
		String hql = "from Appointment a where a.state=0 and a.store.id=" + storeId + " and a.parkingLot.parkNo="
				+ lotId;
		return dataDAO.loadItems(hql);
	}

	// 加载店铺预约信息
	@Override
	public Map<String, Object> loadStoreAppoints(int storeId, int type, Pager pager)
	{
		Map<String, Object> res = new HashMap<>();
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String str = " from Appointment a where a.store.id= " + storeId;
		// 预约成功
		if (type == 0)
			str += " and a.state=0 order by a.appointTime";
		// 预约历史
		else
			str += " and a.state!=0 order by a.appointTime desc";
		String hql = str;
		List<Appointment> appointments = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		res.put("appointments", appointments);
		res.put("pager", pager);
		return res;
	}

	// 加载公司预约
	@Override
	public Map<String, Object> loadCompanyAppointments(int companyId, int type, Pager pager)
	{
		Map<String, Object> res = new HashMap<>();
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String str = " from Appointment a where a.store.company.id=" + companyId;
		// 预约成功
		if (type == 0)
			str += " and a.state=0";
		// 预约历史
		else
			str += " and a.state!=0";
		String hql = str + " order by a.appointTime desc";
		List<Appointment> appointments = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		res.put("appointments", appointments);
		res.put("pager", pager);
		return res;
	}

	@Override
	public Map<String, Object> loadAppoints(Pager pager)
	{
		Map<String, Object> res = new HashMap<>();
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String hql = " from Appointment a order by a.appointTime desc";
		List<Appointment> appointments = dataDAO.loadItems(hql, pager);
		hql = "select count(*) from Appointment a ";
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		res.put("appointments", appointments);
		res.put("pager", pager);
		return res;
	}

	// 定时完成预约
	@Override
	public void finishAppointment(int time, int type)
	{
		Date now = new Date();
		Date past = new Date(now.getTime() - time * 60 * 1000);

		String hql = " update Appointment a set a.state =1 where a.type=" + type + " and a.state=0 and a.appointTime<='"
				+ DateUtil.DateToString(past) + "'";
		dataDAO.updateData(hql);
	}

	// 预约详情
	@Override
	public Appointment loadAppointmentById(int appointmentId)
	{
		String hql = "from Appointment a where a.id=" + appointmentId;
		List<Appointment> appointments = dataDAO.loadItems(hql);
		if (appointments != null && appointments.size() > 0)
		{
			return appointments.get(0);
		}
		return null;
	}

	// 更新预约信息
	@Override
	public void updateAppointment(Appointment appointment)
	{
		dataDAO.updateItem(appointment);
	}

	// 加载用户最后一次预约
	@Override
	public Appointment loadUserLastAppointment(String userNo)
	{
		String hql = "from Appointment a where a.user.userNo='" + userNo + "' order by a.createTime desc ";
		List<Appointment> appointments = dataDAO.loadItems(hql);
		if (appointments != null && appointments.size() > 0)
		{
			return appointments.get(0);
		}
		return null;
	}

	// 查询某天每个时间段预约数量，和车位数量
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> loadAppointmentsGroupByTime(int storeId, String dateString, int type)
	{
		String sql = "select count(appoint_id) as times,(select count(*) from t_parking_lot where store_id=" + storeId
				+ " and type=" + type
				+ ") as lotNum,appointTime as appTime from t_appointment  where DATE_FORMAT(appointTime,'%Y-%m-%d')='"
				+ dateString + "' and store_id=" + storeId + " and type=" + type + " and state=0 group by appointTime";
		List<Map> res = dataDAO.SQLQuery(sql);
		return res;
	}

	// 加载车辆的预约记录（未结束的）
	@Override
	public List<Appointment> loadAppointmentByCarId(String userNo, int carId)
	{
		String hql = " from Appointment a where a.user.userNo='" + userNo + "' and a.car.id=" + carId
				+ " and a.state=0";
		return dataDAO.loadItems(hql);
	}

}
