<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>洗车助手</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/addAdmin.css" />
<!--<link rel="stylesheet" href="css/bootstrap.css" />-->
<link rel="stylesheet" href="css/daterangepicker.css" />
<link rel="stylesheet" href="css/daterangepicker-bs3.css" />
<!--<link href="css/lyz.calendar.css" rel="stylesheet" type="text/css" />-->
<script type="text/javascript" src="js/jquery2.1.4.min.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<!--<script src="js/lyz.calendar.min.js" type="text/javascript"></script>-->
<script type="text/javascript" src="js/daterangepicker.js"></script>

<style>
body {
	font-size: 12px;
	font-family: "微软雅黑", "宋体", "Arial Narrow";
}

#reportrange {
	line-height: 35px;
}
</style>
<script>
	$(function() {
		$('#reportrange').daterangepicker(
				{
					format : 'YYYY-MM-DD HH:mm',
					separator : '-',
					timePicker : true,
					locale : {
						applyLabel : '确定',
						cancelLabel : '取消',
						daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
						monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
								'七月', '八月', '九月', '十月', '十一月', '十二月' ]
					}
				},
				function(start, end, label) {//格式化日期显示框
					$("#reportrange").attr("statu", "ok");
					document.getElementById("reportrange").innerHTML = start
							.format('YYYY-MM-DD HH:mm:ss')
							+ ' - ' + end.format('YYYY-MM-DD HH:mm:ss');
				});
	});
</script>
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
			<p class="conTitle">发布优惠券</p>
			<div class="line"></div>
			<form action="">
				<p class="addP">优惠券折扣（0-99）：</p>
				<input type="text" id="discount" sort="int" maxlength="2" ismust="no" class="addInp" placeholder="只能填写数字" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">优惠券使用价格：</p>
				<input type="text" id="condition" sort="int" maxlength="10" ismust="no" class="addInp" placeholder="只能填写数字" />
				<div class="error" sort="">*不能为空！</div>
				<p class="addP">优惠券时间使用范围：</p>
				<!--<input type="text" name="" class="addInp" id="txtBeginDate"   placeholder="优惠券的截止日期格式：2016-01-01" />
					 <input id="txtBeginDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;margin-right:10px;"/>
 					 <input id="txtEndDate" style="width:170px;padding:7px 10px;border:1px solid #ccc;" />-->
				<div>
					<!--<input id="txtBeginDate" type="text" name="" class="" id="txtBeginDate" style="display: none;"/>-->
					<span name="" class="addInp" id="reportrange" />
					点击选择范围
					</span>
				</div>
				<input type="button" value="添加" class="tagBtn" />
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/tag.js"></script>
</body>
</html>
