package com.car.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.model.Appointment;
import com.car.model.Pager;
import com.car.service.AppointmentService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("appointmentAction")
@Scope("protoType")
public class AppointmentAction extends ActionSupport
{
	private static final long serialVersionUID = 7056780785455849821L;

	private Appointment appointment;
	private AppointmentService appointmentService;
	private String userNo;
	private int type;
	private Pager pager;
	private String dateString;
	private int id;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getDateString()
	{
		return dateString;
	}

	public void setDateString(String dateString)
	{
		this.dateString = dateString;
	}

	public String getUserNo()
	{
		return userNo;
	}

	public void setUserNo(String userNo)
	{
		this.userNo = userNo;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	public Pager getPager()
	{
		return pager;
	}

	public void setPager(Pager pager)
	{
		this.pager = pager;
	}

	public Appointment getAppointment()
	{
		return appointment;
	}

	public void setAppointment(Appointment appointment)
	{
		this.appointment = appointment;
	}

	public AppointmentService getAppointmentService()
	{
		return appointmentService;
	}

	@Resource(name = "appointmentService")
	public void setAppointmentService(AppointmentService appointmentService)
	{
		this.appointmentService = appointmentService;
	}

	// 添加预约
	public void addAppointment()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = appointmentService.addAppointment(appointment, dateString);
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

	// 加载用户的洗车预约
	public void loadUserAppointments()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", appointmentService.loadUserAppointments(userNo, type, pager));
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

	// 加载预约次数
	public void loadAppointmentTimes()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("res", appointmentService.loadAppointmentTimes(id, dateString, type));
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

	// 取消预约
	public void cancelAppointment()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = appointmentService.cancelAppointment(appointment);
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
