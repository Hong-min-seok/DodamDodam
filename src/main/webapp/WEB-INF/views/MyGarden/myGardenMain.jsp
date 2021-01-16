<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>

<c:set value="${user}" var="user" />
<c:set value="${info}" var="info" />

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam MyGarden</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/ScrollTrigger.min.js"></script>
<script src="resources/js/myGarden.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/myGardenMain.css">
<link rel="stylesheet" type="text/css" href="resources/css/floating.css">
<link rel="stylesheet" type="text/css" href="resources/css/dicDetail.css">
<link rel="stylesheet" type="text/css" href="resources/css/dictionaryModal.css">
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

	<img src="resources/img/floating/floating_flower1.png"
		class="floating1">
	<img src="resources/img/floating/floating_flower2.png"
		class="floating2">
	<img src="resources/img/floating/floating_flower1.png"
		class="floating3">
	<img src="resources/img/floating/floating_flower2.png"
		class="floating4">
	<img src="resources/img/floating/floating_flower1.png"
		class="floating5">
	<img src="resources/img/floating/floating_flower2.png"
		class="floating6">
	<img src="resources/img/floating/floating_flower1.png"
		class="floating7">

	<div class="title_container">
		<h1 class="title">
			나의 정원
		</h1>
	</div>

	<div class="container1">
		<!-- 선반 영역 -->
		<div class="subcontainer1">
			<div class="shelve_container">
				<img class="shelve" alt="shleveimg"
					src="resources/img/icon/shelve.png">

				<img class="shelve2" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
				<img class="shelve3" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
				<img class="shelve4" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
				<img class="shelve5" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
				<img class="shelve6" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
				<img class="shelve7" alt="shleveimg"
					src="resources/img/icon/shelveone.png">
					
				<div class="plant element1"></div>

				<div class="sign namesign1"></div>

				<div class="plant element2"></div>

				<div class="sign namesign2"></div>

				<div class="plant element3"></div>

				<div class="sign namesign3"></div>

				<div class="plant element4"></div>

				<div class="sign namesign4"></div>

				<div class="plant element5"></div>

				<div class="sign namesign5"></div>

				<div class="plant element6"></div>

				<div class="sign namesign6"></div>

				<div class="plant element7"></div>

				<div class="sign namesign7"></div>

				<div class="plant element8"></div>

				<div class="sign namesign8"></div>

				<div class="plant element9"></div>

				<div class="sign namesign9"></div>
				

			</div>
		</div>

		<!-- info 영역 -->
		<div class="subcontainer2">
			<div class="info_container">
				<c:if test="${info != null}">
					<div id="flower_name">${info.flower.f_name }</div>
					<div class="flower_img">
						<img alt="img" src="${f_img}"
							onclick="modal('${info.flower.f_name}')">
					</div>
					<div id="flower_nick">${info.flower.f_nick}와 함께 한지 ${dday}일 째
					</div>
					<div class="info_submenu">
						<div class="subnavmenu">
							<a href="statistic?device_id=${info.device_id}">온습도 정보</a>
						</div>
						<div class="subnavmenu">
							<a href="watercalendar?device_id=${info.device_id}">물주기 달력</a>
						</div>
						<div class="subnavmenu">
							<a href="diary_plantOneList?device_id=${info.device_id}">관찰일지</a>
						</div>
						<div class="subnavmenu">
							<a href="Photo?device_id=${info.device_id}">성장 과정</a>
						</div>
					</div>
					
					<div class="btncontainer">
						<button class="btn1" onclick="location.href='modifyplant?device_id=${info.device_id}'">정보수정</button>						
						<button class="btn1" onclick="location.href='deleteplant?device_id=${info.device_id}'">화분삭제</button>
					</div>
				</c:if>

				<c:if test="${info == null }">
					<div class="info_img">
						<img alt="info_img" src="resources/img/icon/flower_shop.png">
					</div>
					<div class="info_title">당신만의 정원을 만나보세요!</div>
				</c:if>
			</div>
		</div>
	</div>

	<div id="imModal"></div>

	<div class="container2"></div>
</body>

<footer class="footer">
	<hr class="mx-0 px-0">
	<div class="container">
		<div class="f_item">
			<h5>
				<span><img src="resources/img/main/flower.png"></span> <b
					class="text-dark"> Dodam <span class="text-muted">Dodam</span></b>
			</h5>
			<br>
			<small class="copy-rights cursor-pointer">Ⓒ 2020 EasyRaise
				Digital Technologies</small><br>
			<small>Copyright.All Rights Resered.</small>
		</div>
		<div class="f_item">
			<ul class="list-unstyled">
				<h3 class="text-muted">Introduce</h3>
				<br>
				<li class="text-muted">You can grow plants easily through the
					website!</li>
				<li class="text-muted">Both websites and applications are
					available!</li>
				<li class="text-muted">You can find various kinds of flowers on
					the website.</li>

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
			<ul class="list-unstyled">
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

</html>