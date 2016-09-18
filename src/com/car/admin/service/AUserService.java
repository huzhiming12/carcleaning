package com.car.admin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CarDAO;
import com.car.dao.UserDAO;
import com.car.jiguang.utils.JGPush;
import com.car.model.Car;
import com.car.model.Pager;
import com.car.model.User;

@Component("aUserService")
public class AUserService
{
	private UserDAO userDAO;
	private CarDAO carDAO;

	public UserDAO getUserDAO()
	{
		return userDAO;
	}

	@Resource(name = "userDAO")
	public void setUserDAO(UserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	public CarDAO getCarDAO()
	{
		return carDAO;
	}

	@Resource(name = "carDAO")
	public void setCarDAO(CarDAO carDAO)
	{
		this.carDAO = carDAO;
	}

	// 添加会员
	@Transactional
	public Map<String, Object> addUser(User user, Car car)
	{
		Map<String, Object> res = new HashMap<>();
		User tempUser = userDAO.loadUserByUserNo(user.getUserNo());
		// 会员卡号不存在
		if (tempUser == null)
		{
			user.setCreateTime(new Date());
			userDAO.addUser(user);
			car.setUser(user);
			carDAO.addCar(car);
			res.put("status", 200);
		} else
		{
			res.put("status", 400);
			res.put("error", "该卡号已存在");
		}
		return res;
	}

	// 删除用户
	@Transactional
	public void delUser(String userNo)
	{
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setState(1);
			userDAO.updateUserInfo(user);
		}

	}

	// 加载会员列表
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> loadUsers(Pager pager)
	{
		Map<String, Object> map = userDAO.loadUsers(pager);
		List<User> users = (List<User>) map.get("users");
		List<Map<String, Object>> list = new ArrayList<>();
		for (User user : users)
		{
			List<Car> cars = carDAO.loadCarsByUserNo(user.getUserNo());
			// System.out.println(cars.get(0).getCarNo());
			Map<String, Object> teMap = new HashMap<>();
			teMap.put("user", user);
			teMap.put("userCars", cars);
			if (cars != null && cars.size() > 0)
				teMap.put("car", cars.get(0));
			list.add(teMap);
		}
		map.put("users", list);
		return map;
	}

	// 加载会员列表 type 0:店铺会员 1：公司会员
	@SuppressWarnings("unchecked")
	@Transactional
	public Map<String, Object> loadUsers(int id, int type, Pager pager)
	{
		Map<String, Object> map = userDAO.loadUsers(id, type, pager);
		List<User> users = (List<User>) map.get("users");
		List<Map<String, Object>> list = new ArrayList<>();
		for (User user : users)
		{
			List<Car> cars = carDAO.loadCarsByUserNo(user.getUserNo());
			Map<String, Object> teMap = new HashMap<>();
			teMap.put("user", user);
			teMap.put("userCars", cars);
			if (cars != null && cars.size() > 0)
				teMap.put("car", cars.get(0));
			list.add(teMap);
		}
		map.put("users", list);
		return map;
	}

	// 定时推送 检车时间和审车时间
	@Transactional
	public void pushMsg()
	{
		List<User> users1 = userDAO.loadCheckCarDateUser();
		List<User> users2 = userDAO.loadReviewDateUser();
		for (User user : users1)
		{
			System.out.println(user.getUserNo());
			JGPush.JGPushMsg(user.getUserNo(), "检车时间到了，请及时检车");
		}

		for (User user : users2)
		{
			System.out.println(user.getUserNo());
			JGPush.JGPushMsg(user.getUserNo(), "审本时间到了，请及时审本");
		}
	}
}
