package com.car.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * 洗车位信息
 */
@Entity
@Table(name = "t_parking_lot")
public class ParkingLot
{
	private int id;
	// 店铺内编号1-6
	private int parkNo;
	// 洗车类型 0：精洗 1：快洗
	private int type;
	// 状态 0:正常 1：锁定
	private int state;
	// 所属店铺
	private transient Store store;

	@Id
	@GeneratedValue
	@Column(name = "park_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getParkNo()
	{
		return parkNo;
	}

	public void setParkNo(int parkNo)
	{
		this.parkNo = parkNo;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "store_id", referencedColumnName = "store_id")
	public Store getStore()
	{
		return store;
	}

	public void setStore(Store store)
	{
		this.store = store;
	}

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
	}

	@Override
	public String toString()
	{
		return "ParkingLot [id=" + id + ", parkNo=" + parkNo + ", type=" + type + ", pState=" + state + "]";
	}

}
