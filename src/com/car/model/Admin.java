package com.car.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_admin")
public class Admin
{
	private int id;
	// 用户名
	private String username;
	// 密码
	private String password;
	// 管理员类型 平台管理员（0：超级管理员 3:商家管理员 4：广告位管理员） 1：公司管理员 2：店铺管理员
	private int type;
	// 所属店铺
	private Store store;
	// 所属公司
	private Company company;
	// 状态 0 正常 1：已锁定 2：已删除
	private int state;

	@Id
	@GeneratedValue
	@Column(name = "admin_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
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

	@ManyToOne
	@JoinColumn(name = "company_id", referencedColumnName = "company_id")
	public Company getCompany()
	{
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
	}

}
