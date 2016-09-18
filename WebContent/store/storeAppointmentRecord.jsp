<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/historyApp.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>

</head>
<body>
	<div id="header">
		<span class="headerLeft">THE&nbsp;CAR洗车助手</span>
		<a class="headerRight" href="../admin/Admin_logout">退出登录</a>
	</div>
	<div id="content">
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/menu2.js"></script>
		<jsp:include page="isLogin.jsp"></jsp:include>
		<div class="inner">
			<p class="conTitle">历史预约</p>
			<div class="line"></div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse">
				<tr>
					<th>卡号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>车牌号</th>
					<th>时间</th>
					<th>状态</th>
				</tr>
				<s:iterator value="map.res.appointments" var="a">
					<tr>
						<td>
							<s:property value="#a.user.userNo" />
						</td>
						<td>
							<s:property value="#a.user.name" />
						</td>
						<td>
							<s:property value="#a.user.mobilePhone" />
						</td>
						<td>
							<s:property value="#a.car.carNo" />
						</td>
						<td>
							<s:date name="#a.appointTime" format="yyyy-MM-dd HH:mm" />
						</td>
						<td>
							<s:if test="#a.state==1">已完成</s:if>
							<s:elseif test="#a.state==2">已取消</s:elseif>
							<s:elseif test="#a.state==3">超时关闭</s:elseif>
						</td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/historyApp.js"></script>
</body>
</html>

