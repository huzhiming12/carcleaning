<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/admin.css" />
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
			<form id="searchForm" action="AUser_companyUser" method="post">
				<div class="sou">
					<input type="text" name="pager.condition['keyword']"
						value="<s:property value="pager.condition['keyword']" />" class="souInp"
						placeholder="卡号、姓名、电话" />
					<img src="img/lens.png" class="souImg" />
				</div>
			</form>
			<p class="conTitle">会员信息</p>
			<div class="line"></div>
			<div class="addManager">
				<input type="button" value="会员列表" class="accountBtn2" />
				<input type="button" value="添加会员" class="accountBtn3" />
			</div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse">
				<tr>
					<th>卡号</th>
					<th>姓名</th>
					<th>电话</th>
					<th>车牌号</th>
					<th>所属门店</th>
					<th>是否注册</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.res.users" var="u">
					<tr>
						<td>
							<s:property value="#u.user.userNo" />
						</td>
						<td>
							<s:property value="#u.user.name" />
						</td>
						<td>
							<s:property value="#u.user.mobilePhone" />
						</td>
						<td>
							<s:property value="#u.car.carNo" />
						</td>
						<td>
							<s:property value="#u.user.store.name" />
						</td>
						<td>
							<s:if test="#u.user.isRegister==0">未注册</s:if>
							<s:else>已注册</s:else>
						</td>
						<td>
							<input type="button" value="删除会员" onclick="userNo='<s:property value="#u.user.userNo" />'"
								class="accountBtn" />
						</td>
					</tr>
				</s:iterator>
			</table>

			<%-- <div class="page">
				<div class="prevPage">上一页</div>
				<div class="page-x dqy">1</div>
				<div class="page-x">2</div>
				<div class="page-x">3</div>
				<div class="page-x">4</div>
				<div class="page-x">5</div>
				<div class="nextPage">下一页</div>
				<div class="pageAll">
					共
					<span class="pageAll1">13</span>
					页/共
					<span class="pageAll2">102</span>
					条
				</div>
			</div> --%>

			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>

			<form action="" class="addFrom">
				<p class="addP">卡号：</p>
				<input type="text" sort="int" maxlength="6" id="userNo" ismust="yes" class="addInp"
					placeholder="请输入卡号，卡号为6位数字" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">姓名：</p>
				<input type="text" sort="ch" maxlength="5" id="name" ismust="no" class="addInp"
					placeholder="请输入姓名" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">手机号：</p>
				<input type="text" sort="phone" maxlength="11" id="phone" ismust="yes" class="addInp"
					placeholder="请输入手机号" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">车牌号：</p>
				<input type="text" sort="chepai" maxlength="7" id="carNo" ismust="yes" class="addInp"
					placeholder="请输入车牌号" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">所属门店：</p>
				<select class="addInp addSelect" id="storeId">
					<s:iterator value="map.stores" var="s">
						<option value="<s:property value="#s.id"/>"><s:property value="#s.name" />
						</option>
					</s:iterator>
				</select>
				<input type="button" value="添加" class="addBtn" />
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/admin.js"></script>
	<script type="text/javascript">
		$(".souImg").click(function() {
			$("#searchForm").submit();
		});
		var userNo;
		$(".accountBtn").click(function() {
			if (confirm("确定要删除改会员信息？")) {
				$.post("AUser_delUser", {
					"user.userNo" : userNo
				}, function(data, status) {
					if (data.status == 200) {
						alert("会员删除成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		})
	</script>
</body>
</html>
