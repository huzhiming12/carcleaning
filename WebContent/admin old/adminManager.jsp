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
								<strong>管理员</strong>
							</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right"></div>
					</div>

					<div class="row-fluid">
						<div class="main">
							<div class="cfgroup">
								<ul class="nav nav-pills admine">
									<li role="presentation" class="active">
										<a href="#" style="background-color: #fdbe16;">店铺管理员列表</a>
									</li>
									<li role="presentation">
										<a href="#" style="background-color: #fdbe16;">添加店铺管理员</a>
									</li>
								</ul>
								<div class="container cfcont0">
									<table class="table table-striped">
										<thead>
											<tr>
												<td>账户</td>
												<td>类型</td>
												<td>权限范围</td>
												<td>操作</td>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="map.res.admins" var="a">
												<tr>
													<td>
														<s:property value="#a.username" />
													</td>
													<td>
														<s:if test="#a.type==0">系统管理员</s:if>
														<s:else>店铺管理员</s:else>
													</td>
													<td>
														<s:if test="#a.store.name!=''">
															<s:property value="#a.store.name" />
														</s:if>
														<s:else>
															系统平台
														</s:else>
													</td>
													<td>
														<button class="btn btn-danger delBtn"
															onclick="delId='<s:property value="#a.username" />'">删除</button>
													</td>
												</tr>
											</s:iterator>
										</tbody>
									</table>
									<div class="pagination" id="pagelist">
										<s:property value="pagerTool.getPagerBar()" escape="false" />
									</div>
								</div>


								<div class="container cfcont1 hide">
									<span class="input-group-addon" id="basic-addon1">管理权限</span>
									<select class="select" name="admin.store.id" id="store_id">
										<option value="0">系统管理员</option>
										<s:iterator value="map.stores" var="s">
											<option value="<s:property value="#s.id"/>"><s:property value="#s.name" />
											</option>
										</s:iterator>
									</select>
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon1">账户</span>
										<input type="text" class="form-control" placeholder="账户" id="username"
											name='admin.username'>
									</div>
									<div class="alert username" style="display: none">账户不能为空</div>
									<div class="input-group">
										<span class="input-group-addon" id="basic-addon2">密码</span>
										<input type="password" class="form-control" placeholder="密码" id="password"
											name='admin.password'>
									</div>
									<div class="alert password" style="display: none">密码不能为空</div>
									<div class="btn-group btn-group-justified" role="group">
										<div class="btn-group" role="group">
											<button type="button" id="addBtn" class="btn btn-warning">添加</button>
										</div>
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

	<!-- scripts -->
	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/deleteData.js"></script>
	<script src="js/exit.js"></script>

	<script type="text/javascript">
		var delId;
		$(".delBtn").click(function() {
			alert(delId);
			if (confirm("确定要删除吗？")) {
				$.post("Admin_delAdmin", {
					"admin.username" : delId,
				}, function(data, status) {
					if (data.status == 200) {
						alert("管理员删除成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		});
		function checkValue() {
			var flag = true;
			if ($("#username").val() == "") {
				$(".username").show();
				flag = false;
			} else {
				$(".username").hide();
			}
			if ($("#password").val() == "") {
				$(".password").show();
				flag = false;
			} else {
				$(".password").hide();
			}
			return flag;
		}

		$("#addBtn").click(function() {
			if (checkValue()) {
				$.post("Admin_addAdmin", {
					"admin.username" : $('#username').val(),
					"admin.password" : $('#password').val(),
					"admin.store.id" : $('#store_id').val()
				}, function(data, status) {
					if (data.status == 200) {
						alert("管理员添加成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		});

		var adminControl = $(".admine").children("li");
		adminControl.click(function() {
			// body...
			adminControl.removeClass("active");
			$(this).addClass("active");

			$(".container").addClass("hide");
			var className = ".cfcont" + $(this).index();
			$(className).removeClass("hide");
		})

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
		$("li").eq(4).mouseenter(function() {
			$("img").eq(3).attr("src", "img/edit(1).png");
		})
		$("li").eq(4).mouseleave(function() {
			$("img").eq(3).attr("src", "img/edit.png");
		})
		//  	$("li").eq(5).mouseenter(function(){
		//  		$("img").eq(4).attr("src","img/user(1).png");
		//  	})
		//  	$("li").eq(5).mouseleave(function(){
		//  		$("img").eq(4).attr("src","img/user.png");
		//  	})
		$("li").eq(6).mouseenter(function() {
			$("img").eq(5).attr("src", "img/minus(1).png");
		})
		$("li").eq(6).mouseleave(function() {
			$("img").eq(5).attr("src", "img/minus.png");
		})
	</script>
</body>
</html>