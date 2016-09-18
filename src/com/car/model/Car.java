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
 * 车辆信息
 */

@Entity
@Table(name = "t_car")
public class Car
{
	private int id;
	// 车辆的品牌号
	private String carBrand;
	// 车牌号
	private String carNo;
	// 车辆添加时间
	private Date createTime;
	// 车辆状态 0：正常 1：已删除
	private int state;
	// 所属用户
	private transient User user;

	@Id
	@GeneratedValue
	@Column(name = "car_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getCarBrand()
	{
		return carBrand;
	}

	public void setCarBrand(String carBrand)
	{
		this.carBrand = carBrand;
	}

	public String getCarNo()
	{
		return carNo;
	}

	public void setCarNo(String carNo)
	{
		this.carNo = carNo;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	@ManyToOne(fetch = FetchType.LAZY)
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

}
