package com.car.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.car.dao.CompanyDAO;
import com.car.model.Company;
import com.car.model.Coupon;
import com.car.model.Pager;
import com.car.util.Config;

@Component("companyDAO")
public class CompanyDAOImpl implements CompanyDAO
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

	// 添加公司信息
	@Override
	public void addCompany(Company company)
	{
		dataDAO.addItem(company);
	}

	// 加载公司
	@Override
	public List<Company> loadCompanys()
	{
		String hql = "from Company c where c.state=0";
		return dataDAO.loadItems(hql);
	}

	@Override
	public Map<String, Object> loadCompanys(Pager pager)
	{
		pager.setPageSize(Config.ADMIN_PAGER_SIZE);
		String str = "from Company c where c.state=0";

		String hql = str;
		List<Coupon> coupons = dataDAO.loadItems(hql, pager);
		hql = "select count(*) " + str;
		pager.setTotalNum(dataDAO.loadItemsNum(hql));
		pager.caculatePageNum();
		Map<String, Object> res = new HashMap<>();
		res.put("companys", coupons);
		res.put("pager", pager);
		return res;
	}

	@Override
	public Company loadCompanyById(int companyId)
	{
		String hql = "from Company c where c.id= " + companyId;
		List<Company> companies = dataDAO.loadItems(hql);
		if (companies != null && companies.size() > 0)
		{
			return companies.get(0);
		}
		return null;
	}

	@Override
	public void updateCompany(Company company)
	{
		dataDAO.updateItem(company);
	}

}
