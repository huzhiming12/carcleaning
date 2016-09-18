<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>添加车辆信息</h3>
	<form action="Car_addCar" method="post">
		会员卡号：
		<input type="text" name="car.user.userNo">
		<br>
		车型：
		<input type="text" name="car.carBrand">
		<br>
		车牌号：
		<input type="text" name="car.carNo">
		<br>
		<input type="submit" value="添加">
	</form>
	
	<h3>用户车辆信息</h3>
	<form action="Car_userCars" method="post">
		用户卡号：
		<input type="text" name="car.user.userNo">
		<br>
		<input type="submit" value="加载">
	</form>
	
	<h3>更新用户车辆品牌</h3>
	<form action="Car_changeCarBrand" method="post">
		车辆id：
		<input type="text" name="car.id">
		<br>
		车辆品牌：
		<input type="text" name="car.carBrand">
		<br>
		<input type="submit" value="更新">
	</form>
	
	<h3>用户车辆车牌号</h3>
	<form action="Car_changeCarNo" method="post">
		车辆id：
		<input type="text" name="car.id">
		<br>
		车辆车牌号：
		<input type="text" name="car.carNo">
		<br>
		<input type="submit" value="更新">
	</form>
	
	<h3>删除用户车辆信息</h3>
	<form action="Car_delCar" method="post">
		车辆id：
		<input type="text" name="car.id">
		<br>
		<input type="submit" value="删除">
	</form>

</body>
</html>