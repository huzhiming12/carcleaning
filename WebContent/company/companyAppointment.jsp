<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>公司管理</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/todayApp.css" />
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
			<p class="conTitle">今日预约</p>
			<div class="line"></div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse">
				<tr>
					<th>卡号
					</td>
					<th>姓名
					</td>
					<th>电话
					</td>
					<th>车牌号
					</td>
					<th>店铺
					</td>
					<th>洗车时间
					</td>
					<th>洗车类型
					</td>
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
							<s:property value="#a.store.name" />
						</td>
						<td>
							<s:date name="#a.appointTime" format="yyyy-MM-dd HH:mm" />
						</td>
						<td>
							<s:if test="#a.type==0">精洗</s:if>
							<s:else>快洗</s:else>
						</td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/todayApp.js"></script>
</body>
</html>

