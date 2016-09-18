package com.car.admin.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.admin.service.AAppointmentService;
import com.car.model.Appointment;
import com.car.model.Company;
import com.car.model.Pager;
import com.car.model.Store;
import com.car.util.PagerTool;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("aAppointAction")
@Scope("protoType")
public class AAppointmentAction extends ActionSupport
{
	private static final long serialVersionUID = 1L;
	private int storeId;
	private int parkNo;
	private Map<String, Object> map = new HashMap<>();
	private Appointment appointment;
	private Pager pager;
	private PagerTool pagerTool;
	private AAppointmentService aAppointmentService;

	public int getStoreId()
	{
		return storeId;
	}

	public void setStoreId(int storeId)
	{
		this.storeId = storeId;
	}

	public int getParkNo()
	{
		return parkNo;
	}

	public void setParkNo(int parkNo)
	{
		this.parkNo = parkNo;
	}

	public AAppointmentService getaAppointmentService()
	{
		return aAppointmentService;
	}

	@Resource(name = "aAppointmentService")
	public void setaAppointmentService(AAppointmentService aAppointmentService)
	{
		this.aAppointmentService = aAppointmentService;
	}

	public Appointment getAppointment()
	{
		return appointment;
	}

	public void setAppointment(Appointment appointment)
	{
		this.appointment = appointment;
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

	public String appointment()
	{
		map.put("res", aAppointmentService.loadAppoints(pager));
		pagerTool = new PagerTool(pager, "AAppointment_appointment");
		// selector = "appointment";
		return SUCCESS;
	}

	// 车位预约记录
	public void loadLotAppointment()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", aAppointmentService.loadLotAppointment(storeId, parkNo));
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

	// 店铺预约信息
	public String storeAppointment()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Store store = (Store) session.getAttribute("store");
		if (store != null)
		{
			map.put("res", aAppointmentService.loadStoreAppoints(store.getId(), 0, pager));
			pagerTool = new PagerTool(pager, "AAppointment_storeAppointment");
		}
		return SUCCESS;
	}

	// 店铺预约记录
	public String storeAppointmentRecord()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Store store = (Store) session.getAttribute("store");
		if (store != null)
		{
			map.put("res", aAppointmentService.loadStoreAppoints(store.getId(), 1, pager));
			pagerTool = new PagerTool(pager, "AAppointment_storeAppointmentRecord");
		}
		return SUCCESS;
	}

	// 公司的预约信息
	public String companyAppointment()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company) session.getAttribute("company");
		if (company != null)
		{
			map.put("res", aAppointmentService.loadCompanyAppoints(company.getId(), 0, pager));
			pagerTool = new PagerTool(pager, "AAppointment_companyAppointment");
		}
		return SUCCESS;
	}

	// 公司预约记录
	public String companyAppointRecord()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company) session.getAttribute("company");
		if (company != null)
		{
			map.put("res", aAppointmentService.loadCompanyAppoints(company.getId(), 1, pager));
			pagerTool = new PagerTool(pager, "AAppointment_companyAppointRecord");
		}
		return SUCCESS;
	}

	public void closeAppointment()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			aAppointmentService.closeAppointment(appointment);
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

	public void delayAppointment()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = aAppointmentService.delayAppointment(appointment);
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
