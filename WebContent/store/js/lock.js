$(".menuLi").eq(5).css({
	"background-color" : "#000",
	"border-left" : "8px solid #fdbf16",
	"width" : "205px"
})
$(".menuLi").eq(5).find(".menuArrow").css({
	"opacity" : "1",
	"filter" : "alpha(opacity=100)",
	"margin-left" : "35px"
})
var nowTime = new Date();
var hour = nowTime.getHours();
if (hour >= 18 && hour <= 19) {
	$(".lock3").on("click", function() {
		var lotId = $(this).attr("lotId");
		var msg = "解锁";
		var flag = 0;
		if ($(this).attr("statu") == "no") {
			msg = "锁定";
			flag = 1;
		}
		if (confirm("确定要" + msg + "该洗车位吗?")) {
			$.post("AStore_lockParkingLot", {
				"lotId" : lotId,
				"flag" : flag
			}, function(data, status) {
				if (data.status == 200) {
					alert("洗车位" + msg + "成功！");
					location.reload();
				} else {
					alert(data.error);
				}
			});
		}

	});
} else {
	$(".lock3").on("click", function() {
		alert("不在操作时间范围内！请在18点到19点之间执行此操作")
	})
}
