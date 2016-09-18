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

	<!-- <h3>添加店铺信息</h3>
	<form action="admin/AStore_addStore" method="post" enctype="multipart/form-data">
		店铺名称：
		<input type="text" name="store.name">
		<br> 店铺地址：
		<input type="text" name="store.address">
		<br> 店铺电话：
		<input type="text" name="store.phone">
		<br> 店铺logo：
		<input type="file" name="file">
		<br>
		<input type="submit" value="添加">
	</form>

	<h3>添加店铺服务信息</h3>
	<form action="admin/AStore_addStoreSer" method="post" enctype="multipart/form-data">
		服务名称：
		<input type="text" name="storeSer.serName">
		<br> 服务内容：
		<input type="text" name="storeSer.serContent">
		<br> 价格：
		<input type="text" name="storeSer.price">
		<br> 服务图标：
		<input type="file" name="file">
		<br>店铺id
		<input type="text" name="storeSer.store.id">
		<br>
		<input type="submit" value="添加">
	</form> -->

	<h3>加载店铺列表</h3>
	<form action="Store_loadStores" method="post">
		第几页：
		<input type="text" name="pager.pageNow">
		<br>
		用户卡号
		<input type="text" name="userNo">
		<input type="submit" value="加载">
	</form>
	
	<h3>店铺详情</h3>
	<form action="Store_storeDetail" method="post">
		店铺id：
		<input type="text" name="store.id">
		<input type="submit" value="加载">
	</form>

</body>
</html>