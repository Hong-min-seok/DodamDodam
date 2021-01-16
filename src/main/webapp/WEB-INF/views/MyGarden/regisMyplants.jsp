<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%if (request.getSession().getAttribute("user") == null) response.sendRedirect("WrongApproach"); %>
<%
   Date nowTime = new Date();

SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Regis My Plants</title>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/regisMyplants.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/regisplantpage.css">
<link rel="stylesheet" type="text/css" href="resources/css/common.css">


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
   


   <div class="regis_container" align="center">
      <div class="regis_title">
         <img src="resources/img/regisflower.png" width=50 height=50 hspace=30 />
         <h1>내 식물 등록</h1>
         <img src="resources/img/regisflower.png" width=50 height=50 hspace=30 />
      </div>
      <div class="regis_wrap">



         <br> <br>
         <br>
         <form action="inputmyplants" method="post" id="regisform" name="regisform">
            <label>식물 종: </label><br> <input type="text" id="f_name" name="f_name" list="plants">
            <datalist id="plants">
               <c:forEach items="${plants}" var="list">
                  <option value="${list.f_name}">${list.f_name}</option>
               </c:forEach>
            </datalist>
            <br> <br> <label>화분 닉네임: </label><br> <input type="text" id="f_nick" name="f_nick" placeholder="화분 이름을 입력해주세요!">
               
            <br> <br> <label>기기 검색: </label><br>
            <select id="device_id" name="device_id" style="width: 100px; height: 50px;">
            
               <c:forEach var="device" items="${deviceList}">
                  <c:if test="${device.register == false}">
                     <option value="${device.device_id}">${device.device_id}</option>
                  </c:if>
               </c:forEach>

            </select> <br> <br> <br> <label>식물을 선택해 주세요!</label><br>
            <br>
            
            <div class="select_container">
            	<div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot1.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot1" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
            	</div>
            	<div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot2.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot2" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
		        </div>
	            <div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot3.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot3" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
	            </div>
	            <div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot4.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot4" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
	            </div>
	            <div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot5.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot5" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
	            </div>
	            <div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot6.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot6" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
	            </div>
	            <div class="flower_select">
		            <img src="<spring:url value='resources/img/flowerselect/pot7.png'/>" width=100 height=100></td>
		            <input type="radio" name="f_shape" value="pot7" style="width: 25px; height: 25px; margin-left: auto; margin-right: auto" />
	            </div>
            </div>
            


            <br> <label>심은 날짜: </label><br> <input type="date"
               id="f_date" name="f_date" value="<%=date.format(nowTime)%>"
               min="2000-01-01" max="<%=date.format(nowTime)%>"> <br>
            <br> <br> 
            <input type="button" value="등록" class="btn btn-primary btn-lg" onclick="formsubmit()" style="width: 150px; height: 50px;">
         </form>
      
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