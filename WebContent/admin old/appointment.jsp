<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>洗车助手</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap -->

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/bootstrap-overrides.css" rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" href="css/layout.css" />
<link rel="stylesheet" href="css/elements.css" />
<link rel="stylesheet" href="css/icons.css" />
<!-- this page specific styles -->
<link rel="stylesheet" href="css/tables.css" media="screen" />
<link rel="shortcut icon" href="img/car.jpg">
<!--hss_new-->
<link href="css/hss_new.css" rel="stylesheet" />
<style type="text/css">
#pagelist {
	float: right;
	height: 80px;
}

#pagelist ul li {
	float: left;
	border: 1px solid #eee;
	height: 22px;
	font-weight: bold;
	line-height: 22px;
	margin: 0px 4px;
	list-style: none;
	background-color: #FDBE19;
}

#pagelist ul li a, .current {
	background: white;
	display: block;
	padding: 0px 6px;
	font-weight: bold;
}

</style>

</head>
<body>
	<!-- navbar -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- end navbar -->

	<!-- sidebar -->
	<jsp:include page="left_menu.jsp"></jsp:include>
	<!-- end sidebar -->


	<!-- main container -->
	<div class="content">

		<!-- settings changer -->
		<div class="container-fluid">
			<div id="pad-wrapper">

				<!-- products table-->
				<!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
				<div class="table-wrapper products-table section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>
								<strong>预约信息</strong>
							</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right"></div>
					</div>

					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">姓名</th>
									<th class="span3"><span class="line"></span>电话</th>
									<th class="span3"><span class="line"></span>卡号</th>
									<th class="span3"><span class="line"></span>洗车时间</th>
									<th class="span3"><span class="line"></span>洗车店铺</th>
									<th class="span3"><span class="line"></span>类型</th>
									<th class="span3"><span class="line"></span>车位</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="map.res.appointments" var="a">
									<tr>
										<td>
											<s:property value="#a.user.name" />
										</td>
										<td>
											<s:property value="#a.user.mobilePhone" />
										</td>
										<td>
											<s:property value="#a.user.userNo" />
										</td>
										<td>
											<s:date name="#a.appointTime" format="yyyy-MM-dd HH:ss" />
										</td>
										<td>
											<s:property value="#a.store.name" />
										</td>
										<td>
											<s:if test="#a.type==0">精洗</s:if>
											<s:else>快洗</s:else>
										</td>
										<td>
											车位
											<s:property value="#a.parkingLot.parkNo" />
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div id="pagelist" class="pagination">
						<s:property value="pagerTool.getPagerBar()" escape="false" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/exit.js"></script>
	<script>
		$("li").eq(2).mouseenter(function() {
			$("img").eq(1).attr("src", "img/signal(1).png");
		})
		$("li").eq(2).mouseleave(function() {
			$("img").eq(1).attr("src", "img/signal.png");
		})
		$("li").eq(3).mouseenter(function() {
			$("img").eq(2).attr("src", "img/barcode(1).png");
		})
		$("li").eq(3).mouseleave(function() {
			$("img").eq(2).attr("src", "img/barcode.png");
		})
		$("li").eq(4).mouseenter(function() {
			$("img").eq(3).attr("src", "img/edit(1).png");
		})
		$("li").eq(4).mouseleave(function() {
			$("img").eq(3).attr("src", "img/edit.png");
		})
		$("li").eq(5).mouseenter(function() {
			$("img").eq(4).attr("src", "img/user(1).png");
		})
		$("li").eq(5).mouseleave(function() {
			$("img").eq(4).attr("src", "img/user.png");
		})
		$("li").eq(6).mouseenter(function() {
			$("img").eq(5).attr("src", "img/minus(1).png");
		})
		$("li").eq(6).mouseleave(function() {
			$("img").eq(5).attr("src", "img/minus.png");
		})
	</script>
</body>
</html>