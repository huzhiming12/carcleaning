package com.car.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.AdminDAO;
import com.car.model.Admin;
import com.car.model.Pager;
import com.car.util.Config;

@Component("adminDAO")
public class AdminDAOImpl implements AdminDAO
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

	// 添加管理员
	@Override
	public void addAdmin(Admin admin)
	{
		dataDAO.addItem(admin);
	}

	// 查询管理员
	@Override
	public Admin loadAdminByUsername(String usesrname)
	{
		String hql = "from Admin a where (a.state=0 or a.state=1) and a.username='" + usesrname + "'";
		List<Admin> admins = dataDAO.loadItems(hql);
		if (admins != null && admins.size() > 0)
		{
			return admins.get(0);
		}
		return null;
	}

	// 加载平台管理员
	@Override
	public Map<String, Object> loadAdmins(Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String str = "from Admin a where (a.state=0 or a.state=1) and (a.type=0 or a.type=3 or a.type=4)";
		String hql = str ;
		List<Admin> admins = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();

		Map<String, Object> res = new HashMap<>();
		res.put("admins", admins);
		res.put("pager", pager);
		return res;
	}

	//加载公司管理员
	@Override
	public List<Admin> loadCompanyAdmins(int companyId)
	{
		String hql = " from Admin a where a.company.id=" + companyId;
		return dataDAO.loadItems(hql);
	}

	//加载公司下面的所有店铺管理员
	@Override
	public List<Admin> loadStoreAdminsByCompanyId(int companyId)
	{
		String hql = " from Admin a where a.store.company.id=" + companyId;
		return dataDAO.loadItems(hql);
	}

	@Override
	public void updateAdmin(Admin admin)
	{
		dataDAO.updateItem(admin);
	}

	@Override
	public void delStoreAdmin(int storeId)
	{
		String hql = " update Admin a set a.state=1 where a.store.id=" + storeId;
		dataDAO.updateData(hql);
	}

}
