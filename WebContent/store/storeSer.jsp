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
			<iframe name="asyncTarget" style="display: none;"></iframe>
			<form action="AStore_addStoreSer" class="addFrom" method="post" enctype="multipart/form-data"
				target="iframe" style="margin-top: 20px;">
				<p class="addP2">服务名称：</p>
				<input type="text" sort="" id="serName" name="storeSer.serName" maxlength="25" ismust="no"
					class="addInp" placeholder="请输入服务名称" />
				<div class="error" sort="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">服务内容：</p>
				<input type="text" sort="" id="serContent" name="storeSer.serContent" maxlength="25"
					ismust="no" class="addInp" placeholder="请输入服务内容" />
				<div class="error" sort="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">服务价格：</p>
				<input type="text" sort="int" id="serPrice" name="storeSer.price" maxlength="10" ismust="no"
					class="addInp" placeholder="请输入服务价格" />
				<div class="error" sort="" style="display: none !important;">*不能为空！</div>
				<p class="addP2">服务图标：</p>
				<input type="file" sort="" id="serIcon" name="file" class="addInp3" />
				<input type="button" value="添加" class="addBtn2" />
			</form>
		</div>
		<div class="inner">

			<p class="conTitle">门店管理</p>
			<div class="line"></div>
			<div class="addStore">
				<input type="button" value="服务列表" class="storeBtn2" />
				<!--<input type="button" value="具体详情" class="storeBtn3" />-->
				<input type="button" name="" class="storeBtn4" value="添加服务" />
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
							<input type="button" onclick="serId=<s:property value="#s.id" />" value="删除"
								class="managerBtn" />
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
	<script type="text/javascript">
		var serId;
		$(".managerBtn").click(function() {
			if (confirm("确定要删除改服务？")) {
				$.post("AStore_delStoreSer", {
					"storeSer.id" : serId
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

