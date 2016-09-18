package com.car.admin.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.ACouponService;
import com.car.model.Coupon;
import com.car.model.Store;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aCouponAction")
@Scope("protoType")
public class ACouponAction extends ActionSupport
{
	private static final long serialVersionUID = 2395847800023178798L;
	private Coupon coupon;

	private ACouponService aCouponService;

	public Coupon getCoupon()
	{
		return coupon;
	}

	public void setCoupon(Coupon coupon)
	{
		this.coupon = coupon;
	}

	public ACouponService getaCouponService()
	{
		return aCouponService;
	}

	@Resource(name = "aCouponService")
	public void setaCouponService(ACouponService aCouponService)
	{
		this.aCouponService = aCouponService;
	}

	// 添加优惠券
	public void addCoupon()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			Store store = (Store) session.getAttribute("store");
			if (store != null)
			{
				result.put("status", 200);
				coupon.setStore(store);
				aCouponService.addCoupon(coupon);
			} else
			{
				result.put("status", 400);
				result.put("error", "登录超时，请重新登录！");
			}

		} catch (NullPointerException e)
		{
			result.put("status", 400);
			result.put("error", "参数错误");
			e.printStackTrace();
		} catch (RuntimeException e)
		{
			result.put("status", 400);
			result.put("error", "操作失败，请稍后重试");
			e.printStackTrace();
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 店铺优惠券
	public String storeCoupon()
	{
		return SUCCESS;
	}

}
