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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 用户信息
 */
@Entity
@Table(name = "t_user")
public class User
{
	private int id;
	// 会员卡号
	private String userNo;
	// 用户头像
	private String icon;
	// 用户名
	private String username;
	// 真实姓名
	private String name;
	// 手机号码
	private String mobilePhone;
	// 账号创建时间
	private Date createTime;
	// 注册app时间
	private Date registerTime;
	// 检车时间
	private Date checkCarDate;
	// 审本时间
	private Date reviewDate;
	// 密码
	private String password;
	// 注册标志 0: 未注册App 1：已注册
	private int isRegister;
	// 用户状态 0：正常 1:删除
	private int state;
	// 用户所属店铺
	private Store store;

	@Id
	@GeneratedValue
	@Column(name="user_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	@Column(name = "user_no")
	public String getUserNo()
	{
		return userNo;
	}

	public void setUserNo(String userNo)
	{
		this.userNo = userNo;
	}

	public String getIcon()
	{
		return icon;
	}

	public void setIcon(String icon)
	{
		this.icon = icon;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getMobilePhone()
	{
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone)
	{
		this.mobilePhone = mobilePhone;
	}

	public Date getCreateTime()
	{
		return createTime;
	}

	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public Date getRegisterTime()
	{
		return registerTime;
	}

	public void setRegisterTime(Date registerTime)
	{
		this.registerTime = registerTime;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	@Temporal(TemporalType.DATE)
	public Date getCheckCarDate()
	{
		return checkCarDate;
	}

	public void setCheckCarDate(Date checkCarDate)
	{
		this.checkCarDate = checkCarDate;
	}

	@Temporal(TemporalType.DATE)
	public Date getReviewDate()
	{
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate)
	{
		this.reviewDate = reviewDate;
	}

	public int getIsRegister()
	{
		return isRegister;
	}

	public void setIsRegister(int isRegister)
	{
		this.isRegister = isRegister;
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

}
