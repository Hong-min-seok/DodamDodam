<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>

<c:set value="${user}" var="user"/>
<c:set value="${info}" var="info"/>
<c:set value="${waterday}" var="waterday"/>
<c:set value="${waterlist}" var="waterlist"/>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Water Calendar</title>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/common.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/cal.css">
<link rel="stylesheet" href="resources/css/fullcalendar/fullcalendar.css">
<link rel="stylesheet" href="resources/css/fullcalendar/daygrid.css">
<link rel="stylesheet" href="resources/css/fullcalendar/timegrid.css">
<link rel="stylesheet" href="resources/css/you.css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/fullcalendar/fullcalendar.js"></script>
<script src="resources/js/fullcalendar/daygrid.js"></script>
<script src="resources/js/fullcalendar/timegrid.js"></script>
<script src="resources/js/fullcalendar/interaction.js"></script>
<style src="resources/css/navbar.css"></style>

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
	<div class="mainnn">
		<div class="main_item">
			<div class="main_items">
				<ul class="list-unstyled">
					<h3>물 준 날짜를 표시해줍니다!</h3>
					<br>
					<li>식물 기르기 사이트 도담도담에서</li>
					<li>물을 주지 않았을 때 알려드립니다!</li>
				</ul>
			</div>

		</div>
	</div>

	<div class="container1">
		<div class="info_container">
			<div class="f_nick">
				${info.flower.f_nick}
			</div>
			<div class="f_name">
				${info.flower.f_name}
			</div>
			<div class="f_shape">
				<img src="resources/img/flowerselect/${info.flower.f_shape}.png">
			</div>
			<div class="waterday">
				<c:if test="${waterday != null}">
					물을 준지 <strong>${waterday}일</strong> 지났어요!
				</c:if>
				<c:if test="${waterday == null}">
					물주기 정보가 없어요!
				</c:if>
			</div>
		</div>
		<div class="cal_container">
			<div id="calendar"></div>
		</div>
	</div>
	
	<footer class="footer">
		<hr class="mx-0 px-0">
		<div class="container">
			<div class="f_item">
				<h5>
					<span><img src="resources/img/main/flower.png"></span> <b
						class="text-dark"> Dodam <span class="text-muted">Dodam</span></b>
				</h5>
				<br> <small class="copy-rights cursor-pointer">Ⓒ 2020
					EasyRaise Digital Technologies</small><br> <small>Copyright.All
					Rights Resered.</small>
			</div>
			<div class="f_item">
				<ul class="list-unstyled">
					<h3 class="text-muted">Introduce</h3>
					<br>
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
					<h3 class="text-muted">Offer</h3>
					<br>
					<li class="text-muted">A botanical illustrated book</li>
					<li class="text-muted">Observation Diary</li>
					<li class="text-muted">Notify me when water is low</li>

				</ul>
			</div>
			<div class="f_item">
				<ul class="list-unstyled1">
					<h3 class="text-muted">Maker</h3>
					<br>
					<li class="text-muted">BoYoung Park</li>
            		<li class="text-muted">JuSeong Seog</li>
            		<li class="text-muted">HyoGyeong An</li>
            		<li class="text-muted">HeeKyung Yu</li>
            		<li class="text-muted">MinSeok Hong</li>

				</ul>
			</div>
		</div>
	</footer>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
				defaultView : 'dayGridMonth',
				defaultDate : new Date(),
				events : ${waterlist},
				header : {
					left : 'prev,next today',
					center : 'title',
					right : ''
				},
			});
			calendar.render();
		});
	</script>

</body>
</html>

