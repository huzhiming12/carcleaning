package com.car.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.CompanyDAO;
import com.car.model.Company;
import com.car.model.Pager;

@Component("aCompanyService")
public class ACompanyService
{
	private CompanyDAO companyDAO;

	public CompanyDAO getCompanyDAO()
	{
		return companyDAO;
	}

	@Resource(name = "companyDAO")
	public void setCompanyDAO(CompanyDAO companyDAO)
	{
		this.companyDAO = companyDAO;
	}

	// 添加公司
	@Transactional
	public void addCompany(Company company)
	{
		companyDAO.addCompany(company);
	}

	// 加载所有公司
	@Transactional
	public List<Company> loadCompanys()
	{
		return companyDAO.loadCompanys();
	}

	//加载所有公司
	@Transactional
	public Map<String, Object> loadCompanys(Pager pager)
	{
		return companyDAO.loadCompanys(pager);
	}
	
	//修改公司账号的服务期限
	@Transactional
	public void changeSerTime(Company company)
	{
		Company company2 = companyDAO.loadCompanyById(company.getId());
		company2.setEndDate(company.getEndDate());
		companyDAO.updateCompany(company2);
	}
}
