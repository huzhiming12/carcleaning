<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="sidebar-nav">
		<ul id="dashboard-menu">
			<li <s:if test="selector=='appointment'">class="active"</s:if>>
				<a href="AAppointment_appointment">
					<i class="icon-home block">
						<s:if test="selector=='appointment'">
							<img src="img/home(1).png">
						</s:if>
						<s:else>
							<img src="img/home.png">
						</s:else>
					</i>
					<span>预约信息</span>
				</a>
			</li>
			<li <s:if test="selector=='user'">class="active"</s:if>>
				<a href="AUser_user">
					<i class="icon-signal">
						<s:if test="selector=='user'">
							<img src="img/signal(1).png">
						</s:if>
						<s:else>
							<img src="img/signal.png">
						</s:else>
					</i>
					<span>会员信息</span>
				</a>
			</li>
			<li <s:if test="selector=='coupon'">class="active"</s:if>>
				<a href="ACoupon_coupon">
					<i class="icon-barcode">
						<s:if test="selector=='coupon'">
							<img src="img/barcode(1).png">
						</s:if>
						<s:else>
							<img src="img/barcode.png">
						</s:else>
					</i>
					<span>优惠券</span>
				</a>

			</li>
			<li <s:if test="selector=='store'">class="active"</s:if>>
				<a href="AStore_store">
					<i class="icon-edit">
						<s:if test="selector=='store'">
							<img src="img/edit(1).png">
						</s:if>
						<s:else>
							<img src="img/edit.png">
						</s:else>
					</i>
					<span>店铺管理</span>
				</a>

			</li>
			<li <s:if test="selector=='adminManager'">class="active"</s:if>>
				<a href="Admin_adminManager">
					<i class="icon-user">
						<s:if test="selector=='adminManager'">
							<img src="img/user(1).png">
						</s:if>
						<s:else>
							<img src="img/user.png">
						</s:else>
					</i>
					<span>管理员</span>
				</a>
			</li>
			<li <s:if test="selector=='addUserUI'">class="active"</s:if>>
				<a href="AUser_addUserUI">
					<i class="icon-minus">
						<s:if test="selector=='addUserUI'">
							<img src="img/minus(1).png">
						</s:if>
						<s:else>
							<img src="img/minus.png">
						</s:else>
					</i>
					<span>添加会员</span>
				</a>
			</li>
		</ul>
	</div>
</body>
</html>