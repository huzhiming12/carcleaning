package com.car.admin.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CouponDAO;
import com.car.dao.UserDAO;
import com.car.model.Coupon;

@Component("aCouponService")
public class ACouponService
{
	private CouponDAO couponDAO;
	private UserDAO userDAO;

	public UserDAO getUserDAO()
	{
		return userDAO;
	}

	@Resource(name = "userDAO")
	public void setUserDAO(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	public CouponDAO getCouponDAO()
	{
		return couponDAO;
	}

	@Resource(name = "couponDAO")
	public void setCouponDAO(CouponDAO couponDAO)
	{
		this.couponDAO = couponDAO;
	}

	// 添加优惠券
	@Transactional
	public void addCoupon(Coupon coupon)
	{
		coupon.setCreateTime(new Date());
		couponDAO.addCoupon(coupon);
	}
	
	//定时移除过期的优惠券
	@Transactional
	public void removeCoupons()
	{
		couponDAO.removeCoupons();
	}

}
