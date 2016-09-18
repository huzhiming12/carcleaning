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
<link rel="stylesheet" href="css/admin.css" />
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
			if (null == session || session.getAttribute("username") == null) {
				out.print("<script>window.location.href='../index';</script>");
				return;
			}
			int type = (Integer) session.getAttribute("type");
			if (type != 0)
				out.print("<script>window.location.href='../index';</script>");
		%>
		<div class="inner">
			<p class="conTitle">管理员</p>
			<div class="line"></div>
			<div class="addManager">
				<input type="button" value="管理员列表" class="accountBtn2" />
				<input type="button" value="添加管理员" class="accountBtn3" />
			</div>
			<table class="conTable" border="1px" bordercolor="#858484"
				cellspacing="0px" style="border-collapse: collapse">
				<tr>
					<th>管理员账号</th>
					<th>权限</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.res.admins" var="a">
					<tr>
						<td><s:property value="#a.username" /></td>
						<td><s:if test="#a.type==0">超级管理员</s:if> <s:elseif
								test="#a.type==3">商家管理员</s:elseif> <s:elseif test="#a.type==4">广告管理员</s:elseif>
						</td>
						<td><s:if test="#a.state==0">正常</s:if> <s:else>已禁用</s:else></td>
						<td><s:if test="#a.state==0">
								<input type="button"
									username="<s:property value="#a.username" />" value="停用"
									class="adminVip lock" />
							</s:if> <s:else>
								<input type="button"
									username="<s:property value="#a.username" />" value="启用"
									class="adminVip unlock" />
							</s:else></td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
			<form action="" class="addAdminFrom addFrom">
				<p class="addP2">管理员类型：</p>
				<select class="addInp2 addSelect" id="type">
					<option value="0">超级管理员</option>
					<option value="3">商家管理员</option>
					<option value="4">广告位管理员</option>
				</select>
				<p class="addP2">账号</p>
				<input type="text" id="username" lx="" maxlength="16" ismust="no"
					class="addInp" placeholder="请输入账号" />
				<div class="error" name="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">密码：</p>
				<input type="text" id="password" lx="" maxlength="16" ismust="no"
					class="addInp" placeholder="请输入密码" />
				<div class="error" name="" style="display: none !important;">*不能为空！</div>
				<input type="button" value="添加" class="addAdminBtn" />
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/admin.js"></script>
	<script type="text/javascript">
		$(".lock").click(function() {
			if (confirm("确定要锁定该账户？")) {
				changeAccountState($(this).attr("username"), 1);
			}
		});
		$(".unlock").click(function() {
			if (confirm("确定要解锁该账户？")) {
				changeAccountState($(this).attr("username"), 0);
			}
		});

		function changeAccountState(username, type) {
			//type 0：解锁 1：锁定
			var msg = "解锁";
			if (type == 1)
				msg = "锁定";
			$.post("Admin_changeAccountState", {
				"admin.username" : username,
				"admin.state" : type
			}, function(data, status) {
				if (data.status == 200) {
					alert("账号" + msg + "成功！")
					location.reload();
				} else {
					alert(data.error)
				}
			});
		}
	</script>
</body>
</html>
