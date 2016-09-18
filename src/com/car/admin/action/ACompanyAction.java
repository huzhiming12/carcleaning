package com.car.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.ACompanyService;
import com.car.admin.service.AStoreService;
import com.car.admin.service.AdminService;
import com.car.model.Company;
import com.car.model.Pager;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aCompanyAction")
@Scope("protoType")
public class ACompanyAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;

	private int cid;
	private Company company;
	private Pager pager;
	private PagerTool pagerTool;
	private Map<String, Object> map = new HashMap<>();
	private ACompanyService aCompanyService;
	private AdminService adminService;
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

	public int getCid()
	{
		return cid;
	}

	public void setCid(int cid)
	{
		this.cid = cid;
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

	public Company getCompany()
	{
		return company;
	}

	public void setCompany(Company company)
	{
		this.company = company;
	}

	public ACompanyService getaCompanyService()
	{
		return aCompanyService;
	}

	@Resource(name = "aCompanyService")
	public void setaCompanyService(ACompanyService aCompanyService)
	{
		this.aCompanyService = aCompanyService;
	}

	// 添加公司
	public void addCompany()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aCompanyService.addCompany(company);
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

	// 加载所有公司
	public void loadCompanys()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", aCompanyService.loadCompanys());
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

	// 修改服务期限
	public void changeSerTime()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aCompanyService.changeSerTime(company);
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

	// 公司（商家）管理
	public String companyManager()
	{
		map.put("res", aCompanyService.loadCompanys(pager));
		map.put("companys", aCompanyService.loadCompanys());
		pagerTool = new PagerTool(pager, "ACompany_companyManager");
		return SUCCESS;
	}

	// 公司账号管理
	public String accountManager()
	{
		List<Company> companies = aCompanyService.loadCompanys();
		if (companies != null && companies.size() > 0)
		{
			if (cid == 0)
				cid = companies.get(0).getId();
			map.put("accounts", adminService.loadCompanyStoreAdmins(cid));
			for (Company company : companies)
			{
				if (company.getId() == cid)
				{
					map.put("company", company);
					break;
				}
			}
		}
		map.put("companys", aCompanyService.loadCompanys());
		map.put("stores", aStoreService.loadStores());
		return SUCCESS;
	}

}
