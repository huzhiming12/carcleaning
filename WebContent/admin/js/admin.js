$(".menuLi[sta='gly']").css({
	"background-color" : "#000",
	"border-left" : "8px solid #fdbf16",
	"width" : "205px"
})
$(".menuLi[sta='gly']").find(".menuArrow").css({
	"opacity" : "1",
	"filter" : "alpha(opacity=100)",
	"margin-left" : "35px"
})
$(".accountBtn2").css({
	"border" : "1px solid #FDBE16",
	"background-color" : "#F7F7F7"
});
$(".accountBtn2").on("click", function() {
	$(".accountBtn2,.accountBtn3").css({
		"border" : "none",
		"background-color" : "#FDBE16"
	});
	$(this).css({
		"border" : "1px solid #FDBE16",
		"background-color" : "#F7F7F7"
	});
	$(".conTable").eq(0).show();
	$(".page").show();
	$(".addAdminFrom").hide();
})
$(".accountBtn3").on("click", function() {
	$(".accountBtn2,.accountBtn3").css({
		"border" : "none",
		"background-color" : "#FDBE16"
	});
	$(this).css({
		"border" : "1px solid #FDBE16",
		"background-color" : "#F7F7F7"
	});
	$(".conTable").eq(0).hide();
	$(".page").hide();
	$(".addAdminFrom").show();
})
$(".addAdminBtn").on("click", function() {
	var a;
	add: for (var i = 0; i < $(".addInp").length; i++) {
		a = $(".addInp").eq(i).attr("statu");
		if (a != "ok") {
			alert("请输入正确信息！")
			break add;
		} else if (i == $(".addInp").length - 1) {
			if (a != "ok") {
				alert("请输入正确信息！")
				break add;
			} else {
				$.post("Admin_addAdmin", {
					"admin.username" : $("#username").val(),
					"admin.type" : $("#type").val(),
					"admin.password" : $("#password").val(),
				}, function(data, status) {
					if (data.status == 200) {
						alert("管理员添加成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		}
	}
})