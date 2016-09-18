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

@Entity
@Table(name = "t_store_ser")
public class StoreSer
{
	private int id;
	// 服务内容
	private String serName;
	// 服务内容
	private String serContent;
	// 服务价格
	private int price;
	// 服务图标
	private String icon;
	// 创建时间
	private Date createTime;
	// 状态 0:正常状态
	private int state;
	// 所属店铺
	private transient Store store;

	@Id
	@GeneratedValue
	@Column(name = "ser_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getSerName()
	{
		return serName;
	}

	public void setSerName(String serName)
	{
		this.serName = serName;
	}

	public String getSerContent()
	{
		return serContent;
	}

	public void setSerContent(String serContent)
	{
		this.serContent = serContent;
	}

	public int getPrice()
	{
		return price;
	}

	public void setPrice(int price)
	{
		this.price = price;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
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

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}
}
