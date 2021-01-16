<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

    
<c:set value="${user}" var="user"/>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,initial-scale=1" />
   <title>DodamDodam Story</title>
   <link rel="stylesheet" href="resources/css/bootstrap.css">
   <script src="resources/js/jquery.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/common.js"></script>
   <script src="resources/js/ScrollTrigger.min.js"></script>
   <script>
   window.counter = function() {
      // this refers to the html element with the data-scroll-showCallback tag
      var span = this.querySelector('span');
      var current = parseInt(span.textContent);
   
      span.textContent = current + 1;
   };
   
   document.addEventListener('DOMContentLoaded', function(){
     var trigger = new ScrollTrigger({
        addHeight: true
     });
   });
   </script>
   <script>
   $(document).ready(function() {
      // 이미지 슬라이드 설정
      $('#carousel-example-generic').carousel({
         // 순환 설정
         interval : 5000
      // 순환을 정지시킨다.
      }).carousel('cycle');
   });
</script>
<link rel="stylesheet" type = "text/css" href="resources/css/you.css">
<link rel="stylesheet" type = "text/css" href="resources/css/common.css">
<link rel="stylesheet" type = "text/css" href="resources/css/demo.css">
<link rel="stylesheet" type = "text/css" href="resources/css/mainpage.css">
<link rel="stylesheet" type = "text/css" href="resources/css/story.css">
   
</head>

<header>
	
	<div class="pcview">
	
	
		<div class = "header navbar-fixed-top">
			<div class="logo">
				<a href="Dodam">
					<img alt="dodamlogo" src="resources/img/logo/logo.png">
				</a>
			</div>
			
			<div class="nav">
				<div class="navmenue"><a href="Dodam">HOME</a></div>
				<div class="navmenue"><a href="story">STORY</a></div>
				<div class="navmenue"><a href="dictionarylist?page=1">식물도감</a></div>
				<div class="navmenue"><a href="diary_list?page=1">관찰일지</a></div>
				<div class="navmenue"><a href="boardlist?page=1">갤러리</a></div>
				<div class="navmenue"><a href="movie">관리법</a></div>
			</div>
			
			<div class="login">
				<c:if test="${user != null}">
					
					<div class="sidelogo">
						${user.nick}님 안녕하세요!&nbsp;&nbsp;
						<img src="resources/img/icon/hamburger.png" class="sideopen">
					</div>
					<div onclick="history.back();" class="page_cover"></div>
	
					<div id="sidemenu">
						<div onclick="history.back();" class="close"></div>
						
						<div class="sidelogo">
							<img src="resources/img/icon/back.png" class="sideclose">
						</div>
						<img class="sideicon" src="resources/img/icon/flower_icon5.png">
						<div>- ${user.nick} -</div>
						<div style="font-size:11pt; margin-bottom: 3em">${user.userid}</div>
						<div class="navmenue"><a href="mypage">마이페이지</a></div>
						<div class="navmenue"><a href="mygarden">나의 화단</a></div>
						<button class="btn1" style="margin-top: 2em" onclick="location.href='logout'">로그아웃</button>
					</div>
					
				</c:if>
				
				<c:if test="${user == null}">
					<a href="login">
						<img class="loginicon" alt="login" src="resources/img/icon/key1.png" href="login">
					</a>
				</c:if>
				
			</div>
		</div>
		
		
	</div>
	
	<div class="mobileview">
	
	
		<div class = "header navbar-fixed-top">
			<div class="logo">
				<a href="Dodam">
					<img alt="dodamlogo" src="resources/img/logo/logo.png">
				</a>
			</div>
			
			<div class="login">
				
					<div class="sidelogo">
						<img src="resources/img/icon/hamburger.png" class="sideopen">
					</div>
					<div onclick="history.back();" class="page_cover"></div>
	
					<div id="sidemenu">
						<div onclick="history.back();" class="close"></div>
						
						<div class="sidelogo">
							<img src="resources/img/icon/back.png" class="sideclose">
						</div>
						
						<img class="sideicon" src="resources/img/icon/flower_icon5.png"><br>
						
						<c:if test="${user == null }">
							<button class="btn1" style="margin-top: 2em; margin-bottom: 2em" onclick="location.href='login'">로그인</button>
						</c:if>
						
						<c:if test="${user != null}">
							<div>- ${user.nick} -</div>
							<div style="font-size:11pt; margin-bottom: 3em">${user.userid}</div>
							<div class="navmenue"><a href="mypage">마이페이지</a></div>
							<div class="navmenue"><a href="mygarden">나의 화단</a></div>
						</c:if>
							<div class="navmenue"><a href="Dodam">HOME</a></div>
							<div class="navmenue"><a href="story">STORY</a></div>
							<div class="navmenue"><a href="dictionarylist?page=1">식물도감</a></div>
							<div class="navmenue"><a href="diary_list?page=1">관찰일지</a></div>
							<div class="navmenue"><a href="boardlist?page=1">갤러리</a></div>
							<div class="navmenue"><a href="movie">관리법</a></div>
						
						<c:if test="${user != null }">
							<button class="btn1" style="margin-top: 2em" onclick="location.href='logout'">로그아웃</button>
						</c:if>
					</div>
			</div>
		</div>
		
		
	</div>
