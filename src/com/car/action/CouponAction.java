package com.car.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.model.Pager;
import com.car.service.CouponService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("couponAction")
@Scope("protoType")
public class CouponAction extends ActionSupport
{
	private static final long serialVersionUID = 4925011665121779454L;

	private String userNo;
	private Pager pager;

	private CouponService couponService;

	public String getUserNo()
	{
		return userNo;
	}

	public void setUserNo(String userNo)
	{
		this.userNo = userNo;
	}

	public Pager getPager()
	{
		return pager;
	}

	public void setPager(Pager pager)
	{
		this.pager = pager;
	}

	public CouponService getCouponService()
	{
		return couponService;
	}

	@Resource(name = "couponService")
	public void setCouponService(CouponService couponService)
	{
		this.couponService = couponService;
	}

	// 加载用户优惠券
	public void loadUserCoupons()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", couponService.loadUserCoupons(userNo, pager));
		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

}
