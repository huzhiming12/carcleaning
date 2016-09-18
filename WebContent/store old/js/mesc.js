 $(document).ready(function(){   

 $("#shop_name").blur(function(){ 
          var pattern = /^([\u4e00-\u9fa5]+|\w+)$/; 
         var tlips_shopname = $(".shop-name");
        var judgename=pattern.test($('#shop_name').val());
            if (judgename){
          var json = {};
         json.shop_name = $('#shop_name').val();
         $.ajax({  

           url: "http://123.57.151.190/theCar/index.php/Admin/searchShop_name",  

           type: "POST",  

           dataType: 'jsonp',  

           jsonp: 'callback',  

           data: json,  

           timeout: 2000,  

           success: function (json) {//客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数  
               // alert(json.success);
              var success = json.success;
              var state = json.state;
                  if(success=="1"){
                   tlips_shopname.css('display','block');
                   tlips_shopname.html('该商铺已被注册');
                  }else{
                    tlips_shopname.css('display','none');
                  }
           }
         });
         }

    });     
       

});