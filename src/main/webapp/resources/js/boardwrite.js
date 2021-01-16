//이미지 첨부한 사진 미리 보기
function setThumbnail(event) {
   
   
   var fileName = $("#photo").val();



   var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
   var fileNameExt = fileName.lastIndexOf("\\")+1;    //파일경로를 제외한 파일명+확장자
   var extension = (fileName.substr(pathFileName, fileName.length)).toLowerCase();   //확장자명
   
   //파일명.확장자
   var fileNameCheck = fileName.substring(fileNameExt, fileName.length).toLowerCase();

   if(fileNameCheck.length != 0){
      
      if(extension == "jpg" || extension == "png"){

         for(i=0;i <fileNameCheck.length; i++){

            var chk = fileNameCheck.charCodeAt(i);

            if(chk > 128){
               alert("한글 파일명은 업로드 할 수 없습니다.");
               return;
            }
         }
         
      }else{

         alert("jpg , png 파일만 업로드 할 수 있습니다.");
         return;  
      }

   }


   /*$("#filebox").hide();*/
   var reader = new FileReader();
   reader.onload = function(event) {
      
   $("div#image_container").empty();

      
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
      
   };
   reader.readAsDataURL(event.target.files[0]);

}