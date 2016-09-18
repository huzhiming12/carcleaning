$(".menuLi[sta='zhgl']").css({
	"background-color" : "#000",
	"border-left" : "8px solid #fdbf16",
	"width" : "205px"
})
$(".menuLi[sta='zhgl']").find(".menuArrow").css({
	"opacity" : "1",
	"filter" : "alpha(opacity=100)",
	"margin-left" : "35px"
})
$(".manaBtn2").css({
	"border" : "1px solid #FDBE16",
	"background-color" : "#F7F7F7"
});
$(".addCompanyAct").on("click", function() {
	$(".tc-companyAct").fadeToggle();
	$(".blackBg").fadeToggle();
});
$(".addShopAct").on("click", function() {
	$(".tc-shopAct").fadeToggle();
	$(".blackBg").fadeToggle();
});
$(".tc-exit").on("click", function() {
	$(".tc").fadeOut();
	$(".blackBg").fadeToggle();
})
$(".addCompanyBtn,.addShopBtn").on("click", function() {
	var a;
	add: for (var i = 0; i < $(this).parent().find(".addInp").length; i++) {
		a = $(this).parent().find(".addInp").eq(i).attr("statu");
		if (a != "ok") {
			alert("请输入正确信息！")
			break add;
		} else if (i == $(this).parent().find(".addInp").length - 1) {
			if (a != "ok") {
				alert("请输入正确信息！")
				break add;
			} else {
				var btnName = $.trim($(this).attr("class"));
				if (btnName == "addCompanyBtn") {

					$.post("Admin_addCompanyAdmin", {
						"admin.username" : $("#Cusername").val(),
						"admin.password" : $("#Cpassword").val(),
						"admin.company.id" : $("#companyId").val(),
						"admin.type" : 1,
						"endDate" : $("#txtEndDate").val(),
					}, function(data, status) {
						if (data.status == 200) {
							alert("公司管理员添加成功！");
							location.reload();
						} else {
							alert(data.error);
						}
					});
				} else {

					$.post("Admin_addAdmin", {
						"admin.username" : $("#Susername").val(),
						"admin.password" : $("#Spassword").val(),
						"admin.store.id" : $("#storeId").val(),
						"admin.type" : 2
					}, function(data, status) {
						if (data.status == 200) {
							alert("店铺管理员添加成功！");
							location.reload();
						} else {
							alert(data.error);
						}
					});

				}
			}
		}
	}
});

// $(".companyBtn").click(function() {
// $.post("Admin_loadCompanyStoreAccout", {
// "id" : $("#companySelector").val(),
// }, function(data, status) {
// if (data.status == 200) {
// var cAdmins = data.companyAdmin;
// $(".company-zhanghao").text(cAdmins[0].username);
// $(".company-term").text(cAdmins[0].company.endDate);
// $(".company-zhanghao").text(cAdmins[0].username);
//			
// } else {
// alert(data.error);
// }
// });
// });
