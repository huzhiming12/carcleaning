$(".storeBtn2").css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
//$(".storeBtn2").on("click",function(){
//	$(".storeBtn2,.storeBtn3").css({"border":"none","background-color":"#FDBE16"});
//	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
//	$(".conTable").css("display","none");
//	$(".conTable").eq(0).css("display","inline-block");
//	$(".storeBtn4,.storeBtn5").css("display","none");
//	$(".storeBtn4").css("display","inline-block");
//})
//$(".storeBtn3").on("click",function(){
//	$(".storeBtn2,.storeBtn3").css({"border":"none","background-color":"#FDBE16"});
//	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
//	$(".conTable").css("display","none");
//	$(".conTable").eq(1).css("display","inline-block");
//	$(".storeBtn4,.storeBtn5").css("display","none");
//	$(".storeBtn5").css("display","inline-block");
//})
$(".storeBtn4").on("click",function(){
	$(".tc").eq(0).fadeToggle();
	$(".blackBg").fadeToggle();
});
//$(".storeBtn5").on("click",function(){
//	$(".tc").eq(1).fadeToggle();
//	$(".blackBg").fadeToggle();
//});
$(".tc-exit").on("click",function(){
	$(".tc").fadeOut();
	$(".blackBg").fadeToggle();
})
$(".menuLi").eq(3).css({
	"background-color":"#000",
	"border-left":"8px solid #fdbf16",
	"width":"205px"
})
$(".menuLi").eq(3).find(".menuArrow").css({
	"opacity":"1",
	"filter":"alpha(opacity=100)",
	"margin-left":"35px"
})