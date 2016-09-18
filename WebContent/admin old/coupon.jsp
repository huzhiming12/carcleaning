<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>洗车助手</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap -->

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
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
<style>
.coupon_time {
	display: none;
}

.price {
	display: none;
}

.price_range {
	display: none;
}
</style>

</head>
<body>

	<!-- navbar -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- end navbar -->

	<!-- sidebar -->
	<jsp:include page="left_menu.jsp"></jsp:include>
	<!-- end sidebar -->
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
								<strong>发布优惠券</strong>
							</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right"></div>
					</div>

					<div class="row-fluid">
						<form>
							<div class="field-box">
								<label>优惠券价格:</label>
								<input class="span8" type="text" placeholder="例如：99，只能添加数字" id="coupon_price" />
							</div>
							<div class="alert price"></div>
							<div class="field-box">
								<label>优惠券使用价格:</label>
								<input class="span8" type="text" placeholder="例如：用户超过多少钱才能使用" id="coupon_price_range" />
							</div>
							<div class="alert price_range"></div>
							<div class="field-box">
								<label>优惠券时间使用截止日期:</label>
								<input class="span8" type="text" placeholder="优惠券使用的截止日期" id="coupon_time_range" readonly="readonly">
							</div>
							<div class="alert coupon_time"></div>

							<div class="field-box">
								<input class="btn btn-warning" type="button" value="发布" id="publish" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="js/exit.js"></script>
	<script type="text/javascript">
		$('#coupon_time_range').datetimepicker({
			format : 'yyyy-mm-dd',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			showMeridian : 1,
		});

		var coupon_price = document.getElementById('coupon_price');
		var coupon_time_range = document.getElementById('coupon_time_range');
		var coupon_price_range = document.getElementById('coupon_price_range');
		var tlips_coupon_time = $('.coupon_time');
		var tlips_coupon_price = $('.price');
		var tlips_coupon_price_range = $('.price_range');

		function checkPrice() {
			var str = /^[0-9]*$/;
			var judge_price = str.test($('#coupon_price').val());
			if (judge_price && $('#coupon_price').val() != "") {
				tlips_coupon_price.css('display', 'none');
				return true;
			} else {
				tlips_coupon_price.css('display', 'block');
				tlips_coupon_price.html('格式错误');
				return false;
			}
		}
		function checkPriceRange() {
			var str = /^[0-9]*$/;
			var judge_price_range = str.test($('#coupon_price_range').val());
			if (judge_price_range && $('#coupon_price_range').val() != "") {
				tlips_coupon_price_range.css('display', 'none');
				return true;
			} else {
				tlips_coupon_price_range.css('display', 'block');
				tlips_coupon_price_range.html('格式错误');
				return false;
			}
		}
		function checkTimeRange() {
			var str = /^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
			var judge_time_range = str.test($('#coupon_time_range').val());
			if (judge_time_range) {
				tlips_coupon_time.css('display', 'none');
				return true;
			} else {
				tlips_coupon_time.css('display', 'block');
				tlips_coupon_time.html('格式错误');
				return false;
			}
		}

		var btns = document.getElementById('publish');
		btns.onclick = function(event) {
			if (checkPrice() && checkPriceRange() && checkTimeRange()) {

				$.post("ACoupon_addCoupons", {
					"couponInfo.discount" : coupon_price.value,
					"couponInfo.conditionPrice" : coupon_price_range.value,
					"couponInfo.endDate" : coupon_time_range.value
				}, function(data, status) {
					if (data.status == 200) {
						alert("优惠券发布成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		}

		$("li").eq(2).mouseenter(function() {
			$("img").eq(1).attr("src", "img/signal(1).png");
		})
		$("li").eq(2).mouseleave(function() {
			$("img").eq(1).attr("src", "img/signal.png");
		})
		/* $("li").eq(3).mouseenter(function() {
			$("img").eq(2).attr("src", "img/barcode(1).png");
		})
		$("li").eq(3).mouseleave(function() {
			$("img").eq(2).attr("src", "img/barcode.png");
		}) */
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
	</script>

</body>
</html>