<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>管理员</title>
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
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left_menu.jsp"></jsp:include>
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
								<strong>店铺管理</strong>
							</h4>
						</div>
					</div>
					<div class="row-fluid filter-block">
						<div class="">
							<div class="alert"
								<s:if test="map.addRes.status==200||map.addRes.status==400"> style="display: block"</s:if>
								<s:else>style="display: none"</s:else>>
								<s:if test="map.addRes.status=200">添加成功！</s:if>
								<s:else>店铺添加失败！</s:else>
							</div>
						</div>
					</div>
					<div class="row-fluid filter-block">
						<div class="pull-right" style="margin-right: 100px;">
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									添加
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#" data-toggle="modal" data-target="#myModal">添加店铺</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="row-fluid">
							<div class="main">
								<ul class="nav nav-pills admine">
									<li role="presentation" class="active">
										<a href="AStore_store" style="background-color: #fdbe16;">店铺列表</a>
									</li>
									<li role="presentation">
										<a href="AStore_storeSer" style="background-color: #fdbe16;">店铺服务列表</a>
									</li>
								</ul>
								<div class="container cfcont0">
									<table class="table table-striped">
										<thead>
											<tr>
												<td>店铺名称</td>
												<td>店铺地址</td>
												<td>联系电话</td>
												<td>店铺logo</td>
												<td>操作</td>
											</tr>
										</thead>
										<tbody>
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
														<a href="../../carcleaning_res/<s:property value="#s.logo"/>">
															<img style="height: 50px; max-width: 300px;"
																src="../../carcleaning_res/<s:property value="#s.logo"/>">
														</a>
													</td>
													<td>
														<button class="btn btn-danger delBtn" onclick="delId=<s:property value="#s.id" />">删除</button>
													</td>
												</tr>

											</s:iterator>
										</tbody>
									</table>
								</div>
								<div class="pagination" id="pagelist">
									<s:property value="pagerTool.getPagerBar()" escape="false" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加店铺</h4>
				</div>
				<div class="modal-body">
					<div class="row-fluid" id="row-fluid1">
						<form action="AStore_store" id="storeForm" enctype="multipart/form-data" method="post">
							<div class="field-box">
								<label>所属公司Id:</label>
								<input class="span8" type="text" name="store.company.id"/>
							</div>
							<div class="field-box">
								<label>店铺名称:</label>
								<input class="span8" type="text" name="store.name" id="shop_name" />
							</div>
							<div class="alert shop-name" style="display: none">店铺名称不能为空</div>
							<div class="field-box">
								<label>店铺电话:</label>
								<input class="span8" type="text" name="store.phone" id="shop_phone" />
							</div>
							<div class="alert shop-phone" style="display: none">店铺联系电话不能为空</div>
							<div class="field-box">
								<label>店铺地址:</label>
								<input class="span8" type="text" name="store.address" id="shop_address" />
							</div>
							<div class="alert shop-address" style="display: none">店铺地址不能为空</div>
							<div class="field-box">
								<label>店铺logo:</label>
								<input type="file" id="shop_logo" name="file">
							</div>
							<div class="alert shop-logo" style="display: none">店铺logo不能为空</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="btnAdd" class="btn btn-primary">添加</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /.modal -->


	<!-- scripts -->
	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/deleteData.js"></script>
	<script src="js/exit.js"></script>

	<script type="text/javascript">
		$('.dropdown-toggle').dropdown()
		
		var delId;
		$(".delBtn").click(function() {
			if(confirm("确定要删除该店铺？"))
				$.post("AStore_delStore", {
					"store.id" : delId,
				}, function(data, status) {
					if (data.status == 200) {
						alert("店铺删除成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
		});

		function checkValue() {
			var flag = true;
			if ($("#shop_name").val() == "") {
				$(".shop-name").show();
				flag = false;
			} else {
				$(".shop-name").hide();
			}

			if ($("#shop_phone").val() == "") {
				$(".shop-phone").show();
				flag = false;
			} else {
				$(".shop-phone").hide();
			}
			if ($("#shop_address").val() == "") {
				$(".shop-address").show();
				flag = false;
			} else {
				$(".shop-address").hide();
			}
			if ($("#shop_logo").val() == "") {
				$(".shop-logo").show();
				flag = false;
			} else {
				$(".shop-logo").hide();
			}
			return flag;
		}

		//添加上传
		$("#btnAdd").click(function() {
			if (checkValue()) {
				$("#storeForm").submit();
			}
		});

		$("li").eq(1).mouseenter(function() {
			$("img").eq(0).attr("src", "img/home(1).png");
		})
		$("li").eq(1).mouseleave(function() {
			$("img").eq(0).attr("src", "img/home.png");
		})
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
		/* $("li").eq(4).mouseenter(function() {
			$("img").eq(3).attr("src", "img/edit(1).png");
		})
		$("li").eq(4).mouseleave(function() {
			$("img").eq(3).attr("src", "img/edit.png");
		}) */
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