<%@page import="com.car.model.Store"%>
<%@page import="com.car.model.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	/* 用户名不为空，且类型是店铺管理员  */
	if (session == null || session.getAttribute("username") == null
			|| (Integer) session.getAttribute("type") != 2 || session.getAttribute("store") == null)
	{
		out.print("<script>window.location.href='../index';</script>");
		return;
	} else
	{
		Store store = (Store) session.getAttribute("store");
		out.print("<script>$(\".houName\").html(\"" + store.getName() + "\");</script>");
	}
%>

