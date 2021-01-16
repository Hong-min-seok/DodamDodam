<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

    
<c:set value="${user}" var="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Main Page</title>
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
<link rel="stylesheet" type = "text/css" href="resources/css/common.css">
<link rel="stylesheet" type = "text/css" href="resources/css/demo.css">
<link rel="stylesheet" type = "text/css" href="resources/css/mainpage.css">

	
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
	<div class="img_container">
		<div class="img_box">
			<!-- <img id="main_img1" alt="main_img" src="resources/img/main/main_img1.jpg"> -->
			<video autoplay muted="muted" loop id="main_img1" src="resources/img/main/main_video2.mp4">지원 안함</video>
		<div class="t_box">
			<p>도담도담</p>
			<p style="font-size: 3vw">어린아이가 잘 자라는 모양</p>
		</div>
		</div>
	</div>
	
	
	
	<div class="introduce_title block">
		<p data-scroll="toggle(.fromTopIn, .fromTopOut)">
		|<br>
		도담도담에서 제공하는<br>
		다양한 서비스를 받아보세요!
		</p>
	</div>
	
	<div class="container1 block">
		<img class="i_img" src="resources/img/main/introduce_img1.jpg" data-scroll="toggle(.fromRightIn, .fromRightOut)">
		
		<div class="subcontainer1">
			<div class="i_title left" data-scroll="toggle(.fromTopIn, .fromTopOut)">
				나만의 식물을 등록하고 꾸밀 수 있습니다.
			</div>
			<div class="i_content left" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
				나의 정원을 가꾸고 내가 키우는 식물들을 한 눈에 관리할 수 있습니다.
				식물에 귀여운 애칭도 붙여주고 화분 모양도 꾸밀 수 있어요. 아기자기한 식물 친구
				들과 친구가 되어보세요!
			</div>
		</div>

		
	</div>
	
	<div class="container2 block">
		
		<div class="subcontainer1">
			<div class="i_title right" data-scroll="toggle(.fromTopIn, .fromTopOut)">
				내 식물에 대한 다양한 정보를 제공합니다.
			</div>
			<div class="i_content right" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
				물을 언제 줬지? 물을 얼마나 줘야하지? 고민은 이제 그만!
				도담도담에서는 내 식물을 잘 키울 수 있는 다양한 정보들을 제공합니다.
				또 현재 내 화분의 온도, 습도를 한 눈에 파악할 수 있고 다른 사람들의 화분
				정보도 확인 할 수 있어요!
			</div>
		</div>
		<img class="i_img" src="resources/img/main/introduce_img2.jpg" data-scroll="toggle(.fromRightIn, .fromRightOut)">
	</div>
	
	<div class="container3 block">
			<img class="i_img" src="resources/img/main/introduce_img3.jpg" data-scroll="toggle(.fromTopIn, .fromTopOut)">
			
			<div class="subcontainer1">
				<div class="i_title left" data-scroll="toggle(.fromRightIn, .fromRightOut)">
					관찰일지를 작성하고 사람들과 공유할 수 있습니다.
				</div>
				<div class="i_content left" data-scroll="toggle(.fromBottomIn, .fromBottomOut)">
					내 식물이 오늘은 어땠는지, 기분은 어땠는지 기록해보세요! 다른 사람이 쓴 관찰 일지도 볼 수 있습니다.
					다른 사람이 키우는 식물과 내 식물을 비교해보며 키울 수 있습니다.
				</div>
			</div>
	</div>
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