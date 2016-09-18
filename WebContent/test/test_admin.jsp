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

	<h3>添加管理员</h3>
	<form action="admin/Admin_addAdmin" method="post">
		账号：
		<input type="text" name="admin.username">
		<br> 密码：
		<input type="text" name="admin.password">
		<br> 公司id 或店铺id 二选一
		<input type="text" name="admin.company.id">
		or
		<input type="text" name="admin.store.id">
		<br>
		<input type="submit" value="添加">
	</form>

</body>
</html>