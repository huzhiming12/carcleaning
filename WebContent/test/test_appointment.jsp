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

	<h3>添加洗车预约</h3>
	<form action="Appointment_addAppointment" method="post">
		会员卡号：
		<input type="text" name="appointment.user.userNo">
		<br> 店铺编号：
		<input type="text" name="appointment.store.id">
		<br> 预约洗车时间：
		<input type="text" name="dateString">
		<br> 0:精洗 1:快洗：
		<input type="text" name="appointment.type">
		<br> 车辆id
		<input type="text" name="appointment.car.id">
		<br>
		<input type="submit" value="添加">
	</form>

	<h3>加载用户预约列表</h3>
	<form action="Appointment_loadUserAppointments" method="post">
		会员卡号：
		<input type="text" name="userNo">
		<br> 0:预约成功 1:预约历史
		<input type="text" name="type">
		<br> 第几页
		<input type="text" name="pager.pageNow">
		<br>
		<input type="submit" value="加载">
	</form>
	
	<h3>取消预约</h3>
	<form action="Appointment_cancelAppointment" method="post">
		预约编号：
		<input type="text" name="appointment.id">
		<br> 
		<input type="submit" value="取消">
	</form>
	
	
	<h3>某天每个时间段的预约</h3>
	<form action="Appointment_loadAppointmentTimes" method="post">
		店铺id：
		<input type="text" name="id">
		<br> 
		日期：2016-09-01
		<input type="text" name="dateString">
		<br> 
		类型：0精洗  1快洗
		<input type="text" name="type">
		<br> 
		<input type="submit" value="取消">
	</form>
	
	<h3>加载洗车位预约</h3>
	<form action="admin/AAppointment_loadLotAppointment" method="post">
		店铺id：
		<input type="text" name="storeId">
		<br> 
		洗车位1-6
		<input type="text" name="parkNo">
		<br> 
		<input type="submit" value="加载">
	</form>


</body>
</html>