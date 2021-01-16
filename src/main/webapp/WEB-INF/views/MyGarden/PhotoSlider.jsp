<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>
<%
   Date nowTime = new Date();

SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>

<c:set value="${user}" var="user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam My Plant's Photo</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="resources/js/photoslider.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/photoslider.css">
<link rel="stylesheet" type = "text/css" href="resources/css/common.css">

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
	<input type="hidden" id="device_id" name="device_id" value="${device_id}">

	<div id="pagetitle">
		<h1>${DeviceDTO.flower.f_nick}와(과) 함께한 날들</h1>
		<h3>${DeviceDTO.flower.f_date} 부터 함께 했어요</h3>
	</div>
	
	
	<div id="wrapper">
	   <div id="jrange" class="dates">
	   <!-- 입력 날짜 혹은 범위 출력 자리 -->
	    <input id="date" style="text-align: center" placeholder="날짜를 입력해보세요"/>
	    <!-- 데이트피커 출력 자리 -->
	    <div></div>
	   </div>
	</div>

	<div id="discription">
		<img src="resources/img/icon/botanic.png">
		<p>매일 정오에 내 반려식물의 사진을 찍어드려요!</p>
		<p>함께한 소중한 시간들을 사진으로 간직해보세요</p>
	</div>

 
   <div class="swiper-container">
      <div class="swiper-wrapper">
      </div>
      
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
      
      <!-- Add Arrows -->
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
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