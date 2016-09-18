<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/ad.css" />
<link href="css/lyz.calendar.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery2.1.4.min.js"></script>
<script src="js/lyz.calendar.min.js" type="text/javascript"></script>
<script>
	$(function() {
		//		        $("#txtBeginDate").calendar({
		//		            controlId: "divDate",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
		//		            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
		//		            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
		//		            readonly: true,                                       // 目标对象是否设为只读，默认：true
		//		            upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
		//		            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
		//		            callback: function () {                               // 点击选择日期后的回调函数
		////		                alert("您选择的日期是：" + $("#txtBeginDate").val());
		//		            }
		//		        });
		//		        $("#txtEndDate").calendar();
		$("#txtBeginDate1").calendar({
			controlId : "divDate", // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
			speed : 200, // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
			complement : true, // 是否显示日期或年空白处的前后月的补充,默认：true
			readonly : true, // 目标对象是否设为只读，默认：true
			upperLimit : new Date(), // 日期上限，默认：NaN(不限制)
			lowerLimit : new Date("2011/01/01"), // 日期下限，默认：NaN(不限制)
			callback : function() { // 点击选择日期后的回调函数
				//		                alert("您选择的日期是：" + $("#txtBeginDate1").val());
			}
		});
		$("#txtEndDate1").calendar();
	})
</script>
</head>
<body>
	<div id="header">
		<span class="headerLeft">THE&nbsp;CAR洗车助手</span>
		<a class="headerRight" href="Admin_logout">退出登录</a>
	</div>
	<div id="content">
		<script type="text/javascript" src="js/menu.js"></script>
		<script type="text/javascript" src="js/menu2.js"></script>
		<jsp:include page="isLogin.jsp"></jsp:include>
		<%
			if (null == session || session.getAttribute("username") == null) {
				out.print("<script>window.location.href='../index';</script>");
				return;
			}
			int type = (Integer) session.getAttribute("type");
			if (type != 0 && type != 4)
				out.print("<script>window.location.href='../index';</script>");
		%>

		<div class="inner">
			<p class="conTitle">广告位</p>
			<div class="line"></div>
			<div class="addManager">
				<input type="button" value="广告位列表" class="manaBtn2" />
				<input type="button" value="添加广告位" class="manaBtn3" />
			</div>
			<table class="conTable" border="1px" bordercolor="#858484"
				cellspacing="0px" style="border-collapse: collapse">
				<tr>
					<th>公司/门店名称</th>
					<th>上架时间</th>
					<th>状态</th>
					<th>图片</th>
					<th>详情图片</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.res.adverts" var="a">
					<tr>
						<td><s:if test="#a.company.id!=''">
								<s:property value="#a.company.name" />
							</s:if> <s:else>
								<s:property value="#a.store.name" />
								(<s:property value="#a.store.company.name" />)
							</s:else></td>
						<td><s:date name="#a.showTime" format="yyyy-MM-dd" /></td>
						<td><s:if test="#a.state==0">正常</s:if> <s:else>已下架</s:else></td>
						<td><img
							src="../../carcleaning_res/<s:property value="#a.adPic" />"
							class="adImg" /></td>
						<td><img
							src="../../carcleaning_res/<s:property value="#a.adDetail" />"
							class="adImg" /></td>
						<td><s:if test="#a.state==0">
								<input type="button" adId="<s:property value="#a.id" />"
									value="下架" class="delAdBtn" />
							</s:if> <s:else>---</s:else></td>
					</tr>
				</s:iterator>

			</table>
			<div class="page">
				<s:property value="pagerTool.getPagerBar()" escape="false" />
			</div>
			<form action="AAdvert_addAdvert" class="shopAdFrom" target="iframe"
				method="post" enctype="multipart/form-data">
				<p class="addP">广告位类型：</p>
				<select class="addInp addSelect" id="adType">
					<option value="0">公司广告位</option>
					<option value="1">门店广告位</option>
				</select>
				<p class="addP">公司/门店名称：</p>
				<select class="addInp addSelect" id="adStore">
					<optgroup label=""></optgroup>
				</select>
				<p class="addP">选择广告图片：</p>
				<input type="file" name="file" lx="" class="addInp" accept="image/*"
					style="padding-top: 10px;" />
				<p class="addP">选择广告详情图片：</p>
				<input type="file" name="detail" lx="" class="addInp"
					accept="image/*" style="padding-top: 10px;" />
				<p class="addP">上架时间：</p>
				<div>
					<input id="txtBeginDate1" type="text" lx="" class=""
						style="display: none;" />
					<input id="txtEndDate1" name="advert.showTime" type="text" lx=""
						class="addInp" placeholder="请填写上架时间" />
				</div>
				<input type="button" value="添加" class="shopAdBtn" />
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/ad.js"></script>
	<script type="text/javascript">
		$("#adType").change(function() {

			loadData($(this).val());
		});
		loadData(0);

		$(".delAdBtn").click(function() {
			if (confirm("确定要下架该广告位？")) {
				$.post("AAdvert_putOffAdvert", {
					"advert.id" : $(this).attr("adId"),
				}, function(data, status) {
					if (data.status == 200) {
						alert("广告下架成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		});

		function loadData(type) {
			var url = "ACompany_loadCompanys";
			var item = ""
			var option = "";
			$("#adStore").attr("name", "advert.company.id");
			if (type == 1) {
				url = "AStore_loadStores";
				$("#adStore").attr("name", "advert.store.id");
			}
			$.post(url, function(data, status) {
				if (data.status == 200) {
					var company = "";
					$.each(data.res, function(n, item) {
						if (type == 1 && item.company.name != company) {
							company = item.company.name;
							option += "<optgroup label=\""+company+"\"></optgroup>";
						}
						option = option + "<option value=\""+item.id+"\">" + item.name + "</option>";
					})
					$("#adStore").empty();
					$("#adStore").prepend(option);
				} else {
					alert(data.error);
				}
			});
		}
	</script>
</body>
</html>
