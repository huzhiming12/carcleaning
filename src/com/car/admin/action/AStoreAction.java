package com.car.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.AStoreService;
import com.car.model.Company;
import com.car.model.Pager;
import com.car.model.Store;
import com.car.model.StoreSer;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aStoreAction")
@Scope("protoType")
public class AStoreAction extends ActionSupport
{
	private static final long serialVersionUID = -4957373828918729066L;

	// 上传文件集合
	private File file;
	// 上传文件名集合
	private String fileFileName;
	// 上传文件内容类型集合
	private String fileContentType;
	private Store store;
	private StoreSer storeSer;
	private AStoreService aStoreService;
	private Map<String, Object> map = new HashMap<>();
	private Pager pager;
	private PagerTool pagerTool;
	private int lotId;
	private int flag;
	private int companyId;

	public int getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(int companyId)
	{
		this.companyId = companyId;
	}

	public int getFlag()
	{
		return flag;
	}

	public void setFlag(int flag)
	{
		this.flag = flag;
	}

	public int getLotId()
	{
		return lotId;
	}

	public void setLotId(int lotId)
	{
		this.lotId = lotId;
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

	public StoreSer getStoreSer()
	{
		return storeSer;
	}

	public void setStoreSer(StoreSer storeSer)
	{
		this.storeSer = storeSer;
	}

	public File getFile()
	{
		return file;
	}

	public void setFile(File file)
	{
		this.file = file;
	}

	public String getFileFileName()
	{
		return fileFileName;
	}

	public void setFileFileName(String fileFileName)
	{
		this.fileFileName = fileFileName;
	}

	public String getFileContentType()
	{
		return fileContentType;
	}

	public void setFileContentType(String fileContentType)
	{
		this.fileContentType = fileContentType;
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

	public Store getStore()
	{
		return store;
	}

	public void setStore(Store store)
	{
		this.store = store;
	}

	// 添加店铺服务
	public void addStore()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			if (store.getCompany() == null)
			{
				HttpSession session = ServletActionContext.getRequest().getSession();
				Company company = (Company) session.getAttribute("company");
				if (company != null)
				{
					store.setCompany(company);
					aStoreService.addStore(store, file, fileFileName);
				} else
				{
					result.put("status", 400);
					result.put("error", "登录超时,请重新登录!");
				}
			} else
			{
				aStoreService.addStore(store, file, fileFileName);
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

	// 添加店铺服务
	public void addStoreSer()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			HttpSession session = ServletActionContext.getRequest().getSession();
			Store store = (Store) session.getAttribute("store");
			if (store != null)
			{
				storeSer.setStore(store);
				result = aStoreService.addStoreSer(storeSer, file, fileFileName);
			} else
			{
				result.put("status", 400);
				result.put("error", "登录超时,请重新登录!");
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

	// 店铺服务列表
	public String storeSer()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Store store = (Store) session.getAttribute("store");
		if (store != null)
		{
			map.put("res", aStoreService.loadStoreSers(store.getId(), pager));
			pagerTool = new PagerTool(pager, "AStore_storeSer");
		}
		return SUCCESS;
	}

	// 公司店铺列表
	public String companyStore()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company) session.getAttribute("company");
		if (company != null)
		{
			// 加载店铺信息
			map.put("res", aStoreService.loadCompanyStores(company.getId(), pager));
			pagerTool = new PagerTool(pager, "AStore_companyStore");
		}
		return SUCCESS;
	}

	// 公司的所有店铺服务
	public String companyStoreSer()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company) session.getAttribute("company");
		if (company != null)
		{
			map.put("res", aStoreService.loadCompanyStoreSer(company.getId(), pager));
			pagerTool = new PagerTool(pager, "AStore_companyStoreSer");
		}
		return SUCCESS;
	}

	// 加载所有店铺列表
	public void loadStores()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", aStoreService.loadStores());
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

	// 加载公司店铺
	public void loadCompanyStores()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", aStoreService.loadCompanyStores(companyId));
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

	// 车位界面
	public String lock()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Store store = (Store) session.getAttribute("store");
		if (store != null)
		{
			map.put("lots", aStoreService.loadStoreParkingLot(store.getId()));
		}
		return SUCCESS;
	}

	// 锁定（解锁）车位
	public void lockParkingLot()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = aStoreService.lockParkingLot(lotId, flag);
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

	// 删除店铺
	public void delStore()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aStoreService.delStore(store);
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

	// 删除店铺服务
	public void delStoreSer()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aStoreService.delStoreSer(storeSer);
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

}
