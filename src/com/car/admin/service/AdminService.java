package com.car.admin.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.car.dao.AdminDAO;
import com.car.dao.CompanyDAO;
import com.car.model.Admin;
import com.car.model.Company;
import com.car.model.Pager;
import com.car.util.Config;
import com.car.util.Md5Utils;

@Component("adminService")
public class AdminService
{
	private AdminDAO adminDAO;
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

	public AdminDAO getAdminDAO()
	{
		return adminDAO;
	}

	@Resource(name = "adminDAO")
	public void setAdminDAO(AdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}

	// 添加管理员
	@Transactional
	public Map<String, Object> addAdmin(Admin admin)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		Admin temp = adminDAO.loadAdminByUsername(admin.getUsername());
		if (temp != null)
		{
			res.put("status", 400);
			res.put("error", "该用户名已存在！");
			return res;
		}
		admin.setPassword(Md5Utils.encodeByMD5(admin.getPassword()));
		adminDAO.addAdmin(admin);
		return res;
	}

	// 添加公司管理员
	@Transactional
	public Map<String, Object> addCompanyAdmin(Admin admin, Date date)
	{
		List<Admin> admins = adminDAO.loadCompanyAdmins(admin.getCompany().getId());
		if (admins != null && admins.size() >= 1)
		{
			Map<String, Object> res = new HashMap<>();
			res.put("status", 400);
			res.put("error", "该公司已有账号，不能添加！");
			return res;
		}
		Company company = companyDAO.loadCompanyById(admin.getCompany().getId());
		company.setEndDate(date);
		companyDAO.updateCompany(company);
		return addAdmin(admin);
	}

	// 加载平台管理员
	@Transactional
	public Map<String, Object> loadAdmins(Pager pager)
	{
		return adminDAO.loadAdmins(pager);
	}

	// 加载公司管理员和店铺管理员
	@Transactional
	public Map<String, Object> loadCompanyStoreAdmins(int companyId)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		res.put("companyAdmin", adminDAO.loadCompanyAdmins(companyId));
		res.put("storeAdmin", adminDAO.loadStoreAdminsByCompanyId(companyId));
		return res;
	}

	// 登录
	@Transactional
	public Map<String, Object> adminLogin(Admin admin, HttpServletRequest request, HttpServletResponse response,
			boolean remember)
	{
		Map<String, Object> res = new HashMap<>();
		Admin temp = adminDAO.loadAdminByUsername(admin.getUsername());
		if (temp == null)
		{
			res.put("status", 400);
			res.put("error", "账号不存在");
			return res;
		}
		if (temp.getState() == 1)
		{
			res.put("status", 400);
			res.put("error", "账号已锁定，请联系管理员");
			return res;
		}

		if (temp.getPassword().equals(Md5Utils.encodeByMD5(admin.getPassword())))
		{
			res.put("status", 200);
			res.put("type", temp.getType());
			HttpSession session = request.getSession();
			session.setAttribute("username", temp.getUsername());
			session.setAttribute("type", temp.getType());
			if (temp.getType() == 1)
				session.setAttribute("company", temp.getCompany());
			else if (temp.getType() == 2)
				session.setAttribute("store", temp.getStore());
			if (remember)
			{

				Cookie cookie = new Cookie("userInfo", admin.getUsername() + "-" + admin.getPassword());
				cookie.setMaxAge(Config.REMEMBER_TIME);
				cookie.setPath(request.getContextPath() + "/");
				response.addCookie(cookie);
			}
		} else
		{
			res.put("status", 400);
			res.put("error", "密码不正确");
		}
		return res;
	}

	// 删除或禁用或启用管理员
	@Transactional
	public Map<String, Object> delAdmin(Admin admin, HttpSession session)
	{
		Map<String, Object> res = new HashMap<>();
		res.put("status", 200);
		admin = adminDAO.loadAdminByUsername(admin.getUsername());
		String username = (String) session.getAttribute("username");
		if (username.equals(admin.getUsername()))
		{
			res.put("error", "不能删除自身！");
			res.put("status", 400);
			return res;
		}
		admin.setState(1);
		adminDAO.updateAdmin(admin);
		return res;
	}

	// 更新管理员状态
	@Transactional
	public void changeAccountState(Admin admin)
	{
		Admin admin2 = adminDAO.loadAdminByUsername(admin.getUsername());
		admin2.setState(admin.getState());
		adminDAO.updateAdmin(admin2);
	}

}
