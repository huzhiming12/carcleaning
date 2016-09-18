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
			<li <s:if test="selector=='lock'">class="active"</s:if>>
				<a href="AStore_lock">
					<i class="icon-lock">
						<s:if test="selector=='lock'">
							<img src="img/lock.png">
						</s:if>
						<s:else>
							<img src="img/lock(1).png">
						</s:else>
					</i>
					<span>锁车</span>
				</a>
			</li>
			<li <s:if test="selector=='storeAppointment'">class="active"</s:if>>
				<a href="AAppointment_storeAppointment">
					<i class="icon-signal">
						<s:if test="selector=='storeAppointment'">
							<img src="img/signal.png">
						</s:if>
						<s:else>
							<img src="img/signal(1).png">
						</s:else>
					</i>
					<span>预约信息</span>
				</a>
			</li>
			<li <s:if test="selector=='appointmentRecord'">class="active"</s:if>>
				<a href="AAppointment_appointmentRecord">
					<i class="icon-book">
						<s:if test="selector=='appointmentRecord'">
							<img src="img/notes.png">
						</s:if>
						<s:else>
							<img src="img/notes(1).png">
						</s:else>
					</i>
					<span> 预约记录</span>
				</a>
			</li>

		</ul>
	</div>

</body>
</html>