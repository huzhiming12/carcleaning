package com.car.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AdvertDAO;
import com.car.dao.UserDAO;
import com.car.model.Advert;
import com.car.model.User;

@Component("advertService")
public class AdvertService
{
	private AdvertDAO advertDAO;
	private UserDAO userDAO;

	public AdvertDAO getAdvertDAO()
	{
		return advertDAO;
	}

	@Resource(name = "advertDAO")
	public void setAdvertDAO(AdvertDAO advertDAO)
	{
		this.advertDAO = advertDAO;
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

	@Transactional
	public List<Advert> loadAdverts(int id, int type)
	{
		return advertDAO.loadAdverts(id, type);
	}

}
