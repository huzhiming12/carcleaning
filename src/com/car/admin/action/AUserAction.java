package com.car.admin.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.AStoreService;
import com.car.admin.service.AUserService;
import com.car.model.Car;
import com.car.model.Company;
import com.car.model.Pager;
import com.car.model.Store;
import com.car.model.User;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aUserAction")
@Scope("protoType")
public class AUserAction extends ActionSupport
{
	private static final long serialVersionUID = -4957373828918729066L;

	private User user;
	private Car car;
	private String selector;
	private Map<String, Object> map = new HashMap<>();
	private Pager pager;
	private PagerTool pagerTool;
	private AUserService aUserService;
	private AStoreService aStoreService;

	public AStoreService getaStoreService()
	{
		return aStoreService;
	}

	@Resource(name = "aStoreService")
	public void setaStoreService(AStoreService aStoreService)
	{
		this.aStoreService = aStoreService;
	}

	public Map<String, Object> getMap()
	{
		return map;
	}

	public void setMap(Map<String, Object> map)
	{
		this.map = map;
	}

	public Pager getPager()
	{
		return pager;
	}

	public void setPager(Pager pager)
	{
		this.pager = pager;
	}

	public PagerTool getPagerTool()
	{
		return pagerTool;
	}

	public void setPagerTool(PagerTool pagerTool)
	{
		this.pagerTool = pagerTool;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public Car getCar()
	{
		return car;
	}

	public void setCar(Car car)
	{
		this.car = car;
	}

	public String getSelector()
	{
		return selector;
	}

	public void setSelector(String selector)
	{
		this.selector = selector;
	}

	public AUserService getaUserService()
	{
		return aUserService;
	}

	@Resource(name = "aUserService")
	public void setaUserService(AUserService aUserService)
	{
		this.aUserService = aUserService;
	}

	// 添加会员信息
	public void addUser()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			Store store = (Store) session.getAttribute("store");
			if (store != null)
			{
				user.setStore(store);
			}
			result = aUserService.addUser(user, car);
		} catch (NullPointerException e)
		{
			result.put("ststus", 400);
			result.put("error", "参数错误");
		} catch (RuntimeException e)
		{
			result.put("ststus", 400);
			result.put("error", "操作失败，请稍后重试");
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 添加会员信息
	public void delUser()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aUserService.delUser(user.getUserNo());
		} catch (NullPointerException e)
		{
			result.put("ststus", 400);
			result.put("error", "参数错误");
		} catch (RuntimeException e)
		{
			result.put("ststus", 400);
			result.put("error", "操作失败，请稍后重试");
		}
		ResultUtils.toJson(ServletActionContext.getResponse(), result);
	}

	// 用户列表
	public String user()
	{
		selector = "user";
		map.put("res", aUserService.loadUsers(pager));
		pagerTool = new PagerTool(pager, "AUser_user");
		return SUCCESS;
	}

	// 添加会员界面
	public String addUserUI()
	{
		return SUCCESS;
	}

	// 店铺会员列表
	public String storeUser()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Store store = (Store) session.getAttribute("store");
		if (store != null)
		{
			map.put("res", aUserService.loadUsers(store.getId(), 0, pager));
			pagerTool = new PagerTool(pager, "AUser_storeUser");
		}
		return SUCCESS;
	}

	// 公司会员信息
	public String companyUser()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company) session.getAttribute("company");
		if (company != null)
		{
			// 获取店铺列表
			map.put("stores", aStoreService.loadCompanyStores(company.getId()));
			map.put("res", aUserService.loadUsers(company.getId(), 1, pager));
			pagerTool = new PagerTool(pager, "AUser_companyUser");
		}
		return SUCCESS;
	}

}
