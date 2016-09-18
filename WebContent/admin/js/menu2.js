window.onload = function(){
	reponseH(".menu",600);
//	$(".prevPage,.nextPage,.page-x").on("click",function(){page(this)});
	
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
	pageW();
	$(".addInp").on("blur",function(){
//		console.log($(".error").length);
		var a = $(this).val();
		var i = $(this).index(".addInp");
		var ismust = $(this).attr("ismust");
		var tp = $(this).attr("lx");
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
//		console.log($(".addInp").length);
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
					alert("成功！");
					$(".addInp").val("");
					$(".addInp").attr("statu","no");
					$(".addInp").css("border-color","#cdcdcd");
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
					alert("成功！");
					$(this).parents(".tc").find(".addInp").val("");
					$(this).parents(".tc").find(".addInp").attr("statu","no");
					$(this).parents(".tc").find(".addInp").css("border-color","#cdcdcd");
				}
			}
		}
	})
}
window.onresize = function(){
	reponseH(".menu",600);
	pageW();
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

function pageW(){
	var w = $("table").css("width");
	$(".page").css("width",w);
}
