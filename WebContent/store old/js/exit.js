 var exit_b = $(".exit");
       exit_b.click(function() { 
        $.ajax({  

           url: "http://123.57.151.190/theCar/index.php/Admin/cancellation",  

           type: "POST",  

           dataType: 'jsonp',  

           jsonp: 'callback',  

           timeout: 2000,  

           success: function (json) {//客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数  
               // alert(json.success);
              var success = json.success;
              if (success==1) {
                window.location.href='/theCar/index.php/welcome/login';
              }
              }
             
         }); 
      });