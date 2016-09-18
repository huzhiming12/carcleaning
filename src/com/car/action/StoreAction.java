package com.car.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.model.Pager;
import com.car.model.Store;
import com.car.service.StoreService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("storeAction")
@Scope("protoType")
public class StoreAction extends ActionSupport
{
	private static final long serialVersionUID = 4925011665121779454L;

	private Pager pager;
	private StoreService storeService;
	private Store store;
	private String userNo;

	public String getUserNo()
	{
		return userNo;
	}

	public void setUserNo(String userNo)
	{
		this.userNo = userNo;
	}

	public Store getStore()
	{
		return store;
	}

	public void setStore(Store store)
	{
		this.store = store;
	}

	public Pager getPager()
	{
		return pager;
	}

	public void setPager(Pager pager)
	{
		this.pager = pager;
	}

	public StoreService getStoreService()
	{
		return storeService;
	}

	@Resource(name = "storeService")
	public void setStoreService(StoreService storeService)
	{
		this.storeService = storeService;
	}

	// 加载店铺列表
	public void loadStores()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", storeService.loadStores(userNo,pager));
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

	// 店铺详情
	public void storeDetail()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", storeService.storeDetail(store.getId()));
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
