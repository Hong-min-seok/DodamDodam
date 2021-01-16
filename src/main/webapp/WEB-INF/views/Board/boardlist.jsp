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
<title>DodamDodam Board List</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="resources/css/boardList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.min.js"></script>

<script>
$(document).ready(function() {
	console.log('hello');
	$('.jscroll').jscroll({
		autoTrigger : true,
		loadingHtml: '<img class = "next" src="resources/img/icon/loading.gif" style="width: 100px;"/>',
		nextSelector : 'a.nextPage:last',
		contentSelector : '.scrollsection'
	});
});
</script>

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
	<div class="main_board" style="font-family: HoonDdukbokki;">
		<div class="main_item">
			<div class="main_items">
				<ul class="list-unstyled-story" style="font-family: HoonDdukbokki;">
					<br><br><br><br><br><br><br><br><br><br><br>
					<h3 style="color: #F9FFF5; font-family: HoonDdukbokki;">자유게시판</h3>
					<br>
					<li style="text-shadow: 2px 2px 2px gray; list-style:none;">자유롭게 글을 작성할 수 있습니다!</li>
					<li style="text-shadow: 2px 2px 2px gray; list-style:none;">여러 사람들과 소통해보세요~</li>
				</ul>
			</div>

		</div>
	</div>

	<input type="hidden" id="userid" name="userid" value="${list.userid}">
	<input type="hidden" id="index" name="index" value="${list.index}">

	<div class="boardContainer jscroll">
		<c:if test="${user != null }">
			<div class="btnContainer">
				<input type="button"
					style="width: 90px; height: 30px; float: right;" class="btn1"
					id="write" name="write" value="글 작성"
					onclick="location.href='BoardWrite'">
			</div>
		</c:if>
		
		<c:if test="${board.size() == 0}">
			<div class="boardlist">
				<div class="NothoverContainer">
					<h2 style="text-align: center; margin: auto;">
						<b>등록된 게시글이 없습니다.</b>
					</h2>
				</div>
			</div>
		</c:if>
		
		<div class="scrollsection">
			<div class="boardlist">

	

						<c:forEach items="${board}" var="list">
							<div class="listContainer"
								onClick="location.href='BoardDetail?index=${list.index}'">
								<div class="boardlistleft">
									<h1 class="boardTitle">${list.title}</h1>
									<h3 class="boardContent">${list.content}</h3>
									<br>
									<p>
										<i class="fas fa-user"></i> ${list.nick}
										&nbsp;&nbsp;|&nbsp;&nbsp; <i class="fas fa-calendar"></i>
										${list.date} &nbsp;&nbsp;|&nbsp;&nbsp; <i
											class="far fa-eye fa-lg"></i> ${list.hit}
									</p>
								</div>
	
								<div class="boardListright">
									<img src="resources/upload/${list.photo}"
										onerror="this.src='resources/img/diary/error.JPG'"
										alt="${list.index}게시글의 이미지입니다."
										style="width: 100%; height: 100%">
								</div>
	
							</div>
	
						</c:forEach>

				
				<div class="scrollsection">
					<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
					<a href="boardlist?page=<%=nextpage%>" class="nextPage">다음페이지</a>
				</div>
	
	
			</div>
		</div>


	</div>

</body>

<footer class="footer" style="margin-top: 1px;">
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