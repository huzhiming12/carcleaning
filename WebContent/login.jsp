<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
	Cookie[] items = request.getCookies();
	String username = "";
	String password = "";
	if (items != null)
		for (Cookie item : items) {
			if (item.getName().equals("userInfo")) {
				String[] str = item.getValue().split("-");
				username = str[0];
				password = str[1];
			}
		}
%>


<!DOCTYPE html>
<html class="login-bg">
<head>
<title>洗车助手</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap -->

<link href="admin old/css/bootstrap.css" rel="stylesheet" />
<link href="admin old/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="admin old/css/bootstrap-overrides.css" rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" href="admin old/css/layout.css" />
<link rel="stylesheet" href="admin old/css/elements.css" />
<link rel="stylesheet" href="admin old/css/icons.css" />
<link rel="stylesheet" href="admin old/css/signin.css" />
<!-- this page specific styles -->
<link rel="stylesheet" href="admin old/css/tables.css" media="screen" />
<link rel="shortcut icon" href="admin old/img/car.jpg">
</head>
<body>
	<div class="row-fluid login-wrapper">
		<a> </a>

		<div class="span4 box">
			<div class="content-wrap">
				<h6>洗车助手管理系统</h6>
				<input class="span12" value="<%=username%>" type="text"
					placeholder="用户名" id="username" /> <input class="span12"
					value="<%=password%>" type="password" placeholder="密码"
					id="password" />
				<div class="remember">
					<input id="remember-me" type="checkbox" /> <label
						for="remember-me">记住我</label>
				</div>
				<button class="btn btn-warning" id="loginBtn">登录</button>
			</div>
		</div>
	</div>

	<!-- scripts -->
	<script src="admin old/js/jquery2.1.4.min.js"></script>
	<script src="admin old/js/bootstrap.min.js"></script>
	<script src="admin old/js/theme.js"></script>
	<script src="admin old/js/exit.js"></script>

	<!-- pre load bg imgs -->
	<script type="text/javascript">
		$("#loginBtn").click(function() {
			if ($("#username").val() == "") {
				alert("用户名不能为空");
				return;
			}
			if ($("#password").val() == "") {
				alert("密码不能为空");
				return;
			}
			//alert($("#remember-me").is(":checked"));
			login();
		});

		function login() {
			$
					.post(
							"admin/Admin_adminLogin",
							{
								"admin.username" : $('#username').val(),
								"admin.password" : $('#password').val(),
								"remember" : $("#remember-me").is(":checked")
							},
							function(data, status) {
								if (data.status == 200) {
									$('#username').val("");
									$('#password').val("");
									switch (data.type) {
									case 0:
									case 3:
										window.location.href = "admin/ACompany_companyManager";
										break;
									case 1:
										window.location.href = "company/AAppointment_companyAppointment";
										break;
									case 2:
										window.location.href = "store/AAppointment_storeAppointment";
										break;
									case 4:
										window.location.href = "admin/AAdvert_advertManager";
										break;
									}
								} else {
									alert(data.error);
								}
							});
		}
	</script>
</body>
</html>