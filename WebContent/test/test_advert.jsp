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

	<h3>加载广告</h3>
	<form action="Advert_loadAdverts" method="post">
		公司或店铺id：
		<input type="text" name="id">
		<br>
		类型 0：店铺广告 1：公司广告
		<input type="text" name="type">
		<br>
		<input type="submit" value="加载">
	</form>

</body>
</html>