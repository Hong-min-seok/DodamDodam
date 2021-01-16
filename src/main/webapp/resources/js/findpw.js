$( document ).ready(function() {
   $("#idBtn").click(function() {
      var id = $("#id").val();
      
      if(id == ""){
         alert("아이디를 입력해주세요.");
         location.href="./findpw";
      }else{
         
         var trans_object =
            {
               "id": id
            }
         
         var trans_json = JSON.stringify(trans_object)
         
         $.ajax({
            url: "./sendEmail",
            type: 'POST',
            dataType: 'json',
            data: trans_json,
            contentType: 'application/json',
            mimeType: 'application/json',
            success: function(retVal){
               
               if(retVal.id != "-"){
                  alert("인증번호가 전송되었습니다. 확인해주세요.");
                  document.getElementById("dice").value=retVal.dice;
                  document.getElementById("inputId").value=retVal.id;
                  
               }else{
                  
                  alert("입력하신 아이디는 없는 아이디입니다. \n아이디를 다시 입력해주세요.");
                  
                  $('#id').val('');
                  $('#id').focus();   
               }
               
            },
            error: function(retVal, status, er){
               alert("error발생");
               
            }
         });
      }
      
   });

});

function diceCheck(){
   console.log("In diceCheck()");
   var inDice = document.getElementById('inputDice');
   
   if(inDice.value == ""){
      alert("인증번호를 입력해주세요.");
      inDice.focus();
      return false;
   }
   else{
      return true;
   }
};


