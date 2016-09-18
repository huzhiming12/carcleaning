package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Pager;
import com.car.model.User;

public interface UserDAO
{
	// 用户注册
	public void addUser(User user);

	// 通过会员卡号查找用户信息
	public User loadUserByUserNo(String UserNo);

	// 更新用户信息
	public void updateUserInfo(User user);

	// 加载公司或者店铺会员信息 type 0:店铺会员 1：公司会员
	public Map<String, Object> loadUsers(int id, int type, Pager pager);

	public Map<String, Object> loadUsers(Pager pager);

	// 加载用户列表
	public List<User> loadUsers(int flag);

	// 加载检车日期到了的用户
	public List<User> loadCheckCarDateUser();

	// 加载审车日期到了的用户
	public List<User> loadReviewDateUser();

}
