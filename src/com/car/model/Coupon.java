package com.car.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 优惠券信息
 */
@Entity
@Table(name = "t_coupon")
public class Coupon
{
	private int id;
	// 打折 如95折 范围（0-99）
	private int discount;
	// 使用条件(满这个价格才能使用)
	private int conditionPrice;
	// 起始日期
	private Date startDate;
	// 失效日期
	private Date endDate;
	// 发布时间
	private Date createTime;
	// 优惠券发放店铺
	private Store store;
	// 优惠券状态 0:正常 1：已过期
	private int state;

	@Id
	@GeneratedValue
	@Column(name = "coupon_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getDiscount()
	{
		return discount;
	}

	public void setDiscount(int discount)
	{
		this.discount = discount;
	}

	public int getConditionPrice()
	{
		return conditionPrice;
	}

	public void setConditionPrice(int conditionPrice)
	{
		this.conditionPrice = conditionPrice;
	}

	// @Temporal(TemporalType.DATE)
	public Date getStartDate()
	{
		return startDate;
	}

	public void setStartDate(Date startDate)
	{
		this.startDate = startDate;
	}

	// @Temporal(TemporalType.DATE)
	public Date getEndDate()
	{
		return endDate;
	}

	public void setEndDate(Date endDate)
	{
		this.endDate = endDate;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	@ManyToOne
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

}
