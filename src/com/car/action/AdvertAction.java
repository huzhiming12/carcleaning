package com.car.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.service.AdvertService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("advertAction")
@Scope("protoType")
public class AdvertAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;

	private int id;
	private int type;
	private AdvertService advertService;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public AdvertService getAdvertService()
	{
		return advertService;
	}

	@Resource(name = "advertService")
	public void setAdvertService(AdvertService advertService)
	{
		this.advertService = advertService;
	}

	public void loadAdverts()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("adverts", advertService.loadAdverts(id, type));
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
