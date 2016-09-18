package com.car.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CarDAO;
import com.car.dao.UserDAO;
import com.car.model.Car;
import com.car.model.User;
import com.car.util.Config;
import com.car.util.DateUtil;
import com.car.util.FileUtils;
import com.car.util.Md5Utils;

@Component("userService")
public class UserService
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

	// 用户注册APP
	@Transactional
	public Map<String, Object> userRegister(User user)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User ouser = userDAO.loadUserByUserNo(user.getUserNo());
		if (ouser != null)
		{
			if (ouser.getState() != 0)
			{
				res.put("status", 400);
				res.put("error", "该卡号已注册！");
				return res;
			}
			// 加密
			ouser.setPassword(Md5Utils.encodeByMD5(user.getPassword()));
			// 更新用户状态
			ouser.setIsRegister(1);
			ouser.setRegisterTime(new Date());
			userDAO.updateUserInfo(ouser);
		} else
		{
			res.put("status", 400);
			res.put("error", "会员卡号不存在！");
		}
		return res;
	}

	// 检测会员卡号状态
	@Transactional
	public Map<String, Object> checkUserNo(String userNo)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user == null)
		{
			// 会员账号不存在
			res.put("res", 0);
		} else
		{
			// 卡号还未被注册app
			if (user.getState() == 0)
				res.put("res", 1);
			else if (user.getState() == 1)
				// 卡号已注册该app
				res.put("res", 2);
		}
		return res;
	}

	// 用户登录
	@Transactional
	public Map<String, Object> userLogin(User user)
	{
		Map<String, Object> res = new HashMap<>();
		User tempUser = userDAO.loadUserByUserNo(user.getUserNo());
		// 用户存在 且已经注册
		if (tempUser != null && tempUser.getIsRegister() == 1)
		{
			// 密码正确
			if (tempUser.getPassword().equals(Md5Utils.encodeByMD5(user.getPassword())))
			{
				res.put("status", 200);
			} else
			{
				res.put("status", 400);
				res.put("error", "密码错误！");
			}
		} else
		{
			res.put("status", 400);
			res.put("error", "账号不存在");
		}
		return res;
	}

	// 用户信息
	@Transactional
	public Map<String, Object> userInfo(String userNo)
	{
		User user = userDAO.loadUserByUserNo(userNo);
		List<Car> cars = carDAO.loadCarsByUserNo(userNo);
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		res.put("user", user);
		if (cars != null && cars.size() > 0)
			res.put("car", cars.get(0));

		return res;
	}

	// 上传文件
	@Transactional
	public Map<String, Object> uploadFile(File file, String filename)
	{
		String path = Config.RES_PATH + Config.USER_ICON;

		filename = System.currentTimeMillis() + "_" + new Random().nextInt(10000) + "."
				+ FileUtils.getExtensionName(filename);
		// 上传文件
		boolean res1 = FileUtils.uploadFile(file, path, filename);
		Map<String, Object> map = new HashMap<>();

		if (res1)
		{
			map.put("status", 200);
			map.put("res", Config.USER_ICON + filename);
		} else
		{
			map.put("status", 400);
			map.put("error", "文件有误,上传失败");
		}
		return map;
	}

	// 更新头像
	@Transactional
	public Map<String, Object> changeIcon(String userNo, String icon)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setIcon(icon);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新用户名
	@Transactional
	public Map<String, Object> changeUsername(String userNo, String username)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setUsername(username);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新真实姓名
	@Transactional
	public Map<String, Object> changeName(String userNo, String name)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setName(name);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新用户的手机号
	@Transactional
	public Map<String, Object> changeMobilePhone(String userNo, String mobilePhone)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setMobilePhone(mobilePhone);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新检车时间
	@Transactional
	public Map<String, Object> changeCheckCarDate(String userNo, String dateString)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			Date date = DateUtil.stringToDate(dateString);
			user.setCheckCarDate(date);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新审本时间
	@Transactional
	public Map<String, Object> changeReviewDate(String userNo, String dateString)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			Date date = DateUtil.stringToDate(dateString);
			user.setReviewDate(date);
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 更新用户密码
	@Transactional
	public Map<String, Object> changePassword(String userNo, String pwd, String oldPwd)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			if (!user.getPassword().equals(Md5Utils.encodeByMD5(oldPwd)))
			{
				res.put("status", 400);
				res.put("error", "原密码不正确！");
			} else
			{
				user.setPassword(Md5Utils.encodeByMD5(pwd));
				userDAO.updateUserInfo(user);
			}
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

	// 找回密码
	@Transactional
	public Map<String, Object> findPassword(String userNo, String pwd)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		User user = userDAO.loadUserByUserNo(userNo);
		if (user != null)
		{
			user.setPassword(Md5Utils.encodeByMD5(pwd));
			userDAO.updateUserInfo(user);
		} else
		{
			res.put("status", 400);
			res.put("error", "用户不存在");
		}
		return res;
	}

}
