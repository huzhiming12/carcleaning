$(".menuLi[sta='sjgl']").css({
	"background-color" : "#000",
	"border-left" : "8px solid #fdbf16",
	"width" : "205px"
})
$(".menuLi[sta='sjgl']").find(".menuArrow").css({
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
	$(".companyFrom").hide();
	$(".addCompany").show();
	$(".addShop").hide();
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
	$(".companyFrom").show();
	$(".addCompany").hide();
	$(".addShop").show();
})
$(".addCompany").on("click", function() {
	$(".tc-company").fadeToggle();
	$(".blackBg").fadeToggle();
});
$(".addShop").on("click", function() {
	$(".tc-shop").fadeToggle();
	$(".blackBg").fadeToggle();
});
$(".tc-exit").on("click", function() {
	$(".tc").fadeOut();
	$(".blackBg").fadeToggle();
})
$(".addCompanyBtn").on("click", function() {
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
				$.post("ACompany_addCompany", {
					"company.name" : $("#companyName").val(),
					"company.address" : $("#companyAddress").val(),
					"company.phone" : $("#companyPhone").val(),
					"company.contact" : $("#companyContact").val(),
				}, function(data, status) {
					if (data.status == 200) {
						alert("公司添加成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		}
	}
})
$(".addShopBtn").on("click", function() {
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
				var ifm = $('<iframe width="0" height="0" id="iframe" frameborder="0" name="iframe">');
				ifm.appendTo($('body'));
				$(".addServer").submit();
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
});

$(".companyBtn").click(
		function() {
			var id = $("#companySelector").val();
			$.post("AStore_loadCompanyStores", {
				"companyId" : id
			}, function(data, status) {
				if (data.status == 200) {
					var table = "";
					$.each(data.res, function(n, item) {
						// alert(item.name);
						table += "<tr><td>" + item.name + "</td><td>" + item.address + "</td><td>" + item.phone
								+ "</td><td><img src=\"../../carcleaning_res/" + item.logo
								+ "\" class=\"companyLogo\" /></td></tr>"
					});
					$("#storeTable").empty();
					$("#storeTable").append(table);
				} else {
					alert(data.error);
				}
			});

		});
