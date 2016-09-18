package com.car.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.car.model.Car;
import com.car.service.CarService;
import com.car.util.ResultUtils;
import com.opensymphony.xwork2.ActionSupport;

@Component("carAction")
@Scope("protoType")
public class CarAction extends ActionSupport
{
	private static final long serialVersionUID = 4925011665121779454L;

	private Car car;
	private CarService carService;

	public Car getCar()
	{
		return car;
	}

	public void setCar(Car car)
	{
		this.car = car;
	}

	public CarService getCarService()
	{
		return carService;
	}

	@Resource(name = "carService")
	public void setCarService(CarService carService)
	{
		this.carService = carService;
	}

	// 添加车辆信息
	public void addCar()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			carService.addCar(car);
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

	// 获取用户全部车辆信息
	public void userCars()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result.put("status", 200);
			result.put("cars", carService.userCars(car.getUser().getUserNo()));
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

	// 更新车辆品牌
	public void changeCarBrand()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = carService.updateCarBrand(car.getId(), car.getCarBrand());
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

	// 更新车牌号
	public void changeCarNo()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = carService.updateCarNo(car.getId(), car.getCarNo());
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
	
	//删除车辆信息
	public void delCar()
	{
		Map<String, Object> result = new HashMap<>();
		try
		{
			result = carService.delCar(car.getId());
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
