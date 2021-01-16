<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set value="${user}" var="user" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Dictionary List</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/dictionaryList.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.min.js"></script>


<script>
	$(document).ready(function() {
		$('.jscroll').jscroll({
			autoTrigger : true,
			loadingHtml: '<img class = "next" src="resources/img/icon/loading.gif" style="margin-left:auto; margin-right:auto; width: 100px;"/>',
			nextSelector : 'a.nextPage:last',
			contentSelector : '.scrollsection'
		});
	});
</script>

<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="resources/css/dictionaryList.css">
<link rel="stylesheet" type="text/css" href="resources/css/dicDetail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/css/dictionaryModal.css">
<link rel="stylesheet" type="text/css" href="resources/css/floatingside.css">

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

	<img src="resources/img/floating/floating_cloud1.png" class="floating1">
	<img src="resources/img/floating/floating_sun1.png" class="floating2">
	<img src="resources/img/floating/floating_cloud1.png" class="floating3">
	<img src="resources/img/floating/floating_sun1.png" class="floating4">
	<img src="resources/img/floating/floating_cloud1.png" class="floating5">
	<img src="resources/img/floating/floating_sun1.png" class="floating6">



	<!-- 식물 이름 검색 ajax -->
	<div id="search" align="right">

		<input type="text" id="searchname" list="plant"
			placeholder="검색어를 입력해주세요." style="width: 300px">
		<datalist id="plant">
			<c:forEach items="${searchlist}" var="list">
				<option value="${list.f_name}">${list.f_name}</option>
			</c:forEach>
		</datalist>

		<button name="dicSearch" class="btn-search" id="btn-dictionarySearch">검색</button>
	</div>


	<!-- ㄱ,ㄴ,ㄷ,,,,필터 기능 -->
	<div id="filterBtn" align="center">

		<input type="button" id="btn-ㄱ" class="btn1" value="전체"
			onClick="location.href='./dictionarylist?page=1'">
		<input type="button" id="btn-ㄱ" class="btn1" value="ㄱ"
			onClick="location.href='./dictionarylist?init=ㄱ&page=1'">
		<input type="button" id="btn-ㄴ" name="ㄴ" class="btn1" value="ㄴ"
			onClick="location.href='./dictionarylist?init=ㄴ&page=1'">
		<input type="button" id="ㄷ" name="ㄷ" class="btn1" value="ㄷ"
			onClick="location.href='./dictionarylist?init=ㄷ&page=1'">
		<input type="button" id="ㄹ" name="ㄹ" class="btn1" value="ㄹ"
			onClick="location.href='./dictionarylist?init=ㄹ&page=1'">
		<input type="button" id="ㅁ" name="ㅁ" class="btn1" value="ㅁ"
			onClick="location.href='./dictionarylist?init=ㅁ&page=1'">
		<input type="button" id="ㅂ" name="ㅂ" class="btn1" value="ㅂ"
			onClick="location.href='./dictionarylist?init=ㅂ&page=1'">
		<input type="button" id="ㅅ" name="ㅅ" class="btn1" value="ㅅ"
			onClick="location.href='./dictionarylist?init=ㅅ&page=1'">
		<input type="button" id="ㅇ" name="ㅇ" class="btn1" value="ㅇ"
			onClick="location.href='./dictionarylist?init=ㅇ&page=1'">
		<input type="button" id="ㅈ" name="ㅈ" class="btn1" value="ㅈ"
			onClick="location.href='./dictionarylist?init=ㅈ&page=1'">
		<input type="button" id="ㅊ" name="ㅊ" class="btn1" value="ㅊ"
			onClick="location.href='./dictionarylist?init=ㅊ&page=1'">
		<input type="button" id="ㅋ" name="ㅋ" class="btn1" value="ㅋ"
			onClick="location.href='./dictionarylist?init=ㅋ&page=1'">
		<input type="button" id="ㅌ" name="ㅌ" class="btn1" value="ㅌ"
			onClick="location.href='./dictionarylist?init=ㅌ&page=1'">
		<input type="button" id="ㅍ" name="ㅍ" class="btn1" value="ㅍ"
			onClick="location.href='./dictionarylist?init=ㅍ&page=1'">
		<input type="button" id="ㅎ" name="ㅎ" class="btn1" value="ㅎ"
			onClick="location.href='./dictionarylist?init=ㅎ&page=1'">
	</div>


	<br>


	<!------------------------------------------------------------------ 보영 ------------------------------------------------------>
	

	<div class="maincontainer">
		<div class="container jscroll" style="margin-top: 50px">
		
			<div class="scrollsection">
			
				<div class="card-deck mb-3 text-center" id="result">
					<c:forEach items="${plants}" var="list">
						<div class="card mb-4 shadow-sm" style="cursor: pointer" onclick="modal('${list.f_name}')">
							<div class="card-body">
								<input type="hidden" id="fname" name="fname" value="${list.f_name}">
								<div class="box" style="background: #BDBDBD;">
									<img class="flower_img" src="${list.f_img}" />
								</div>
							</div>
							
							<button type="button" class="btn btn-info btn_detail">${list.f_name}</button>
						</div>
					</c:forEach>
				</div>
					
				<div class="scrollsection">
					<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
					<c:if test="${init == null}">
						<a href="dictionarylist?page=<%=nextpage%>" class="nextPage">다음페이지</a>
					</c:if>
					<c:if test="${init != null}">
						<a href="dictionarylist?init=<%=request.getParameter("init")%>&page=<%=nextpage%>" class="nextPage">다음페이지</a>
					</c:if>
				</div>
				
			</div>
	
		<div id="imModal"></div>
	
		</div>
		<img src="resources/img/icon/up.png" id="MOVE_TOP_BTN">
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
