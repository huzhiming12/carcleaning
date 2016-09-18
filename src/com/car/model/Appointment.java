package com.car.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 洗车预约
 */
@Entity
@Table(name = "t_appointment")
public class Appointment
{
	private int id;

	// 预约的时间
	private Date appointTime;
	// 预约创建时间
	private Date createTime;
	// 预约类型 0:精洗 1：快洗
	private int type;
	// 状态 0:预约成功 1：预约完成 2:预约取消 3：超时关闭
	private int state;
	// 预约的店铺
	private Store store;
	// 预约的洗车位
	private transient ParkingLot parkingLot;
	// 预约的用户
	private transient User user;
	// 预约的车辆
	private Car Car;

	@Id
	@GeneratedValue
	@Column(name = "appoint_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "store_id", referencedColumnName = "store_id")
	public Store getStore()
	{
		return store;
	}

	public void setStore(Store store)
	{
		this.store = store;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "park_id", referencedColumnName = "park_id")
	public ParkingLot getParkingLot()
	{
		return parkingLot;
	}

	public void setParkingLot(ParkingLot parkingLot)
	{
		this.parkingLot = parkingLot;
	}

	public Date getAppointTime()
	{
		return appointTime;
	}

	public void setAppointTime(Date appointTime)
	{
		this.appointTime = appointTime;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "car_id", referencedColumnName = "car_id")
	public Car getCar()
	{
		return Car;
	}

	public void setCar(Car car)
	{
		Car = car;
	}

}
