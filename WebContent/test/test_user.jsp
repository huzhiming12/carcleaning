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

	<!-- <h3>检测会员卡账号信息</h3>
	<form action="User_checkUserNo" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br>
		<input type="submit" value="检测">
	</form> -->


	<h3>添加会员信息</h3>
	<form action="admin/AUser_addUser" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 姓名：
		<input type="text" name="user.name">
		<br> 电话：
		<input type="text" name="user.mobilePhone">
		<br> 车牌号：
		<input type="text" name="car.carNo">
		<br>
		公司Id
		<input type="text" name="user.company.id">
		<br>
		<input type="submit" value="添加">
	</form>

	<h3>用户注册</h3>
	<form action="User_userRegister" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 密码：
		<input type="text" name="user.password">
		<br>
		<input type="submit" value="注册">
	</form>


	<h3>用户登录</h3>
	<form action="User_userLogin" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 密码：
		<input type="text" name="user.password">
		<br>
		<input type="submit" value="登录">
	</form>

	<h3>加载用户信息</h3>
	<form action="User_userInfo" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br>
		<input type="submit" value="加载">
	</form>

	<h3>上传文件</h3>
	<form action="User_uploadFile" method="post" enctype="multipart/form-data">
		文件
		<input type="file" name="file">
		<br>
		<input type="submit" value="上传">
	</form>

	<h3>更新用户头像</h3>
	<form action="User_changeIcon" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 头像地址：
		<input type="text" name="user.icon">
		<br>
		<input type="submit" value="修改">
	</form>

	<h3>更新用户名</h3>
	<form action="User_changeUsername" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 用户名：
		<input type="text" name="user.username">
		<br>
		<input type="submit" value="修改">
	</form>

	<h3>更新用户真实姓名</h3>
	<form action="User_changeName" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 姓名：
		<input type="text" name="user.name">
		<br>
		<input type="submit" value="修改">
	</form>

	<h3>更新用户电话</h3>
	<form action="User_changeMobilePhone" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 手机号：
		<input type="text" name="user.mobilePhone">
		<br>
		<input type="submit" value="修改">
	</form>
	
	<h3>更新检车时间</h3>
	<form action="User_changeCheckCarDate" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 时间字符串 2016-08-12：
		<input type="text" name="dateString">
		<br>
		<input type="submit" value="修改">
	</form>
	
	<h3>更新审本时间</h3>
	<form action="User_changeReviewDate" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 时间：
		<input type="text" name="dateString">
		<br>
		<input type="submit" value="修改">
	</form>

	<h3>更新用户密码</h3>
	<form action="User_changePassword" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 原密码：
		<input type="text" name="oldPwd">
		<br> 新密码：
		<input type="text" name="user.password">
		<br>
		<input type="submit" value="修改">
	</form>

	<h3>找回密码</h3>
	<form action="User_findPassword" method="post">
		会员卡号：
		<input type="text" name="user.userNo">
		<br> 新密码：
		<input type="text" name="user.password">
		<br>
		<input type="submit" value="修改">
	</form>
	
</body>
</html>