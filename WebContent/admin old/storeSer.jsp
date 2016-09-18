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

<!-- open sans font -->
<!-- <link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' /> -->

<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
								<s:if test="map.addRes.status=200">店铺服务添加成功！</s:if>
								<s:else>店铺服务添加失败！</s:else>
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
										<a href="#" data-toggle="modal" data-target="#myModal">添加店铺服务</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="row-fluid">
							<div class="main">
								<div class="cfgroup">
									<ul class="nav nav-pills admine">
										<li role="presentation">
											<a href="AStore_store" style="background-color: #fdbe16;">店铺列表</a>
										</li>
										<li role="presentation" class="active">
											<a href="AStore_storeSer" style="background-color: #fdbe16;">店铺服务列表</a>
										</li>
									</ul>
									<div class="container cfcont0">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>店铺名称</th>
													<th>服务名称</th>
													<th>服务内容</th>
													<th>价格</th>
													<th>服务图标</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="map.res.storeSers" var="ser">
													<tr>

														<td>
															<s:property value="#ser.store.name" />
														</td>
														<td>
															<s:property value="#ser.serName" />
														</td>
														<td>
															<s:property value="#ser.serContent" />
														</td>
														<td>
															<s:property value="#ser.price" />
														</td>
														<td>
															<a href="../../carcleaning_res/<s:property value="#ser.icon"/>">
																<img style="height: 50px; max-width: 300px;"
																	src="../../carcleaning_res/<s:property value="#ser.icon"/>">
															</a>
														</td>
														<td>
															<button class="btn btn-danger delBtn" onclick="delId=<s:property value="#ser.id" />">删除</button>
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
	</div>
	<!-- end main container -->

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加店铺服务</h4>
				</div>
				<div class="modal-body">
					<div class="row-fluid" id="row-fluid1">
						<form action="AStore_storeSer" id="storeForm" enctype="multipart/form-data" method="post">
							<div class="field-box">
								<label>店铺名称:</label>
								<select name="storeSer.store.id" id="store_id">
									<s:iterator value="map.store" var="s">
										<option value='<s:property value="#s.id"/>'><s:property value="#s.name" /></option>
									</s:iterator>
								</select>
							</div>
							<div class="alert store_id" style="display: none">还未选择店铺</div>
							<div class="field-box">
								<label>服务名称:</label>
								<input class="span8" type="text" name="storeSer.serName" id="ser_name" />
							</div>
							<div class="alert ser_name" style="display: none">服务名称不能为空</div>
							<div class="field-box">
								<label>服务内容:</label>
								<input class="span8" type="text" name="storeSer.serContent" id="ser_content" />
							</div>
							<div class="alert ser_content" style="display: none">服务内容不能为空</div>
							<div class="field-box">
								<label>服务价格:</label>
								<input class="span8" type="text" name="storeSer.price" id="ser_price" />
							</div>
							<div class="alert ser_price" style="display: none">价格格式错误</div>
							<div class="field-box">
								<label>服务图标:</label>
								<input type="file" id="ser_icon" name="file">
							</div>
							<div class="alert ser_icon" style="display: none">服务图标不能为空</div>
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
		var delId;
		$(".delBtn").click(function() {
			if(confirm("确定要删除该店铺服务吗？"))
				$.post("AStore_delStoreSer", {
					"storeSer.id" : delId,
				}, function(data, status) {
					if (data.status == 200) {
						alert("店铺服务删除成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
		});
		
		function checkValue() {
			var flag = true;
			if ($("#ser_id").val() == "") {
				$(".ser_id").show();
				flag = false;
			} else {
				$(".ser_id").hide();
			}

			if ($("#ser_name").val() == "") {
				$(".ser_name").show();
				flag = false;
			} else {
				$(".ser_name").hide();
			}
			if ($("#ser_content").val() == "") {
				$(".ser_content").show();
				flag = false;
			} else {
				$(".ser_content").hide();
			}
			var str = /^[0-9]*$/;
			var judge_price = str.test($('#ser_price').val());
			if ($("#ser_price").val() == "" || !judge_price) {
				$(".ser_price").show();
				flag = false;
			} else {
				$(".ser_price").hide();
			}
			if ($("#ser_icon").val() == "") {
				$(".ser_icon").show();
				flag = false;
			} else {
				$(".ser_icon").hide();
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