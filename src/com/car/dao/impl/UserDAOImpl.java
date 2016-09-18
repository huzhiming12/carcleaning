package com.car.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.UserDAO;
import com.car.model.Pager;
import com.car.model.User;
import com.car.util.Config;
import com.car.util.DateUtil;

@Component("userDAO")
public class UserDAOImpl implements UserDAO
{
	private DataDAO dataDAO;

	public DataDAO getDataDAO()
	{
		return dataDAO;
	}

	@Resource(name = "dataDAO")
	public void setDataDAO(DataDAO dataDAO)
	{
		this.dataDAO = dataDAO;
	}

	// 添加会员信息
	@Override
	public void addUser(User user)
	{
		dataDAO.addItem(user);
	}

	// 查询用户信息
	@Override
	public User loadUserByUserNo(String UserNo)
	{
		String hql = "from User u where u.userNo ='" + UserNo + "' and u.state=0";
		List<User> users = dataDAO.loadItems(hql);
		if (users != null && users.size() > 0)
		{
			return users.get(0);
		}
		return null;
	}

	// 更新用户信息
	@Override
	public void updateUserInfo(User user)
	{
		dataDAO.updateItem(user);
	}

	// 加载用户列表
	@Override
	public List<User> loadUsers(int flag)
	{
		String hql = " from User u where u.state=" + flag;
		return dataDAO.loadItems(hql);
	}

	@Override
	public Map<String, Object> loadUsers(Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		Map<String, String> condtion = pager.getCondition();
		String keyword = condtion.get("keyword");
		String str = "where u.userNo!='' ";
		if (keyword != null && !"".equals(keyword))
		{
			str += " and (u.userNo like '%" + keyword + "%' or u.name like '%" + keyword + "%' or u.mobilePhone like '%"
					+ keyword + "%')";
		}
		String hql = " from User u " + str;
		List<User> users = dataDAO.loadItems(hql, pager);
		hql = "select count(*) from User u " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("users", users);
		res.put("pager", pager);
		return res;
	}

	// 加载公司或者店铺会员信息 type 0:店铺会员 1：公司会员
	@Override
	public Map<String, Object> loadUsers(int id, int type, Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		Map<String, String> condtion = pager.getCondition();
		String keyword = condtion.get("keyword");
		String str = "from User u where u.state=0";
		// 店铺会员
		if (type == 0)
			str += " and u.store.id=" + id;
		// 公司会员
		else if (type == 1)
			str += " and u.store.company.id=" + id;

		if (keyword != null && !"".equals(keyword))
		{
			str += " and (u.userNo like '%" + keyword + "%' or u.name like '%" + keyword + "%' or u.mobilePhone like '%"
					+ keyword + "%')";
		}
		String hql = str + " order by u.createTime desc";
		List<User> users = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;

		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("users", users);
		res.put("pager", pager);
		return res;
	}

	@Override
	public List<User> loadCheckCarDateUser()
	{
		Date now = new Date();
		Date path = new Date(now.getTime() + 24 * 60 * 60 * 1000);
		String pathTime = DateUtil.DateToString(path, "yyyy-MM-dd");
		String hql = "from User u where u.checkCarDate='" + pathTime + "' and u.state=0";
		return dataDAO.loadItems(hql);
	}

	@Override
	public List<User> loadReviewDateUser()
	{
		Date now = new Date();
		Date path = new Date(now.getTime() + 24 * 60 * 60 * 1000);
		String pathTime = DateUtil.DateToString(path, "yyyy-MM-dd");
		String hql = "from User u where u.reviewDate='" + pathTime + "' and u.state=0";
		return dataDAO.loadItems(hql);
	}

}
