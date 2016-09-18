//$(".adminVip").on("click",function(){
//	$(".tc").fadeToggle();
//	$(".blackBg").fadeToggle();
//});
//$(".tc-exit").on("click",function(){
//	$(".tc").fadeToggle();
//	$(".blackBg").fadeToggle();
//})
$(".menuLi").eq(2).css({
	"background-color":"#000",
	"border-left":"8px solid #fdbf16",
	"width":"205px"
})
$(".menuLi").eq(2).find(".menuArrow").css({
	"opacity":"1",
	"filter":"alpha(opacity=100)",
	"margin-left":"35px"
})
$(".accountBtn2").css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
$(".accountBtn2").on("click",function(){
	$(".accountBtn2,.accountBtn3").css({"border":"none","background-color":"#FDBE16"});
	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
	$(".conTable").show();
	$(".page").show();
	$(".addFrom").hide();
})
$(".accountBtn3").on("click",function(){
	$(".accountBtn2,.accountBtn3").css({"border":"none","background-color":"#FDBE16"});
	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
	$(".conTable").hide();
	$(".page").hide();
	$(".addFrom").show();
})

//$(".souImg").on("click",function(){
//	var a = $(".souInp").val();
//	if(a != ""){
//		$("tr").hide();
//		$("tr").eq(0).show();
//		for(var i = 0;i < $("td").length;i ++){
//			if($("td").eq(i).text() == a){
//				$("td").eq(i).parents("tr").show();
//			}
//		}
//	}else{
//		$("tr").show();
//	}
//})