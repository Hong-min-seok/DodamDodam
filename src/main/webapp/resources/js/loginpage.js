$(function() {
   
   
   $("#loginbtn").click(function() {
      
      var referrer = document.referrer;
      var input_id = $("#input_id").val();
      var input_pw = $("#input_pw").val();
      
      var input_ref = document.getElementById("input_referrer");
      
      input_ref.value = referrer;
      
      if (input_id == "") {
         $(".idvalidate").text("아이디를 입력해주세요.");
         $("#input_id").focus();
      }
      
      else if (input_id != "" && input_pw == "") {
         $(".idvalidate").text("");
         $(".pwvalidate").text("비밀번호를 입력해주세요.");
         $("#input_pw").focus();
      }
      
      else {
         $(".idvalidate").text("");
         $(".pwvalidate").text("");
         var loginform = document.getElementById("login_form");
         loginform.submit();
          
      }
   });

});