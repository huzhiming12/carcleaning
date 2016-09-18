<%@page import="com.car.model.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	/* 用户名不为空，且类型是公司管理员  */
	if (session != null && session.getAttribute("username") != null)
	{
		int type = (Integer) session.getAttribute("type");
		switch (type)
		{
		case 0:
			break;
		case 3:
			out.print("<script>$(\"#advertManager\").hide();</script>");
			out.print("<script>$(\"#adminManager\").hide();</script>");
			break;
		case 4:
			out.print("<script>$(\"#companyManager\").hide();</script>");
			out.print("<script>$(\"#accountManager\").hide();</script>");
			out.print("<script>$(\"#adminManager\").hide();</script>");
			break;
		default:
			out.print("<script>window.location.href='../index';</script>");
			return;
		}
	} else
	{
		out.print("<script>window.location.href='../index';</script>");
		return;
	}
%>

