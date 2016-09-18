<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/store.css" />
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
		<div class="blackBg"></div>
		<div class="tc">
			<img src="img/exit.png" class="tc-exit" />
			<form action="AStore_addStore" class="addFrom" method="post" enctype="multipart/form-data"
				target="iframe" style="margin-top: 20px;">
				<!--<input type="text" name="" class="addInp" placeholder="卡号为6位数字" />-->
				<p class="addP2">门店名称：</p>
				<input type="text" name="store.name" sort="" maxlength="10" ismust="no" class="addInp"
					placeholder="请输入店铺名称" />
				<div class="error" sort="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">门店联系方式：</p>
				<input type="text" name="store.phone" sort="int" maxlength="11" ismust="yes" class="addInp"
					placeholder="请输入店铺手机号" />
				<div class="error" sort="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">门店地址：</p>
				<input type="text" name="store.address" sort="" maxlength="100" ismust="no" class="addInp"
					placeholder="请输入店铺地址" />
				<div class="error" sort="" style="">*不能为空！</div>
				<p class="addP2">门店logo：</p>
				<input type="file" name="file" sort="" class="addInp3" />
				<input type="button" value="添加" class="addBtn2" />
			</form>
		</div>

		<div class="inner">
			<p class="conTitle">门店管理</p>
			<div class="line"></div>
			<div class="addStore">
				<input type="button" value="门店列表" class="storeBtn2" />
				<input type="button" name="" class="storeBtn4" value="添加门店" />
				<!--<input type="button" name="" class="storeBtn5" value="添加店铺服务" />-->
			</div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse">
				<tr>
					<th>门店名称</th>
					<th>门店地址</th>
					<th>联系电话</th>
					<th>门店logo</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.res.stores" var="s">
					<tr>
						<td>
							<s:property value="#s.name" />
						</td>
						<td>
							<s:property value="#s.address" />
						</td>
						<td>
							<s:property value="#s.phone" />
						</td>
						<td>
							<img src="../../carcleaning_res/<s:property value="#s.logo"/>" class="storeLogo" />
						</td>
						<td>
							<input type="button" storeId="<s:property value="#s.id" />" value="删除" class="managerBtn" />
						</td>
					</tr>
				</s:iterator>
			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/store.js"></script>
	<script>
		$(".menuLi").eq(3).css({
			"background-color" : "#000",
			"border-left" : "8px solid #fdbf16",
			"width" : "205px"
		})
		$(".menuLi").eq(3).find(".menuArrow").css({
			"opacity" : "1",
			"filter" : "alpha(opacity=100)",
			"margin-left" : "35px"
		});

		$(".managerBtn").click(function() {
			if (confirm("确定要删除该店铺？")) {
				$.post("AStore_delStore", {
					"store.id" : $(this).attr("storeId")
				}, function(data, status) {
					if (data.status == 200) {
						alert("店铺删除成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		});
	</script>
</body>
</html>