</header>


<body>
   <div class="mainn">
      <div class="main_item">
         <div class="main_items">
            <ul class="list-unstyled"style="font-family: HoonDdukbokki;">
               <br><br><br><br><br><br><br><br><br><h3>식물 키우기 사이트</h3>
               <h3>도담도담 이야기 입니다!</h3>
               <br>
               <li>식물 기르기 사이트 도담도담에서</li>
               <li>누구나 쉽게 식물을 키울 수 있습니다!</li>
            </ul>
         </div>

      </div>
   </div>
   
   <div class="storyContainer">
         <div class="storyRow1">
            <div class="story-lg-4" style="cursor:pointer;" onClick="location.href='dictionarylist?page=1'">
               <img class="storyCircle" src="resources/img/story/bookIcon.png" alt="PlantsDictionary" 
               style="width:140; height:140;">
               <h1>식물 도감</h1>
               <h3>300여종의 식물에 대한 학명, 꽃말,<br>성장과정, 식물 사용법 등에 대해 알 수 있어요!</h3>
               <h3>
                  <a class="storyBtn" href="dictionarylist?page=1" role="button">알아보기>></a>
               </h3>
            </div>
         
            <div class="story-lg-4" style="cursor:pointer;" onClick="location.href='diary_list?page=1'">
               <img class="storyCircle" src="resources/img/story/pencilIcon.png" alt="PlantsDiary"
               style="width:140; height:140;">
               <h1>관찰 일지</h1>
               <h3>나의 반려식물을 관찰하고 기록할 수 있어요!<br>
                  다른 친구들의 반려식물에 대한 기록도 볼 수 있어요!</h3>
               <h3>
                  <a class="storyBtn" href="diary_list?page=1" role="button">알아보기>></a>
               </h3>
            </div>
            
            <div class="story-lg-4" style="cursor:pointer;" onClick="location.href='movie'">
               <img class="storyCircle" src="resources/img/story/watercan2.png" alt="PlantsManagement"
               style="width:140; height:140;">
               <h1>관리법</h1>
               <h3>물주기, 분갈이, 관리법에 대해 알 수 있어요!</h3>
               <h3>
                  <a class="storyBtn" href="movie" role="button">알아보기>></a>
               </h3>
         </div>
      </div>
      
         <hr style="margin:5em 0;">
      
      <div id="carousel-example-generic" class="carousel slide" style=" flex-basis: 100%; margin:3%; height:50%;">
         <div class="carousel-inner" style="display: flex; justify-content: space-around; ">
            <div class="item active">
               <div class="storyRow2">
                     <div class="storyText">
                        <p style="font-size:34pt; font-weight:1000; margin-bottom:33px; color: green;">도담도담 App</p>
                        <h2>
                              도담도담 어플을 통해 어디서든 나만의 정원을 가꿔보세요.
                        </h2>
 <!-- 어플 설치주소 -->      <h2> <a href="#">어플 설치하러 가기</a></h2>
                     </div>
                     
                        <img class="storybgImg" src="resources/img/story/storyApp.png">
                    
                 </div>
            </div>
            
            <div class="item">
            <div class="storyRow2">
                     
                        <img class="storybgImg" src="resources/img/story/storyApp2.png">
                     
                     <div class="storyText" style="text-align: right;">
                        <p style="font-size:34pt; font-weight:1000; margin-bottom:33px; color: green; ">나만의 화단</p>
                        <h2>꾸미기 기능으로 내 식물의 화분과 배경을 꾸밀 수 있어요.</h2>
                        <h2 style="display: inline-block;">어디서든 내 식물의 &nbsp;</h2>
                        <h2 style="display: inline-block; font-weight: bolder; color: #3E60AD">온도</h2>
                        <h2 style="display: inline-block;">와&nbsp;</h2>
                        <h2 style="display: inline-block; font-weight: bolder; color: #E01008">습도</h2>
                        <h2 style="display: inline-block;">를 확인할 수 있어요.</h2>
                     </div>
                  </div>
            </div>
            
         <div class="item">
                    <div class="storyRow2">
                     <div class="storyText">
                        <p style="font-size:34pt; font-weight:1000; margin-bottom:33px;  color: green;"><b>식물에 대해 배우기</b></p>
                        <h2>
                              식물에 대한 상세정보를 확인할 수 있어요.
                        </h2>
                    <h2 style="display: inline-block;">식물의&nbsp;</h2>
                    <h2 style="display: inline-block; font-weight: bolder; color:#5585F2;">종류, 학명, 성장과정, 꽃말, 시</h2>
                    <h2 style="display: inline-block;">에 대해 배울 수 있어요.</h2>
                     </div>
                     
                        <img class="storybgImg" src="resources/img/story/flowerLanguage.png">
                     
                  </div>
             </div>
             
             <div class="item">
                    <div class="storyRow2">
                     
                        <img class="storybgImg" src="resources/img/story/.png" alt="물주기 달력 화면 띄우기!!">
                     
                     <div class="storyText" style="text-align: right;">
                        <p style="font-size:34pt; font-weight:1000; margin-bottom:33px; color: green; "><b>물주기 check!</b></p>
                        <h2>물을 준 날짜를 확인할 수 있어요.</h2>
                        <h2 style="display: inline-block;">식물에 물을 주면 자동으로&nbsp;</h2>
