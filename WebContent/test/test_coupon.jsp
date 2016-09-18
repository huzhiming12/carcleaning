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

	<h3>添加优惠券</h3>
	<form action="admin/ACoupon_addCoupons" method="post">
		优惠价格：
		<input type="text" name="couponInfo.discount">
		<br> 使用价格：
		<input type="text" name="couponInfo.conditionPrice">
		<br> 起始日期：
		<input type="text" name="couponInfo.startDate">
		<br> 截止日期：
		<input type="text" name="couponInfo.endDate">
		<br>
		<input type="submit" value="添加">
	</form>

	<h3>加载用户的优惠券</h3>
	<form action="Coupon_loadUserCoupons" method="post">
		用户卡号：
		<input type="text" name="userNo">
		<br> 第几页：
		<input type="text" name="pager.pageNow">
		<br>
		<input type="submit" value="加载">
	</form>

</body>
</html>