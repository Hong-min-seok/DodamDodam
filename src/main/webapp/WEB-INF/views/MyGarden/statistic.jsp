<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>

<c:set value="${user}" var="user"/>
<c:set value="${info}" var="info"/>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Statistic Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/statistic.css">
<link rel="stylesheet" href="resources/css/you.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<style src="resources/css/navbar.css"></style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="resources/js/statistic.js"></script>
<script src="resources/js/common.js"></script>

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
               <h3>습도, 온도, 채광 정보를 알려드려요!</h3>
               <br>
               <li>식물 기르기 사이트 도담도담에서</li>
               <li>확인하세요!</li>
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
				<input type="hidden" id='f_name', value="${info.flower.f_name}">
				${info.flower.f_name}
			</div>
			<div class="f_shape">
				<img src="resources/img/flowerselect/${info.flower.f_shape}.png">
			</div>
			
		</div>
		<div>
			<div class="container3_title">
				<h1>${info.flower.f_name}은(는)</h1>
			</div>
			<div class="container3">
				<div class="f_water_container f_info">
				<img src="resources/img/icon/watering-can2.png">
				<br><br><br>
				${dictinfo.f_water}
				</div>
		
				<div class="f_sun_container f_info">
				<img src="resources/img/icon/sun.png">
				<br><br><br>
				${dictinfo.f_sun}		
				</div>
				
				<div class="f_hum_container f_info">
				<img src="resources/img/icon/drop.png">
				<br><br><br>
				${dictinfo.f_hum}
				</div>
			
			</div>
		</div>
	</div>
	
	<div class="stat_container">
		<div id="Line_Controls_Chart">
			<div class="stat_title">
				나의 온습도 정보
			</div>
	       <!-- 라인 차트 생성할 영역 -->
	       	<div id="lineChartArea"></div>
	       	<!-- 컨트롤바를 생성할 영역 -->
	       	<div id="controlsArea"></div>
	    </div>
	</div>
	
	
	<div class="container2">
		<h2>${info.flower.f_nick}의 평균 정보</h2>
		<div class="my_info">
			<div class="infobox tempbox darkness">
				<p class="infobox_title">
					<img alt="temperature" src="resources/img/icon/temperature.png">
					온도
				</p>
				<p class="infobox_content mytemp">
					00℃
				</p>
				<p class="diff difftemp"></p>
			</div>
			<div class="infobox humibox">
				<p class="infobox_title">
					<img alt="humidity" src="resources/img/icon/humidity.png">
					습도
				</p>
				<p class="infobox_content myhumi">
					00%
				</p>
				<p class="diff diffhumi"></p>
			</div>
			<div class="infobox moisbox">
				<p class="infobox_title">
					<img alt="moisture" src="resources/img/icon/moisture.png">
					토양 수분
				</p>
				<p class="infobox_content mymois">
					00%
				</p>
				<p class="diff diffmois"></p>
			</div>
		</div>
		<h2>다른 사람들의 ${info.flower.f_name}의 평균 정보</h2>
		<div class="others_info">
			<div class="infobox">
				<p class="infobox_title">
					<img alt="temperature" src="resources/img/icon/temperature.png">
					온도
				</p>
				<p class="infobox_content otherstemp">
					00℃
				</p>
			</div>
			<div class="infobox">
				<p class="infobox_title">
					<img alt="humidity" src="resources/img/icon/humidity.png">
					습도
				</p>
				<p class="infobox_content othershumi">
					00%
				</p>
			</div>
			<div class="infobox">
				<p class="infobox_title">
					<img alt="moisture" src="resources/img/icon/moisture.png">
					토양 수분
				</p>
				<p class="infobox_content othersmois">
					00%
				</p>
			</div>
		</div>
	</div>

    
    <input type="hidden" name="device_id" id="d_id" placeholder="input device id" value="<%=request.getParameter("device_id") %>"> 
    <input type="button" value="check" class="target" id="target" >
 
   
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



</body>
</html>