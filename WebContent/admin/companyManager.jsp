<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/company.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div id="header">
		<span class="headerLeft">THE&nbsp;CAR洗车助手</span>
		<a class="headerRight" href="Admin_logout">退出登录</a>
	</div>
	<div id="content">
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/menu2.js"></script>
		<jsp:include page="isLogin.jsp"></jsp:include>
		<%
			if (null == session || session.getAttribute("username") == null)
			{
				out.print("<script>window.location.href='../index';</script>");
				return;
			}
			int type = (Integer) session.getAttribute("type");
			System.out.println(type);
			if (type != 0 && type != 3)
				out.print("<script>window.location.href='../index';</script>");
		%>
		<div class="blackBg"></div>
		<div class="tc tc-company">
			<img src="img/exit.png" class="tc-exit" />
			<form action="" class="addDian addFrom" style="margin-top: 20px;">
				<!--<input type="text" lx="" class="addInp" placeholder="卡号为6位数字" />-->
				<p class="addP2">公司名称：</p>
				<input type="text" id="companyName" lx="" maxlength="10" ismust="no"
					class="addInp" placeholder="请输入公司名称" />
				<p class="addP2">联系方式：</p>
				<input type="text" id="companyPhone" lx="int" maxlength="11"
					ismust="yes" class="addInp" placeholder="请输入公司联系方式" />
				<p class="addP2">公司地址：</p>
				<input type="text" id="companyAddress" lx="" maxlength="100"
					ismust="no" class="addInp" placeholder="请输入公司地址" />
				<p class="addP2">负责人：</p>
				<input type="text" id="companyContact" lx="ch" maxlength="100"
					ismust="no" class="addInp" placeholder="请输入负责人姓名" />
				<input type="button" value="添加" class="addCompanyBtn" />
			</form>
		</div>
		<div class="tc tc-shop">
			<img src="img/exit.png" class="tc-exit" />
			<form action="AStore_addStore" method="post" target="iframe"
				enctype="multipart/form-data" class="addServer addFrom"
				style="margin-top: 20px;">
				<p class="addP2">所属公司：</p>
				<select class="addInp2 addSelect" name="store.company.id">
					<s:iterator value="map.companys" var="c">
						<option value="<s:property value="#c.id"/>"><s:property
								value="#c.name" />
						</option>
					</s:iterator>
				</select>
				<!--<input type="text" lx="" class="addInp" placeholder="卡号为6位数字" />-->
				<p class="addP2">门店名称：</p>
				<input type="text" name="store.name" lx="" maxlength="100"
					ismust="no" class="addInp" placeholder="请输入门店名称" />
				<p class="addP2">门店地址：</p>
				<input type="text" name="store.address" lx="" maxlength="1000"
					ismust="no" class="addInp" placeholder="请输入门店地址" />
				<p class="addP2">联系方式：</p>
				<input type="text" name="store.phone" lx="phone" maxlength="11"
					ismust="yes" class="addInp" placeholder="请输入联系方式" />
				<p class="addP2">门店logo：</p>
				<input type="file" name="file" lx="" class="addInp3" />
				<input type="button" value="添加" class="addShopBtn" />
			</form>
		</div>
		<div class="inner">
			<p class="conTitle">商家管理</p>
			<div class="line"></div>
			<div class="addManager">
				<input type="button" value="公司列表" class="accountBtn2" />
				<input type="button" value="公司详情" class="accountBtn3" />
				<input type="button" value="添加公司" class="addCompany" />
				<input type="button" value="添加店铺" class="addShop" />
			</div>
			<table class="conTable" border="1px" bordercolor="#858484"
				cellspacing="0px" style="border-collapse: collapse">
				<tr>
					<th>公司名称</th>
					<th>地址</th>
					<th>联系方式</th>
					<th>负责人</th>
					<th>服务期限</th>
				</tr>
				<s:iterator value="map.res.companys" var="c">
					<tr>
						<td><s:property value="#c.name" /></td>
						<td><s:property value="#c.address" /></td>
						<td><s:property value="#c.phone" /></td>
						<td><s:property value="#c.contact" /></td>
						<td><s:date name="#c.endDate" format="yyyy-MM-dd" /></td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
			<form action="" class="companyFrom addFrom">
				<p class="addP">选择公司：</p>
				<select class="comInp" id="companySelector">
					<s:iterator value="map.companys" var="c">
						<option value="<s:property value="#c.id"/>"><s:property
								value="#c.name" />
						</option>
					</s:iterator>
				</select>
				<input type="button" value="确定" class="companyBtn" />
				<p class="term">
					<%-- 服务期限：
					<span class="term-date">2016.09.25</span> --%>
				</p>
				<table class="conTable" border="1px" bordercolor="#858484"
					cellspacing="0px" style="border-collapse: collapse;">
					<tr>
						<th>门店名称</th>
						<th>门店地址</th>
						<th>联系方式</th>
						<th>门店logo</th>
					</tr>
					<tbody id="storeTable">
						<!-- <tr>
							<td>全橙网络小店</td>
							<td>石家庄市长安区</td>
							<td>15111111111</td>
							<td>
								<img src="img/car.jpg" class="companyLogo" />
							</td>
						</tr> -->
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/company.js"></script>
</body>
</html>
