package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Admin;
import com.car.model.Pager;

public interface AdminDAO
{
	// 添加管理员
	public void addAdmin(Admin admin);

	// 查询管理员
	public Admin loadAdminByUsername(String usesrname);

	// 加载平台管理员
	public Map<String, Object> loadAdmins(Pager pager);

	// 加载公司管理员
	public List<Admin> loadCompanyAdmins(int companyId);

	// 加载公司下面的所有店铺管理员
	public List<Admin> loadStoreAdminsByCompanyId(int companyId);

	// 更新admin
	public void updateAdmin(Admin admin);

	// 删除店铺管理员
	public void delStoreAdmin(int storeId);

}