<!--                         <h2 style="display: inline-block;">달력에&nbsp;</h2> -->
                        <h2 style="display: inline-block; font-weight: bolder; color:#5585F2">달력에 기록</h2>
                        <h2 style="display: inline-block;">이 남아요!</h2>
                     </div>
                  </div>
            </div>
            
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<!-- 왼쪽 화살표 -->
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
</a>
<!-- 오른쪽 화살표 버튼 -->
<!-- href는 carousel의 id를 가르킨다. -->
<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<!-- 오른쪽 화살표 -->
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
</a>
         </div>
      </div>
      
   </div>
   
   <!-- <div style="display: flex; justify-content: space-between; text-align: center;margin:2%">
      <div id="carousel-example-generic" class="carousel slide" style=" flex-basis: 100%; margin:3%; height:50%">
         
         <div class="carousel-inner">
            <div class="item active">
               <div style="display:flex; ">
               
                  <img class="storybgImg" src="resources/img/story/widebg.png">
                  <div class="storybgImg storyText">
                     <br>
                     <h1 >쉽게 식물 키우기!</h1>
                     <h1>물주는 날짜를 알려드립니다!</h1>
                     <h1>우하하11</h1>
                   </div>
                  </div>
               </div>
            
            
            <div class="item">
               <div style="display:flex">
                  <img class="storybgImg" src="resources/img/story/widebg1.jpg">
                  <div class="storybgImg storyText">
                     <br>
                     <h1 >쉽게 식물 키우기!</h1>
                     <h1>물주는 날짜를 알려드립니다!</h1>
                     <h1>우하하2</h1>
                   </div>
               </div>
            </div>
            
            
            <div class="item">
               <div style="display:flex">
                  <img class="storybgImg" src="resources/img/story/widebg1.jpg">
                  <div class="storyText">
                     <br>
                     <h1 >쉽게 식물 키우기!</h1>
                     <h1>물주는 날짜를 알려드립니다!</h1>
                     <h1>우하하3</h1>
                   </div>
               </div>
            </div>
            
         </div>
      </div>
   </div> -->


</body>

   
   
   
<footer class="footer">
   <hr class="mx-0 px-0">
      <div class="container">
         <div class="f_item">
            <h5><span><img src="resources/img/main/flower.png"></span>
               <b class="text-dark"> Dodam <span class="text-muted">Dodam</span></b>
            </h5><br><small class="copy-rights cursor-pointer">Ⓒ 2020 EasyRaise Digital Technologies</small><br><small>Copyright.All Rights Resered.</small>
         </div>
         <div class="f_item">
            <ul class="list-unstyled">
               <h3 class="text-muted">Introduce</h3><br>
               <li class="text-muted">You can grow plants easily through the
                  website!</li>
               <li class="text-muted">Both websites and applications are
                  available!</li>
               <li class="text-muted">You can find various kinds of flowers
                  on the website.</li>

            </ul>
         </div>
         <div class="f_item">
            <ul class="list-unstyled">
               <h3 class="text-muted">Offer</h3><br>
               <li class="text-muted">A botanical illustrated book</li>
               <li class="text-muted">Observation Diary</li>
               <li class="text-muted">Notify me when water is low</li>

            </ul>
         </div>
         <div class="f_item">
         <ul class="list-unstyled">
            <h3 class="text-muted">Maker</h3><br>
            <li class="text-muted">BoYoung Park</li>
            <li class="text-muted">JuSeong Seog</li>
            <li class="text-muted">HyoGyeong An</li>
            <li class="text-muted">HeeKyung Yu</li>
            <li class="text-muted">MinSeok Hong</li>

         </ul>
      </div>
   </div>
</footer>
</html>

