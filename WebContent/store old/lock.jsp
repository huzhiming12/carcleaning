<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>洗车助手</title>

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
.play-e {
	color: red;
	display: none;
}

.bu1 {
	border: 0px solid #000;
	/*border: none;*/
	background-color: orange;
	width: 150px;
	height: 20px;
	color: white;
	font-size: 10px;
	border-radius: 6px;
}

.bu2 {
	border: 0px solid #000;
	background-color: black;
	/*border: none;*/
	width: 150px;
	height: 20px;
	color: white;
	font-size: 10px;
	border-radius: 6px;
}
</style>
</head>
<body>

	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="left_menu.jsp"></jsp:include>

	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper">

				<!-- products table-->
				<!-- the script for the toggle all checkboxes from header is located in js/theme.js -->
				<div class="table-wrapper products-table section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>
								<strong>锁定车位</strong>
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

							<!-- <a class="btn-flat success new-product">+ Add product</a> -->
						</div>
					</div>

					<div class="row-fluid">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>车位</th>
									<th>状态</th>
									<th colspan="2" align="center">操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="map.lots" var="l">
									<tr>
										<td>
											<s:if test="#l.parkNo>4">
												快洗车位<s:property value="#l.parkNo" />
											</s:if>
											<s:else>
										    		精洗车位<s:property value="#l.parkNo" />
											</s:else>
										</td>
										<td>
											<s:if test="#l.state==0">
												<label class="label label-success">未锁定</label>
											</s:if>
											<s:else>
												<label class="label label-important">已锁定</label>
											</s:else>
										</td>
										<td>
											<s:if test="#l.state==0">
												<button class="bu1" onclick="lotId=<s:property value="#l.id" />" value='one'>锁定</button>
											</s:if>
											<s:else>
												<button class="bu2" onclick="lotId=<s:property value="#l.id" />" value='one'>解锁</button>
											</s:else>

										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
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
		var lotId;
		$(".bu1").click(function() {
			lock(1);
		});
		$(".bu2").click(function() {
			lock(0);
		});
		
		function lock(flag)
		{
			$.post("AStore_lockParkingLot", {
				"lotId" : lotId,
				"flag" : flag,
			}, function(data, status) {
				if (data.status == 200) {
					alert("操作成功！")
					location.reload();
				} else {
					alert(data.error);
				}
			});
		}
		

		$("li").eq(2).mouseenter(function() {
			$("img").eq(1).attr("src", "img/signal.png");
		})

		$("li").eq(2).mouseleave(function() {
			$("img").eq(1).attr("src", "img/signal(1).png");
		})

		$("li").eq(3).mouseenter(function() {
			$("img").eq(2).attr("src", "img/notes.png");
		})
		$("li").eq(3).mouseleave(function() {
			$("img").eq(2).attr("src", "img/notes(1).png");
		})
	</script>
</body>
</html>