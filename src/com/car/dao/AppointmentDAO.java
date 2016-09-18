package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Appointment;
import com.car.model.Pager;

public interface AppointmentDAO
{
	// 添加预约
	public void addAppointment(Appointment appointment);

	// 查询某个时段店铺的预约
	public List<Appointment> loadAppointsByTime(String appointTime, int storeId);
	
	//加载洗车位的预约
	public List<Appointment>loadLotAppointment(int storeId,int lotId);

	// 加载用户预约 type 0:预约成功 1：预约历史
	public Map<String, Object> loadUserAppointments(String userNo, int type, Pager pager);

	// 加载店铺预约 type 0:预约成功 1：预约历史
	public Map<String, Object> loadStoreAppoints(int storeId, int type, Pager pager);

	// 加载公司的预约信息 type 0:预约信息 1：预约记录
	public Map<String, Object> loadCompanyAppointments(int companyId, int type, Pager pager);

	// 定时关闭
	public void finishAppointment(int time, int type);

	// 加载所有预约
	public Map<String, Object> loadAppoints(Pager pager);

	// 查询预约
	public Appointment loadAppointmentById(int appointmentId);

	// 更新预约
	public void updateAppointment(Appointment appointment);

	// 加载用户最后一次的预约
	public Appointment loadUserLastAppointment(String userNo);

	// 加载店铺某天的预约次数 type:0-精洗 1-快洗
	@SuppressWarnings("rawtypes")
	public List<Map> loadAppointmentsGroupByTime(int storeId, String dateString, int type);
	
	//根据车牌号查询预约
	public List<Appointment>loadAppointmentByCarId(String userNo,int carId);

}
