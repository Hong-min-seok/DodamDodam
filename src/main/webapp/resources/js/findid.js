function checkForm(){
   var mail = document.getElementById('mail');
   var mailPattern = /^[\w.%+\-]+@[\w.\-]+\.[A-Za-z]{2,3}$/;
   
   if(mail.value == "") {
      alert("이메일을 입력하세요!");
      mail.focus();
      return false;
   }
   
   else if(!mailPattern.test(mail.value)){
      alert("잘못된 이메일 형식입니다. \n다시 입력해주세요.");
      emailCheck.reset();
      mail.focus();
      return false;
   }
   
   else{
      return true;
   }
};