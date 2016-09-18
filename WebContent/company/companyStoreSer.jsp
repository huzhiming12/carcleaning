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
			<form action="" class="addFrom" style="margin-top: 20px;">
				<!--<input type="text" name="" class="addInp" placeholder="卡号为6位数字" />-->
				<p class="addP2">门店名称：</p>
				<input type="text" name="" maxlength="10" ismust="no" class="addInp" placeholder="请输入店铺名称" />
				<div class="error" name="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">门店联系方式：</p>
				<input type="text" name="int" maxlength="11" ismust="yes" class="addInp" placeholder="请输入店铺手机号" />
				<div class="error" name="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">门店地址：</p>
				<input type="text" name="" maxlength="100" ismust="no" class="addInp" placeholder="请输入店铺地址" />
				<div class="error" name="" style="">*不能为空！</div>
				<p class="addP2">门店logo：</p>
				<input type="file" name="" class="addInp3" />
				<input type="button" value="添加" class="addBtn2" />
			</form>
		</div>
		<div class="inner">

			<p class="conTitle">门店服务</p>
			<div class="line"></div>
			<div class="addStore">
				<input type="button" value="门店服务" class="storeBtn2" />
				<!--<input type="button" name="" class="storeBtn4" value="添加门店" />-->
				<!--<input type="button" name="" class="storeBtn5" value="添加店铺服务" />-->
			</div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse">
				<tr>
					<th>门店名称</th>
					<th>服务名称</th>
					<th>服务内容</th>
					<th>价格</th>
					<th>服务图标</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.res.storeSers" var="s">
					<tr>
						<td>
							<s:property value="#s.store.name" />
						</td>
						<td class="fuwuname">
							<s:property value="#s.serName" />
						</td>
						<td class="fuwu">
							<s:property value="#s.serContent" />
						</td>
						<td>
							<s:property value="#s.price" />
						</td>
						<td>
							<img src="../../carcleaning_res/<s:property value="#s.icon"/>" class="storeLogo" />
						</td>
						<td>
							<input type="button" serId="<s:property value="#s.id" />" value="删除" class="managerBtn" />
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
		$(".menuLi").eq(4).css({
			"background-color" : "#000",
			"border-left" : "8px solid #fdbf16",
			"width" : "205px"
		})
		$(".menuLi").eq(4).find(".menuArrow").css({
			"opacity" : "1",
			"filter" : "alpha(opacity=100)",
			"margin-left" : "35px"
		})
		$(".managerBtn").click(function() {
			if (confirm("确定要删除该店铺服务？")) {
				$.post("AStore_delStoreSer", {
					"storeSer.id" : $(this).attr("serId")
				}, function(data, status) {
					if (data.status == 200) {
						alert("店铺服务删除成功！");
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

