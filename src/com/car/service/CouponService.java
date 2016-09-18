package com.car.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CouponDAO;
import com.car.dao.UserDAO;
import com.car.model.Pager;
import com.car.model.User;

@Component("couponService")
public class CouponService
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

	// 加载用户优惠券
	@Transactional
	public Map<String, Object> loadUserCoupons(String userNo, Pager pager)
	{
		User user = userDAO.loadUserByUserNo(userNo);
		return couponDAO.loadStoreCoupon(user.getStore().getId(), pager);
	}

}
