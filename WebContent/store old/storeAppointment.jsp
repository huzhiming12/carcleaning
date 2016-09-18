<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta http-equiv="refresh" content="5"> -->

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
									<th class="span3"><span class="line"></span>洗车位</th>
									<th class="span3"><span class="line"></span>类型</th>
									<th class="span3"><span class="line"></span>操作</th>
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
											<s:date name="#a.appointTime" format="yyyy-MM-dd HH:mm" />
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
											<s:if test="#a.type==0">精洗</s:if>
											<s:else>快洗</s:else>
										</td>
										<td>
											<a href="#" onclick="closeAppointment(<s:property value="#a.id" />)">超时关闭</a>
											|
											<a href="#" class="prepareTime"
												onclick="changeValue(<s:property value="#a.type" />,'<s:date name="#a.appointTime" format="yyyy-MM-dd HH:mm" />',<s:property value="#a.id" />)"
												data-toggle="modal" data-target="#myModal">推迟</a>
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

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">预约推迟</h4>
				</div>
				<div class="modal-body">
					<div class="row-fluid" id="row-fluid1">
						<form action="AStore_store" id="storeForm" enctype="multipart/form-data" method="post">
							<div class="field-box">
								<label>当前预约时间:</label>
								<input id="currentTime" class="span8" type="text" readonly="readonly" />
								<label id="timeLabel"></label>
								<input id="timeNum" class="span8" type="text" value="" />
								<div class="alert time_num" style="display: none;"></div>
								<label>推迟后时间(每个时间段精洗40分钟，快洗20分钟):</label>
								<input id="resultTime" class="span8" type="text" readonly="readonly" />
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="delayBtn" class="btn btn-primary">推迟</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>

	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/exit.js"></script>
	<script type="text/javascript">
		function closeAppointment(id) {
			if (confirm("确定要关闭预约？")) {
			$.post("AAppointment_closeAppointment", {
				"appointment.id" : id,
			}, function(data, status) {
				if (data.status == 200) {
					alert("预约关闭成功！")
					location.reload();
				} else {
					alert(data.error);
				}
			});
			}
		}
		
		var date;//当前预约的时间
		var type;//预约类型
		var appointId;
		var h;
		var m;
		var duringTime =20; //每段时间20分钟
		var num;
		var delayTime;
		function changeValue(t,d,id)
		{
			date =d;
			type =t;
			appointId =id;
		}
		$(".prepareTime").click(function() {
			 h =parseInt(date.substr(11,2));
			 m =parseInt(date.substr(14,2));
			 if(type==0)
				 duringTime =40;
			 else
				 duringTime =20;
			 num = parseInt(((18-h)*60-m)/duringTime);
			 
			$("#currentTime").val(date);
			$("#timeLabel").text("推迟时间段个数(1-"+num+"):");
		});
		
		//数目焦点转移
		$("#timeNum").blur(function() {
			checkValue();
		});
		
		function checkValue()
		{
			var str = /^[0-9]*$/;
			var judge_num = str.test($('#timeNum').val());
			var flag=false;
			if(judge_num && $('#timeNum').val()!="")
			{
				if(parseInt($('#timeNum').val())>num ||parseInt($('#timeNum').val())<=0)
				{
					$(".time_num").show();
					$(".time_num").html("延迟数目超出范围");
				}
				else {
					$(".time_num").hide();
					flag =true;
				}
			}else{
				$(".time_num").show();
				$(".time_num").html("格式错误！");
			}
			if(flag){
				h =parseInt(date.substr(11,2));
				m =parseInt(date.substr(14,2));
				totalTime = parseInt($('#timeNum').val())*duringTime;
				totalTime+=m;
				h =h+ parseInt(totalTime/60);
				m = totalTime%60;
				delayTime = date.substr(0,11)+h+":"+m;
				//alert(resultTime);
				$("#resultTime").val(delayTime);
			}
			return flag;
		}
		
		$("#delayBtn").click(function() {
			if(checkValue()){
				$.post("AAppointment_delayAppointment", {
					"appointment.id" : appointId,
					"appointment.appointTime":delayTime+":00",
					"appointment.type":type,
				}, function(data, status) {
					if (data.status == 200) {
						alert("预约推迟成功！")
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		})
		
		$("li").eq(1).mouseenter(function() {
			$("img").eq(0).attr("src", "img/lock.png");
		})
		$("li").eq(1).mouseleave(function() {
			$("img").eq(0).attr("src", "img/lock(1).png");
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