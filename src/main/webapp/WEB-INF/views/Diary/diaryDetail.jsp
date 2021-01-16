<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set value="${user}" var="user" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Diary Detail Page</title>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/diarydetail.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/diaryDetail.css">
<link rel="stylesheet" type = "text/css" href="resources/css/floating2.css">
<link rel="stylesheet" type = "text/css" href="resources/css/miniModal.css">

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

<img src="resources/img/floating/floating_flower1.png" class="floating1">
<img src="resources/img/floating/floating_flower2.png" class="floating2">
<img src="resources/img/floating/floating_flower1.png" class="floating3">
<img src="resources/img/floating/floating_flower2.png" class="floating4">
<img src="resources/img/floating/floating_flower1.png" class="floating5">
<img src="resources/img/floating/floating_flower2.png" class="floating6">
<img src="resources/img/floating/floating_flower1.png" class="floating7">
<img src="resources/img/floating/floating_flower2.png" class="floating8">

<div class="section">

	<input type="hidden" value="${user.userid}" in="userid" class="userid">
	<input type="hidden" name="index" value="${diaryDTO.index}" id="index">
	<input type="hidden" name="nick" value="${diaryDTO.nick}">
	<input type="hidden" name="flag" id="flag" value="${flag}">
	
	<div class="contaiserTitle">${diaryDTO.title}</div>
	<span class="date-header">
		<i class="far fa-calendar-alt"></i>&nbsp;${diaryDTO.date}
	</span>
	<div class="view">

			<span style="font-size: 17px; font-family: THE_Oegyeinseolmyeongseo">작성자 : ${diaryDTO.nick}</span>&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span style="color: #FF4848; font-size: 17px;"> 
				<i class="fas fa-heart fa-lg"></i>&nbsp;
			</span>
			
			<span id="likeNum">${diaryDTO.like.size() }</span>&nbsp;&nbsp;&nbsp;&nbsp; 
			
			<span style="color: #6799FF; font-size: 17px;">
				<i class="far fa-eye fa-lg"></i>&nbsp;
			</span>
			
			<span>${diaryDTO.hit}</span> &nbsp;&nbsp;&nbsp;&nbsp;

	</div>
	<div class="containerAll">

	

		<div class="containerImg">
			
			<div class="plantImg">
					<img src="<spring:url value='resources/upload/${diaryDTO.img}'/>"
					onerror="this.src='<spring:url value='resources/img/diary/error.JPG'/>'">
			</div>
			<div class="diary-header" align="center">측정 데이터</div>
			<div class="container-flowerData">
			
				<div class="flowerData" >
					<div class="temp">
						<img src="<spring:url value='resources/img/diary/temp.png'/>" >
					</div>
					<div class="data">
						<p>온도</p>
						<c:choose>
							<c:when test="${diaryDTO.temp==0}"> <span>No Data</span> </c:when>
							<c:when test="${diaryDTO.temp!=0}"> <span>${diaryDTO.temp}%</span></c:when>
						</c:choose>

					</div>
				</div>
				
				<div class="flowerData" >
					<div class="humi">
						<img src="<spring:url value='resources/img/diary/humi.png'/>">
					</div>
					<div class="data">
						<p>습도</p>
						<c:choose>
							<c:when test="${diaryDTO.humi==0}"> <span>No Data</span> </c:when>
							<c:when test="${diaryDTO.humi!=0}"> <span>${diaryDTO.humi}%</span></c:when>
						</c:choose>
					</div>
				</div>
				
				<div class="flowerData">
					<div class="mois">
						<img src="<spring:url value='resources/img/diary/mois.png'/>">
					</div>
					<div class="data">
						<p>토양 수분</p>
						<c:choose>
							<c:when test="${diaryDTO.mois==0}"> <span>No Data</span> </c:when>
							<c:when test="${diaryDTO.mois!=0}"> <span>${diaryDTO.mois}%</span></c:when>
						</c:choose>
					</div>
				</div>
				
				
			</div>
			<div class="like-content">
				<c:if test="${flag == false}">
					<button id="btn_likeUp" class="btn-secondary like-review">
		  				<i class="fa fa-heart" aria-hidden="true"></i> 좋아요
		  			</button>
				</c:if>
				<c:if test="${flag == true}">
					<button id="btn_likeUp" class="btn-secondary like-review">
		  				<i class="fa fa-heart" aria-hidden="true"></i> 이 글을 좋아합니다.
		  			</button>
				</c:if>
			</div>
			
		</div>
		<div class="containerDiary">
			<div class="diaryTitle shadow">
				<p class="diary-header">
					<span style="color: #50AF49;"><i class="fas fa-seedling"></i></span>&nbsp;${diaryDTO.f_nick}</p> <hr>
				<c:if test="${Dday != -99 }">
					<p class="diary-text">키운지 ${Dday}일째</p>
				</c:if>
				<p class="diary-text">종류:&nbsp;&nbsp;${diaryDTO.f_name}</p>
			</div>
			<div class="diaryContent shadow">
				<p class="diary-header underLine" >관찰내용</p><hr>
				<pre><p class="diary-text">${diaryDTO.content}</p></pre>
			</div>
			<div class="diaryReivew shadow">
				<p class="diary-header">느낀점</p><hr>
				<pre><p class="diary-text">${diaryDTO.review}</p></pre>
			</div>
		</div>
	</div>
	<c:if test="${user.userid != null && (user.userid == diaryDTO.userid) }">
		<div class="buttoncontainer">
			<button class="btn1" onclick="modal()">삭제</button>
			<button class="btn1" onclick="location.href='diaryModify?index=${diaryDTO.index}'">수정</button>
		</div>	
		
		<div id="imModal" class="modal">
			<div class="modal-content">
			<span class="close">&times;</span>
				<div class="modaltext">
					게시물을 삭제하시겠습니까?
				</div>
				<div class="modalbutton">					
					<button class="btn1" id="delbtn" name="delbtn" onclick="location.href='./diaryDelete?index=${diaryDTO.index}'" style="width:140%; height:140%">삭제하기</button>	
				</div>
			</div>
		</div>
	</c:if>

</div>
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