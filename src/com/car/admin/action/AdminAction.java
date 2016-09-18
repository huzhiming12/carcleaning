package com.car.admin.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.AStoreService;
import com.car.admin.service.AdminService;
import com.car.model.Admin;
import com.car.model.Pager;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("adminAction")
@Scope("protoType")
public class AdminAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;

	private int id;
	private boolean remember;
	private Admin admin;
	private Pager pager;
	private Date endDate;
	private PagerTool pagerTool;
	private AdminService adminService;
	private AStoreService aStoreService;
	private Map<String, Object> map = new HashMap<>();

	public boolean isRemember()
	{
		return remember;
	}

	public void setRemember(boolean remember)
	{
		this.remember = remember;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public Date getEndDate()
	{
		return endDate;
	}

	public void setEndDate(Date endDate)
	{
		this.endDate = endDate;
	}

	public Admin getAdmin()
	{
		return admin;
	}

	public void setAdmin(Admin admin)
	{
		this.admin = admin;
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

	public Map<String, Object> getMap()
	{
		return map;
	}

	public void setMap(Map<String, Object> map)
	{
		this.map = map;
	}

	public AStoreService getaStoreService()
	{
		return aStoreService;
	}

	@Resource(name = "aStoreService")
	public void setaStoreService(AStoreService aStoreService)
	{
		this.aStoreService = aStoreService;
	}

	public AdminService getAdminService()
	{
		return adminService;
	}

	@Resource(name = "adminService")
	public void setAdminService(AdminService adminService)
	{
		this.adminService = adminService;
	}

	public String adminManager()
	{
		// map.put("stores", aStoreService.loadStores());
		map.put("res", adminService.loadAdmins(pager));
		pagerTool = new PagerTool(pager, "Admin_adminManager");
		return SUCCESS;
	}

	// 添加管理员
	public void addAdmin()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = adminService.addAdmin(admin);
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

	// 添加公司管理员
	public void addCompanyAdmin()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = adminService.addCompanyAdmin(admin, endDate);
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

	// 加载公司店铺账号
	public void loadCompanyStoreAccout()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = adminService.loadCompanyStoreAdmins(id);
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

	// 登录
	public void adminLogin()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = adminService.adminLogin(admin, ServletActionContext.getRequest(),
					ServletActionContext.getResponse(), remember);
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

	// 注销
	public String logout()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("username");
		session.removeAttribute("type");
		session.removeAttribute("company");
		session.removeAttribute("store");
		return "logout";
	}

	public void changeAccountState()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			adminService.changeAccountState(admin);
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
