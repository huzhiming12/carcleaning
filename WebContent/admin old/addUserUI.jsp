<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>洗车助手</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

.card-number {
	display: none;
}

.name {
	display: none;
}

.tel-number {
	display: none;
}

.car-number {
	display: none;
}

.save {
	display: none;
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
								<strong>添加会员</strong>
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
						<form>
							<div class="field-box">
								<label>卡号:</label>
								<input class="span8 " type="text" placeholder="卡号为6位数字" id="card_number" />
								<div class="alert card-number">Best check yo self, you're not looking too good.</div>
							</div>
							<div class="field-box">
								<label>姓名:</label>
								<input class="span8" type="text" placeholder="请输入姓名" id="name" />
								<div class="alert name">Best check yo self, you're not looking too good.</div>
							</div>
							<div class="field-box">
								<label>电话号:</label>
								<input class="span8" type="text" placeholder="请手机号码" id="tel_number" />
								<div class="alert tel-number">Best check yo self, you're not looking too good.</div>
							</div>
							<div class="field-box">
								<label>车牌号:</label>
								<input class="span8" type="text" placeholder="请输入车牌号" id="car_number" />
								<div class="alert car-number">Best check yo self, you're not looking too good.</div>
							</div>
							<div class="field-box">
								<label>所属公司Id:</label>
								<input class="span8" type="text" placeholder="公司编号（3或4）" id="company" />
							</div>
							<div class="field-box">

								<input class="btn btn-warning" type="button" value="添加" onClick="addMember(this)" name="btn" />
							</div>
							<div class="alert save">保存成功</div>
						</form>
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
		
		function addMember(opp) {
			// alert($('#card_number').val());

			var pattern = /[0-9]{6}/;
			var reg = /^([\u4e00-\u9fa5]){2,7}$/;
			var tel_reg = /^1[3,5,7,8]\d{9}$/;
			var car_reg = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
			var judgecard = pattern.test($('#card_number').val());
			var judgename = reg.test($('#name').val());
			var judgetel = tel_reg.test($('#tel_number').val());
			var judgecar = car_reg.test($('#car_number').val());
			var tlips_save = $('.save');
			if (judgecard && judgename && judgetel && judgecar) {

				$.post("AUser_addUser", {
					"user.userNo" : $('#card_number').val(),
					"user.name" : $('#name').val(),
					"user.mobilePhone" : $('#tel_number').val(),
					"car.carNo" : $('#car_number').val(),
					"user.company.id":$('#company').val()
				}, function(data, status) {
					if (data.status == 200) {
						alert("会员信息添加成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			} else {
				tlips_save.css('display', 'block');
				tlips_save.html('请重新填写正确数据');
			}

		}
		var tlips = $('.card-number');
		var tlips_name = $('.name');
		var tlips_tel_number = $('.tel-number');
		var tlips_car_number = $('.car-number');

		$("#card_number").blur(function() {
			var pattern = /^\d{6}$/;
			var judgecard = pattern.test($('#card_number').val());
			if (judgecard) {
				tlips.css('display', 'none');
			} else {
				tlips.css('display', 'block');
				tlips.html('格式错误');
			}
		});
		$("#name").blur(function() {
			var reg = /^([\u4e00-\u9fa5]){2,7}$/;
			var judgename = reg.test($('#name').val());
			if (judgename) {
				tlips_name.css('display', 'none');
			} else {
				tlips_name.css('display', 'block');
				tlips_name.html('格式错误');
			}
		});
		$("#tel_number").blur(function() {
			var tel_reg = /^1[3,5,7,8]\d{9}$/;
			var judgetel = tel_reg.test($('#tel_number').val());
			if (judgetel) {
				tlips_tel_number.css('display', 'none');
			} else {
				tlips_tel_number.css('display', 'block');
				tlips_tel_number.html('格式错误');
			}
		});
		$("#car_number").blur(function() {
			var car_reg = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
			var judgecar = car_reg.test($('#car_number').val());
			if (judgecar) {
				tlips_car_number.css('display', 'none');
			} else {
				tlips_car_number.css('display', 'block');
				tlips_car_number.html('格式错误');
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
		//  	$("li").eq(6).mouseenter(function(){
		//  		$("img").eq(5).attr("src","img/minus(1).png");
		//  	})
		//  	$("li").eq(6).mouseleave(function(){
		//  		$("img").eq(5).attr("src","img/minus.png");
		//  	})
	</script>
</body>

</body>
</html>