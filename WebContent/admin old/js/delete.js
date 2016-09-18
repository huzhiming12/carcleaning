
  var btns =document.getElementsByName('deleate');

       for (var i = 0; i < btns.length; i++){

          btns[i].onclick = function(){
            var json = {};
                json.shop_name= this.value;
         $.ajax({  

           url: "http://123.57.151.190/car/index.php/Admin/deleteAdminData",  

           type: "POST",  

           dataType: 'jsonp',  

           jsonp: 'callback',  

           data: json,  

           timeout: 2000,  

           success: function (json) {//客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数  
              var success = json.success;
              // var state = json.state;
                  if (success=="1") {
                    alert('删除成功');
                    location.reload();
                  }else{
                     alert(state);
                  }
           }
         });        
        }

        }