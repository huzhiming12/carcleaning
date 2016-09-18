$(".storeBtn2").css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});

$(".storeBtn4").on("click",function(){
	$(".tc").eq(0).fadeToggle();
	$(".blackBg").fadeToggle();
});

$(".tc-exit").on("click",function(){
	$(".tc").fadeOut();
	$(".blackBg").fadeToggle();
})
