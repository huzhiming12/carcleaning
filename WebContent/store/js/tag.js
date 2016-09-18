$(".menuLi").eq(4).css({
	"background-color" : "#000",
	"border-left" : "8px solid #fdbf16",
	"width" : "205px"
})
$(".menuLi").eq(4).find(".menuArrow").css({
	"opacity" : "1",
	"filter" : "alpha(opacity=100)",
	"margin-left" : "35px"
})
$(".tagBtn").on("click", function() {
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
				var time = $("#reportrange").text();
				var times = time.split(" - ");
				$.post("ACoupon_addCoupon", {
					"coupon.discount" : $('#discount').val(),
					"coupon.conditionPrice" : $('#condition').val(),
					"coupon.startDate" : times[0],
					"coupon.endDate" : times[1]
				}, function(data, status) {
					if (data.status == 200) {
						alert("优惠券发布成功！");
						location.reload();
					} else {
						alert(data.error);
					}
				});
			}
		}
	}
})