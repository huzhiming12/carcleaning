<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>会员信息</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
.con {
	position: relative;
}

.sea {
	/*background-image:url(../../public/img/lens.png);*/
	background-image: url(img/lens.png);
	position: absolute;
	width: 13px;
	height: 13px;
	top: 7px;
	left: 200px;
	z-index: 99;
}

.search-result {
	display: none;
}

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

#member {
	color: #000;
	background-color: #FDBE16;
	text-align: center;
	vertical-align: middle;
	border-radius: 4px;
	height: 30px;
	cursor: pointer;
	border: 1px solid #FDBE16;
}

#wjh {
	width: 398px;
	height: 50px;
	border-bottom: 1px solid gainsboro;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

#wjh span {
	margin-left: 15px;
	line-height: 40px;
	color: #000000;
}

#wjh a {
	float: right;
	line-height: 50px;
	text-decoration: none;
	color: #000000
}

#clear {
	clear: both;
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
								<strong>会员列表</strong>
							</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right">
							<!--  <div class="ui-select">
                                <select>
                                  <option />Filter users
                                  <option />Signed last 30 days
                                  <option />Active users
                                </select>
                            </div> -->
							<form action="AUser_user" method="post" id="searchForm">
								<div class="con">
									<input type="text" class="sousuo" name="pager.condition['keyword']" id="sousuo"
										placeholder="卡号、姓名、电话" style="border: 1px solid #FDBE19" />
									<div class="sea" id="searchBtn"></div>
								</div>
							</form>
						</div>

					</div>
					<div class="search-result">
						<span>查询结果</span>
						<table class="table table-hover">

							<tbody class='cflist'>
								<!-- row -->

							</tbody>
						</table>
					</div>
					<div class="row-fluid">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="span3">卡号</th>
									<th class="span3"><span class="line"></span>姓名</th>
									<th class="span3"><span class="line"></span>电话</th>
									<th class="span3"><span class="line"></span>车牌号</th>
									<th class="span3"><span class="line"></span>是否注册</th>

									<th class="span3"><span class="line"></span>操作</th>
								</tr>
							</thead>
							<tbody>
								<!-- row -->
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
											<s:if test="#u.user.isRegister==0"><label class="label">未注册</label></s:if>
											<s:else><label class="label label-success">已注册</label></s:else>
										</td>
										<td>
											<a href="javascript:openLogin('<s:property value="#u.user.userNo" />');">
												<button id="member">会员信息</button>
											</a>
											<div id="back<s:property value="#u.user.userNo" />"
												style="display: none; POSITION: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: #808080; filter: alpha(opacity = 90); opacity: 0.9; );"></div>
											<div id="win<s:property value="#u.user.userNo" />"
												style="display: none; font-weight: 200; color: #FDBE16; POSITION: absolute; border-bottom: 1px solid #888; left: 50%; top: 50%; border-radius: 5px; width: 400px; height: auto; margin-left: -180px; margin-top: -300px; background-color: #FFFFFF;z-index: 1">
												<div>
													<a href="javascript:closeLogin('<s:property value="#u.user.userNo" />');"
														style="margin-left: 360px; color: #FF0000;">关闭</a>
												</div>
												<div style="height: 20px;"></div>

												<div id="wjh" style="height: 80px; border-top: 1px solid gainsboro">
													<span style="line-height: 80px">头像</span>
													<a href="#">
														<img src="../../carcleaning_res/<s:property value="#u.user.icon"/>"
															style="max-width: 200px; height: 80px;" />
													</a>
												</div>
												<div id="wjh">
													<span>用户名</span>
													<a href="#">
														<s:property value="#u.user.username" />
													</a>
												</div>
												<div id="wjh">
													<span> 真实姓名 </span>
													<a href="#">
														<s:property value="#u.user.name" />
													</a>
												</div>
												<div id="wjh">
													<span> 手机号 </span>
													<a href="#">
														<s:property value="#u.user.mobilePhone" />
													</a>
												</div>
												<div id="wjh" style="background-color: #f2f2f2; height: 20px;"></div>
												<s:iterator value="#u.userCars" var="ca">
													<div id="wjh">
														<span id=""> 车型 </span>
														<a href="#">
															<s:property value="#ca.carBrand" />
														</a>
													</div>
													<div id="wjh">
														<span> 车牌号 </span>
														<a href="#">
															<s:property value="#ca.carNo" />
														</a>
													</div>
												</s:iterator>

												<div id="clear"></div>
											</div>
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
	<script type="text/javascript">
		$("#searchBtn").click(function() {
			$("#searchForm").submit();
		});
		$("li").eq(1).mouseenter(function() {
			$("img").eq(0).attr("src", "img/home(1).png");
		})
		$("li").eq(1).mouseleave(function() {
			$("img").eq(0).attr("src", "img/home.png");
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

		function openLogin(no) {
			document.getElementById("win" + no).style.display = "";
			document.getElementById("back" + no).style.display = "";
		}
		function closeLogin(no) {
			document.getElementById("win" + no).style.display = "none";
			document.getElementById("back" + no).style.display = "none";
		}
	</script>
</body>
</html>