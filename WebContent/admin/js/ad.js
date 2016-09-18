$(".menuLi[sta='ggw']").css({
	"background-color":"#000",
	"border-left":"8px solid #fdbf16",
	"width":"205px"
})
$(".menuLi[sta='ggw']").find(".menuArrow").css({
	"opacity":"1",
	"filter":"alpha(opacity=100)",
	"margin-left":"35px"
})
$(".manaBtn2").css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
$(".manaBtn2").on("click",function(){
	$(".manaBtn2,.manaBtn3").css({"border":"none","background-color":"#FDBE16"});
	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
	$(".conTable").show();
	$(".page").show();
	$(".shopAdFrom").hide();
})
$(".manaBtn3").on("click",function(){
	$(".manaBtn2,.manaBtn3").css({"border":"none","background-color":"#FDBE16"});
	$(this).css({"border":"1px solid #FDBE16","background-color":"#F7F7F7"});
	$(".conTable").hide();
	$(".page").hide();
	$(".shopAdFrom").show();
})
$(".companyAdBtn,.shopAdBtn").on("click",function(){
		var a;
		add:for(var i = 0;i < $(this).parent().find(".addInp").length;i ++){
			a = $(this).parent().find(".addInp").eq(i).attr("statu");
			if(a != "ok"){
				alert("请输入正确信息！")
				break add;
			}else if(i == $(this).parent().find(".addInp").length - 1){
				if(a != "ok"){
					alert("请输入正确信息！")
					break add;
				}else{
					var ifm = $('<iframe width="0" height="0" id="iframe" frameborder="0" name="iframe">');
					ifm.appendTo($('body'));
					$(".shopAdFrom").submit();
					ifm.load(function() {
						var jsonStr = $(this).contents().find("*").first().text();
						var data = $.parseJSON(jsonStr);
						if (data.status == 200) {
							alert("广告添加成功！");
							location.reload();
						} else
							alert(data.error);
					});
				}
			}
		}
	});
	
	
	
	