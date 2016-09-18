package com.car.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.StoreDAO;
import com.car.dao.UserDAO;
import com.car.model.Pager;
import com.car.model.Store;
import com.car.model.StoreSer;
import com.car.model.User;

@Component("storeService")
public class StoreService
{
	private StoreDAO storeDAO;
	private UserDAO userDAO;

	public StoreDAO getStoreDAO()
	{
		return storeDAO;
	}

	@Resource(name = "storeDAO")
	public void setStoreDAO(StoreDAO storeDAO)
	{
		this.storeDAO = storeDAO;
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

	// 用户加载所有店铺信息
	@Transactional
	public Map<String, Object> loadStores(String userNo, Pager pager)
	{
		User user = userDAO.loadUserByUserNo(userNo);
		return storeDAO.loadCompanyStores(user.getStore().getCompany().getId(), pager);
	}

	// 店铺详情
	@Transactional
	public Map<String, Object> storeDetail(int storeId)
	{
		Map<String, Object> res = new HashMap<>();
		Store store = storeDAO.loadStoreById(storeId);
		List<StoreSer> storeSers = storeDAO.loadStoreSers(storeId);
		res.put("store", store);
		res.put("storeSer", storeSers);
		return res;
	}

}
