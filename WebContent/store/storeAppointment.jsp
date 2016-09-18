<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>洗车助手</title>
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
					<th>卡号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>车牌号</th>
					<th>洗车时间</th>
					<th>类型</th>
					<th>洗车位</th>
					<th>操作</th>
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
							<s:if test="#a.type==0">精洗</s:if>
							<s:else>快洗</s:else>
						</td>
						<td>
							<s:if test="#a.type==0">精洗</s:if>
							<s:else>快洗</s:else>
							车位
							<s:property value="#a.parkingLot.parkNo" />
						</td>
						<td>
							<input type="button" value="超时取消" onclick="appId=<s:property value="#a.id" />"
								class="accountBtn" />
						</td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="js/todayApp.js"></script>
	<script type="text/javascript">
		var appId;
		$(".accountBtn").click(function() {
			if (confirm("确定要取消该预约？")) {
				$.post("AAppointment_closeAppointment", {
					"appointment.id" : appId
				}, function(data, status) {
					if (data.status == 200) {
						alert("预约取消成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				})
			}
		});
	</script>
</body>
</html>

