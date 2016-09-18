package com.car.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CarDAO;
import com.car.dao.UserDAO;
import com.car.model.Car;
import com.car.model.User;

@Component("carService")
public class CarService
{
	private CarDAO carDAO;
	private UserDAO userDAO;

	public CarDAO getCarDAO()
	{
		return carDAO;
	}

	@Resource(name = "carDAO")
	public void setCarDAO(CarDAO carDAO)
	{
		this.carDAO = carDAO;
	}

	public UserDAO getUserDAO()
	{
		return userDAO;
	}

	@Resource(name = "userDAO")
	public void setUserDAO(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	// 添加车辆信息
	@Transactional
	public void addCar(Car car)
	{
		User user = car.getUser();
		if (user != null)
		{
			user = userDAO.loadUserByUserNo(user.getUserNo());
		}
		car.setUser(user);
		carDAO.addCar(car);
	}

	// 获取用户车辆信息
	@Transactional
	public List<Car> userCars(String userNo)
	{
		return carDAO.loadCarsByUserNo(userNo);
	}

	// 更新车辆品牌信息
	@Transactional
	public Map<String, Object> updateCarBrand(int carId, String carBrand)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		Car car = carDAO.loadCarById(carId);
		if (car != null)
		{
			car.setCarBrand(carBrand);
			carDAO.updateCarInfo(car);
		} else
		{
			res.put("status", 400);
			res.put("error", "该车辆不存在");
		}
		return res;
	}

	// 更新车辆车牌号码
	@Transactional
	public Map<String, Object> updateCarNo(int carId, String carNo)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		Car car = carDAO.loadCarById(carId);
		if (car != null)
		{
			car.setCarNo(carNo);
			carDAO.updateCarInfo(car);
		} else
		{
			res.put("status", 400);
			res.put("error", "该车辆不存在");
		}
		return res;
	}

	// 删除车辆信息
	@Transactional
	public Map<String, Object> delCar(int carId)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		Car car = carDAO.loadCarById(carId);
		if (car != null)
		{
			car.setState(1);
			carDAO.updateCarInfo(car);
		} else
		{
			res.put("status", 400);
			res.put("error", "该车辆不存在");
		}
		return res;
	}

}
