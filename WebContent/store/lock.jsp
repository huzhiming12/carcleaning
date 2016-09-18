<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/lock.css" />
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
			<p class="conTitle">锁车位</p>
			<div class="line"></div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse; float: left;">
				<tr>
					<th>精洗车位</th>
					<th>操作状态</th>
				</tr>
				<s:iterator value="map.lots" var="lot" status="l">
					<s:if test="#lot.type==0">
						<tr>
							<s:if test="#lot.state==0">
								<td>
									<p class="chewei">洗车位 <s:property value="#lot.parkNo"/> 空置</p>
								</td>
								<td>
									<p class="lock3" statu="no" lotId=" <s:property value="#lot.id"/>">
										<img src="img/openlock.png" class="lock2" />
										<span class="adminVip">锁定</span>
									</p>
								</td>
							</s:if>
							<s:else>
								<td>
									<p class="chewei-lock">洗车位 <s:property value="#lot.parkNo"/> 已锁定</p>
								</td>
								<td>
									<p class="lock3" statu="yes" lotId=" <s:property value="#lot.id"/>">
										<img src="img/closedlock.png" class="lock2" />
										<span class="adminVip">解锁</span>
									</p>
								</td>
							</s:else>
						</tr>
					</s:if>
				</s:iterator>

			</table>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse;">
				<tr>
					<th>快洗车位</th>
					<th>操作状态</th>
				</tr>
				<s:iterator value="map.lots" var="lot" status="l">
					<s:if test="#lot.type==1">
						<tr>
							<s:if test="#lot.state==0">
								<td>
									<p class="chewei">洗车位 <s:property value="#lot.parkNo"/> 空置</p>
								</td>
								<td>
									<p class="lock3" statu="no" lotId=" <s:property value="#lot.id"/>">
										<img src="img/openlock.png" class="lock2" />
										<span class="adminVip">锁定</span>
									</p>
								</td>
							</s:if>
							<s:else>
								<td>
									<p class="chewei-lock">洗车位 <s:property value="#lot.parkNo"/> 已锁定</p>
								</td>
								<td>
									<p class="lock3" statu="yes" lotId=" <s:property value="#lot.id"/>">
										<img src="img/closedlock.png" class="lock2" />
										<span class="adminVip">解锁</span>
									</p>
								</td>
							</s:else>
						</tr>
					</s:if>
				</s:iterator>

			</table>
		</div>
	</div>
	<script type="text/javascript" src="js/lock.js"></script>
</body>
</html>
