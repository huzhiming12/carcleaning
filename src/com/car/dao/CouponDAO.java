package com.car.dao;

import java.util.Map;

import com.car.model.Coupon;
import com.car.model.Pager;

public interface CouponDAO
{
	// 添加优惠券
	public void addCoupon(Coupon coupon);

	// 加载店铺的优惠券 type:0 未过期的 1：已过期的
	public Map<String, Object> loadStoreCoupon(int storeId,Pager pager);
	
	//移除过期的优惠券
	public void removeCoupons();
}
