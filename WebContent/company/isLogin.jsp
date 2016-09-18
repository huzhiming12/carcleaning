<%@page import="com.car.model.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	/* 用户名不为空，且类型是公司管理员  */
	if (session == null || session.getAttribute("username") == null
			|| (Integer) session.getAttribute("type") != 1 || session.getAttribute("company") == null)
	{
		out.print("<script>window.location.href='../index';</script>");
		return;
	} else
	{
		Company company = (Company) session.getAttribute("company");
		out.print("<script>$(\".houName\").html(\"" + company.getName() + "\");</script>");
	}
%>

