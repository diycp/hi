$(document).ready(function(){
    //动态插入面板
    var family=$("#family").prop("outerHTML");
    var a=0;
    $("#add").click(function(){
      if(a>=9){
          alert('不能在加了');
        }else{
            a++;
        $("p").append(family);
        }
    });
    $("#del").click(function(){
         if(a<=1){
            alert('不能再减了');
          }else{
            a--;
          $("#family").remove();
          }
    });

      $('#phone').blur(function(){
         var phone= $('#phone').val();
         var myreg=/^[1][3,4,5,7,8][0-9]{9}$/; 
         if (!myreg.test(phone)) {  
             $('#phone').val("请输入正确的手机号格式");
        } else {  
            return true;  
        }  
      });
  
       $('#a1').click(function(){
                $('#home').hide();
       });
      

     });