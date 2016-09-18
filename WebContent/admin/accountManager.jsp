<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>洗车助手</title>
<link rel="shortcut icon" href="img/car.jpg">
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/management.css" />
<link rel="stylesheet" href="css/lyz.calendar.css" />
<script type="text/javascript" src="js/jquery2.1.4.min.js"></script>
<script type="text/javascript" src="js/lyz.calendar.min.js"></script>
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
		$("#txtEndDate").calendar();
		//		        $("#txtBeginDate2").calendar({
		//		            controlId: "divDate2",                                 // 弹出的日期控件ID，默认: $(this).attr("id") + "Calendar"
		//		            speed: 200,                                           // 三种预定速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认：200
		//		            complement: true,                                     // 是否显示日期或年空白处的前后月的补充,默认：true
		//		            readonly: true,                                       // 目标对象是否设为只读，默认：true
		//		            upperLimit: new Date(),                               // 日期上限，默认：NaN(不限制)
		//		            lowerLimit: new Date("2011/01/01"),                   // 日期下限，默认：NaN(不限制)
		//		            callback: function () {    
		//		            	
		//		            }
		//		        });
		$("#txtEndDate2").calendar({
			callback : function() {
				$(".xgTermBtn").css("display", "inline-block");
			}

		});
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
			if(null==session|| session.getAttribute("username")==null)
			{
				out.print("<script>window.location.href='../index';</script>");
				return;
			}
			int type = (Integer) session.getAttribute("type");
			if(type!=0 && type !=3)
				out.print("<script>window.location.href='../index';</script>");
		%>
		<div class="blackBg"></div>
		<div class="tc tc-companyAct">
			<img src="img/exit.png" class="tc-exit" />
			<form action="" class="addCompanyActFrom addFrom" style="margin-top: 20px;">
				<p class="addP2">公司名称：</p>
				<select class="addInp addSelect" id="companyId">
					<s:iterator value="map.companys" var="c">
						<option value="<s:property value="#c.id"/>"><s:property value="#c.name" />
						</option>
					</s:iterator>
				</select>
				<p class="addP2">账号：</p>
				<input type="text" id="Cusername" lx="" maxlength="110" ismust="no" class="addInp"
					placeholder="请输入账号" />
				<p class="addP2">初始密码：</p>
				<input type="text" id="Cpassword" lx="" maxlength="100" ismust="no" class="addInp"
					placeholder="请输入密码" />
				<p class="addP2">期限：</p>
				<div>
					<input id="txtBeginDate" type="text" lx="" class="" style="display: none;" />
					<input id="txtEndDate" type="text" lx="" class="addInp" placeholder="请选择期限" />
				</div>
				<input type="button" value="添加" class="addCompanyBtn " />
			</form>
		</div>
		<div class="tc tc-shopAct">
			<img src="img/exit.png" class="tc-exit" />
			<form action="" class="addShopActFrom addFrom" style="margin-top: 20px;">
				<p class="addP2">所属门店：</p>
				<select class="addInp2 addSelect" id="storeId">
					<s:iterator value="map.stores" var="s">
						<option value="<s:property value="#s.id"/>">(
							<s:property value="#s.company.name" />)
							<s:property value="#s.name" />
						</option>
					</s:iterator>
				</select>
				<p class="addP2">账号：</p>
				<input type="text" id="Susername" lx="" maxlength="1000" ismust="no" class="addInp"
					placeholder="请输入账号" />
				<p class="addP2">初始密码：</p>
				<input type="text" id="Spassword" lx="" maxlength="110" ismust="no" class="addInp"
					placeholder="请输入密码" />
				<!--<p class="addP2">门店logo：</p>
						<input type="file" lx="" class="addInp3"/>-->
				<input type="button" value="添加" class="addShopBtn" />
			</form>
		</div>
		<div class="inner">
			<p class="conTitle">账号管理</p>
			<div class="line"></div>
			<div class="addManager">
				<input type="button" value="账号列表" class="manaBtn2" />
				<input type="button" value="添加店铺账号" class="addShopAct" />
				<input type="button" value="添加公司账号" class="addCompanyAct" />

			</div>
			<form action="ACompany_accountManager" method="post" class="companyFrom addFrom">
				<p class="addP">选择公司：</p>
				<select class="comInp" id="companySelector" name="cid">
					<s:iterator value="map.companys" var="c">
						<option value="<s:property value="#c.id"/>"
							<s:if test="cid==#c.id"> selected="selected"</s:if>><s:property value="#c.name" />
						</option>
					</s:iterator>
				</select>
				<input type="submit" value="确定" class="companyBtn" />
			</form>
			<div class="companyZH">
				<p>
					账号：
					<span class="company-zhanghao">
						<s:property value="map.accounts.companyAdmin[0].username" />
					</span>
				</p>
				<p>
					状态：
					<span>
						<s:if test="map.accounts.companyAdmin[0].state==0">正常</s:if>
						<s:elseif test="map.accounts.companyAdmin[0].state==1">已锁定</s:elseif>
					</span>
				</p>
				<p>
					期限：
					<span class="company-term">
						<s:date name="map.company.endDate" format="yyyy-MM-dd" />
					</span>
				</p>
				<p>
					操作：

					<s:if test="map.accounts.companyAdmin[0].state==0">
						<span class="company-operat lock"
							username="<s:property value="map.accounts.companyAdmin[0].username" />">锁定</span>
					</s:if>
					<s:elseif test="map.accounts.companyAdmin[0].state==1">
						<span class="company-operat unlock"
							username="<s:property value="map.accounts.companyAdmin[0].username" />">解锁</span>
					</s:elseif>
				</p>
				<div class="ZHdiv">
					修改期限：
					<s:if test="map.accounts.companyAdmin[0].username!=''">
						<div style="display: inline-block;">
							<input id="txtBeginDate2" type="text" lx="" class="" style="display: none;" />
							<input id="txtEndDate2" type="text" lx="" class="xgTerm" placeholder="点击选择修改期限" />
						</div>
					</s:if>
					<div class="xgTermBtn">确定</div>
				</div>
			</div>
			<table class="conTable" border="1px" bordercolor="#858484" cellspacing="0px"
				style="border-collapse: collapse;">
				<tr>
					<th>门店名称</th>
					<th>账号</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<s:iterator value="map.accounts.storeAdmin" var="s">
					<tr>
						<td>
							<s:property value="#s.store.name" />
						</td>
						<td>
							<s:property value="#s.username" />
						</td>
						<td>
							<s:if test="#s.state==0">正常</s:if>
							<s:elseif test="#s.state==1">已锁定</s:elseif>
						</td>
						<td>
							<s:if test="#s.state==0">
								<input type="button" value="锁定" username="<s:property value="#s.username" />"
									class="disableBtn lock" />
							</s:if>
							<s:elseif test="#s.state==1">
								<input type="button" value="解锁" username="<s:property value="#s.username" />"
									class="disableBtn unlock" />
							</s:elseif>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
	<script type="text/javascript" src="js/management.js"></script>
	<script type="text/javascript">
		$(".xgTermBtn").click(function() {
			if (confirm("确定要修改期限？")) {
				$.post("ACompany_changeSerTime", {
					"company.id" : <s:property value="map.company.id" />,
					"company.endDate" : $("#txtEndDate2").val()
				}, function(data, status) {
					if (data.status == 200) {
						alert("服务期限修改成功！")
						location.reload();
					} else {
						alert(data.error)
					}
				});
			}
		});

		$(".lock").click(function() {
			if (confirm("确定要锁定该账户？")) {
				changeAccountState($(this).attr("username"), 1);
			}
		});
		$(".unlock").click(function() {
			if (confirm("确定要解锁该账户？")) {
				changeAccountState($(this).attr("username"), 0);
			}
		});

		function changeAccountState(username, type) {
			//type 0：解锁 1：锁定
			var msg = "解锁";
			if (type == 1)
				msg = "锁定";
			$.post("Admin_changeAccountState", {
				"admin.username" : username,
				"admin.state" : type
			}, function(data, status) {
				if (data.status == 200) {
					alert("账号" + msg + "成功！")
					location.reload();
				} else {
					alert(data.error)
				}
			});
		}
	</script>
</body>
</html>
