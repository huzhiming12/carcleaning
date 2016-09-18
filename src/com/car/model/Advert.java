package com.car.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 
 * 广告信息
 *
 */
@Entity
@Table(name = "t_advert")
public class Advert
{
	private int id;
	// 广告图片
	private String adPic;
	//广告详情图片
	private String adDetail;
	// 状态
	private int state;
	// 展示时间（上架时间）
	private Date showTime;
	// 创建时间
	private Date createTime;
	// 所属公司
	private Company company;
	// 所属店铺
	private Store store;

	@Id
	@GeneratedValue
	@Column(name = "ad_id")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getAdPic()
	{
		return adPic;
	}

	public void setAdPic(String adPic)
	{
		this.adPic = adPic;
	}

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
	}

	@Temporal(TemporalType.DATE)
	public Date getShowTime()
	{
		return showTime;
	}

	public void setShowTime(Date showTime)
	{
		this.showTime = showTime;
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
	@JoinColumn(name = "company_id", referencedColumnName = "company_id")
	public Company getCompany()
	{
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
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

	public String getAdDetail()
	{
		return adDetail;
	}

	public void setAdDetail(String adDetail)
	{
		this.adDetail = adDetail;
	}
	
	

}
