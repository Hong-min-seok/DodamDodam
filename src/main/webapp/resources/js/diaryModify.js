
//이미지 첨부한 사진 미리 보기
function setThumbnail(event) {
   
   
   var fileName = $("#ex_file").val();



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

//스크롤로 페이지당 넘기기
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }






//스크롤 위치에 따라 input focus 맞추기
$(window).on('scroll',function() {
    if (checkVisible($('#title'))) {
       $('#title').focus();
    }

   else if (checkVisible($('#content'))) {
       $('#content').focus();
    }

   else if (checkVisible($('#review'))) {
       $('#review').focus();
    }

});

function checkVisible( elm, eval ) {
    eval = eval || "object visible";
    var viewportHeight = $(window).height(), // Viewport Height
        scrolltop = $(window).scrollTop(), // Scroll Top
        y = $(elm).offset().top,
        elementHeight = $(elm).height();   
    
    if (eval == "object visible") return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
    if (eval == "above") return ((y < (viewportHeight + scrolltop)));
}




//input 유효성 검사

$(function() {
   
   
   $("#submitbtn").click(function() {
      
      var title = $("#title").val().length;
      var content = $("#content").val().length;
      var review = $("#review").val().length;
      

      
      if($('#ex_file').val() == ""){
         alert("식물사진 첨부는 필수입니다.");
         $('html').animate({scrollTop : $('#box2').offset().top}, 400);
      }

      else if (title == 0 ) {
         alert("제목을 입력하지 않았습니다.");
         $('html').animate({scrollTop : $('#box3').offset().top}, 400);
         $("#title").focus();
      }

      else if(content==0)
      {
         alert("관찰내용을 입력하지 않았습니다.");
         $('html').animate({scrollTop : $('#box4').offset().top}, 400);
         $("#content").focus();
         
      }
      else if(review==0)
      {
         alert("느낀점을 입력하지 않았습니다.");
         $('html').animate({scrollTop : $('#box5').offset().top}, 400);
         $("#review").focus();
         
      }
      else if (title <4 ) {
         alert("제목은 최소 4자 이상으로 작성해주세요");
         $('html').animate({scrollTop : $('#box3').offset().top}, 400);
         $("#title").focus();
      }
      
      else if(content<70)
      {
         alert("관찰내용은 최소 70자 이상 입력해야합니다.");
         $('html').animate({scrollTop : $('#box4').offset().top}, 400);
         $("#content").focus();
         
      }
      
      else if(review<40)
      {
         alert("느낀점은 최소 40자 이상 입력해야합니다.");
         $('html').animate({scrollTop : $('#box5').offset().top}, 400);
         $("#review").focus();
         
      }else{
         var diaryform = document.getElementById("diaryform");
         diaryform.submit();
         alert("관찰일지가 수정되었습니다.");
         }
   });

});