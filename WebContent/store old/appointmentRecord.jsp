<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left_menu.jsp"></jsp:include>

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
								<strong>预约记录</strong>
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
									<th class="span3">卡号</th>
									<th class="span3"><span class="line"></span>姓名</th>
									<th class="span3"><span class="line"></span>电话</th>
									<th class="span3"><span class="line"></span>洗车时间</th>
									<th class="span3"><span class="line"></span>预约时间</th>
									<th class="span3"><span class="line"></span>洗车位</th>
									<th class="span3"><span class="line"></span>状态</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="map.res.appointments" var="a">
									<tr>
										<td>
											<s:property value="#a.user.userNo" />
										</td>
										<td>
											<s:property value="#a.user.name" />
										</td>
										<td>
											<s:property value="#a.user.mobilePhone" />
										</td>
										<td>
											<s:date name="#a.appointTime" format="yyyy-MM-dd HH:mm" />
										</td>
										<td>
											<s:date name="#a.createTime" format="yyyy-MM-dd HH:mm" />
										</td>
										<td>
											<s:if test="#a.parkingLot.parkNo>4">
												快洗车位<s:property value="#a.parkingLot.parkNo" />
											</s:if>
											<s:else>
										    		精洗车位<s:property value="#a.parkingLot.parkNo" />
											</s:else>
										</td>
										<td>
											<s:if test="#a.state==1">
												<label class="label label-success">预约完成</label>
											</s:if>
											<s:elseif test="#a.state==2">
												<label class="label">预约取消</label>
											</s:elseif>
											<s:elseif test="#a.state==3">
												<label class="label label-inverse">超时关闭</label>
											</s:elseif>
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
	

	<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/exit.js"></script>
	<script type="text/javascript">
		$("li").eq(1).mouseenter(function() {
			$("img").eq(0).attr("src", "img/lock.png");
		})
		$("li").eq(1).mouseleave(function() {
			$("img").eq(0).attr("src", "img/lock(1).png");
		})
		$("li").eq(2).mouseenter(function() {
			$("img").eq(1).attr("src", "img/signal.png");
		})
		$("li").eq(2).mouseleave(function() {
			$("img").eq(1).attr("src", "img/signal(1).png");
		})
	</script>
</body>
</html>