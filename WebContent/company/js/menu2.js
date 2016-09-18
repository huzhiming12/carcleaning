window.onload = function(){
	reponseH(".menu",600);
	//$(".prevPage,.nextPage,.page-x").on("click",function(){page(this)});
	
	$(".menuLi").on("click",function(){
		$(".menuLi").css({
			"background-color":"#2c2c32",
			"border-left":"none",
			"width":"100%"
		});
		$(".menuArrow").css({
			"opacity":"0",
			"filter":"alpha(opacity=0)",
			"margin-left":"0"
		});
		$(this).css({
			"background-color":"#000",
			"border-left":"8px solid #fdbf16",
			"width":"205px"
		});
		$(this).find(".menuArrow").css({
			"opacity":"1",
			"filter":"alpha(opacity=100)",
			"margin-left":"35px"
		})
	})
	//pageW();
	$(".addInp").on("blur",function(){
		console.log($(".error").length);
		var a = $(this).val();
		var i = $(this).index(".addInp");
		var ismust = $(this).attr("ismust");
		var tp = $(this).attr("sort");
		var len = $(this).attr("maxlength");
		var intReg = /^[0-9]*$/;
		var chReg = /[\u4e00-\u9fa5]/;
		var strReg = /^[A-Za-z]+$/;
		var phoneReg = /^1[3|4|5|7|8]\d{9}$/;
		var carReg = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
		if(a == ""){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*不能为空！");
			$(".error").eq(i).css("display","block");
		}else if(a.length != len && ismust == "yes"){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else if(tp == "int" && !intReg.test(a)){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else if(tp == "ch" && !chReg.test(a)){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else if(tp == "string" && !strReg.test(a)){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else if(tp == "phone" && !phoneReg.test(a)){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else if(tp == "chepai" && !carReg.test(a)){
			$(this).css("border-color","#d02642");
			$(this).attr("statu","no");
			$(".error").eq(i).html("*格式错误！");
			$(".error").eq(i).css("display","block");
		}else{
			$(this).css("border-color","#50ee3f");
			$(".error").eq(i).html("");
			$(".error").eq(i).css("display","none");
			$(this).attr("statu","ok");
		}
	})
	$(".addBtn").on("click",function(){
		console.log($(".addInp").length);
		var a;
		add:for(var i = 0;i < $(".addInp").length;i ++){
			a = $(".addInp").eq(i).attr("statu");
			if(a != "ok"){
				alert("请输入正确信息！")
				break add;
			}else if(i == $(".addInp").length - 1){
				if(a != "ok"){
					alert("请输入正确信息！")
					break add;
				}else{
					
					$.post("AUser_addUser", {
						"user.userNo" : $('#userNo').val(),
						"user.name" : $('#name').val(),
						"user.mobilePhone" : $('#phone').val(),
						"car.carNo" : $('#carNo').val(),
						"user.store.id" : $('#storeId').val()
					}, function(data, status) {
						if (data.status == 200) {
							alert("会员信息添加成功！");
							location.reload();
						} else {
							alert(data.error);
						}
					});
				}
			}
		}
	})
	$(".addBtn2").on("click",function(){
//		console.log($(this).parents(".tc").find(".addInp").length);
		var a;
		add:for(var i = 0;i < $(this).parents(".tc").find(".addInp").length;i ++){
			a = $(this).parents(".tc").find(".addInp").eq(i).attr("statu");
			if(a != "ok"){
				alert("请输入正确信息！")
				break add;
			}else if(i == $(this).parents(".tc").find(".addInp").length - 1){
				if(a != "ok"){
					alert("请输入正确信息！")
					break add;
				}else{
					var ifm = $('<iframe width="0" height="0" id="iframe" frameborder="0" name="iframe">');
					ifm.appendTo($('body'));
					$(".addFrom").submit();
					ifm.load(function() {
						var jsonStr = $(this).contents().find("*").first().text();
						var data = $.parseJSON(jsonStr);
						if (data.status == 200) {
							alert("店铺添加成功！");
							location.reload();
						} else
							alert(data.error);
					});
				}
			}
		}
	})
}
window.onresize = function(){
	reponseH(".menu",600);
	//pageW();
}
function reponseH(t,height){
	var w=document.documentElement.clientWidth ;//可见区域宽度
	var h=document.documentElement.clientHeight;//可见区域高度
	var ah = parseInt($(".inner").css("height"));
	console.log(ah);
	if(h < height){
		$(t).css("height",height + "px");
		if(height < ah){
			$(t).css("height",ah + "px");
		}
	}else{
		$(t).css("height",h - 60 + "px");
		if((h-60) < ah){
			$(t).css("height",ah + "px");
		}
	}
	var w2 = parseInt($("#content").css("width"));
	$(".inner").css("width",w2 - 275 + "px");
}
function page(t){
	var x = 1;
	var y = parseInt($(".pageAll1").text());
	console.log(y);
	
	var btu = $(t).html();
	console.log(btu);
	xxx = parseInt(btu);
	if(isNaN(xxx))
	{
		btu=$(t).attr("class");
		x = parseInt($(".dqy").html());
		var z = $(".dqy").index(".page-x");
		$(".page-x").removeClass("dqy");
		if(btu=="nextPage")
		{
			if(x<y)
			{
				if(parseInt(z) >= 3){
					x+=1;
					$(".page-x").eq(4).addClass("dqy");
				}else{
					x+=1;
					$(".page-x").eq(z+1).addClass("dqy");
				}
			}else{
				if(y<=5){
					$(".page-x").eq(y-1).addClass("dqy");
				}else{
					$(".page-x").eq(4).addClass("dqy");
				}
			}
		}else{
			if(x>1){
				if(parseInt(z) <= 1){
					x-=1;
					$(".page-x").eq(0).addClass("dqy");
				}else{
					x-=1;
					$(".page-x").eq(z-1).addClass("dqy");
				}
			}else{
				$(".page-x").eq(0).addClass("dqy");
			}
		}
	}else{
		x=xxx;
		$(".page-x").removeClass("dqy");
		$(t).addClass("dqy");
	}
	var ind = $(".page-x[class*=dqy]").index(".page-x");
	fenye(ind);
}
function fenye(index){
	var y = parseInt($(".pageAll1").text());
	var ye = parseInt($(".page-x").eq(index).html());
	if(index == "4" && ye != y){
		$(".page-x").eq(index).removeClass("dqy")
		$(".page-x").eq(index-1).addClass("dqy");
		for(var i = 0;i < 5;i ++){
			var dye = parseInt($(".page-x").eq(i).html());
			$(".page-x").eq(i).html(dye+1);
		}
	}else if(index == "0" && ye != "1"){
		$(".page-x").eq(index).removeClass("dqy")
		$(".page-x").eq(index+1).addClass("dqy");
		for(var i = 0;i < 5;i ++){
			var dye = parseInt($(".page-x").eq(i).html());
			$(".page-x").eq(i).html(dye-1);
		}
	}
}
function pageW(){
	var w = $("table").css("width");
	$(".page").css("width",w);
}
