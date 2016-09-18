package com.car.dao;

import java.util.List;
import java.util.Map;

import com.car.model.Company;
import com.car.model.Pager;

public interface CompanyDAO
{
	// 添加公司信息
	public void addCompany(Company company);

	// 加载所有公司列表
	public List<Company> loadCompanys();

	// 加载公司列表
	public Map<String, Object> loadCompanys(Pager pager);
	
	//查找
	public Company loadCompanyById(int companyId);
	
	public void updateCompany(Company company);
}
