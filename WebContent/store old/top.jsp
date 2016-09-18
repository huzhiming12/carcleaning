<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session == null || session.getAttribute("username") == null
			|| (Integer)session.getAttribute("type")!= 1)
	{
		out.print("<script>window.location.href='../index';</script>");
		return;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>洗车助手</title>
</head>
<body>

	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<a class="brand">the car洗车助手</a>

			<ul class="nav pull-right">
				<li>
					<a class="exit" href="../admin/Admin_logout" role="button"> 退出登录 </a>
				</li>
			</ul>
		</div>
	</div>

</body>
</html>