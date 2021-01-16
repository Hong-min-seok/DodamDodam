<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set value="${user}" var="user" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Board Modify</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/boardmodify.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/boardwrite.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/floating3.css">
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


	<img src="resources/img/floating/floating_red.png" class="floating1">
	<img src="resources/img/floating/floating_yellow.png" class="floating2">
	<img src="resources/img/floating/floating_yellow.png" class="floating3">
	<!--    <img src="resources/img/floating/floating_red.png" class="floating4"> -->
	<img src="resources/img/floating/floating_yellow.png" class="floating5">
	<img src="resources/img/floating/floating_yellow.png" class="floating6">
	<img src="resources/img/floating/floating_red.png" class="floating7">
	<img src="resources/img/floating/floating_red.png" class="floating8">
	<!--    <img src="resources/img/floating/floating_yellow.png" class="floating9"> -->
	<img src="resources/img/floating/floating_red.png" class="floating10">

	<div class="container1">

		<form action="./BoardModifyProcess" method="POST"
			enctype="multipart/form-data" id="BoardWriteForm"
			name="BoardWriteForm">
			<input type="hidden" id="userid" name="userid" value="${user.userid}">
			<input type="hidden" id="nick" name="nick" value="${user.nick}">
			<input type="hidden" id="index" name="index"
				value="${BoardDTO.index }">


			<div class="TitleContainer1">
				<h1 class="boardTitle1">게시글 수정</h1>
			</div>

			<table>
				<tr>
					<th>제목</th>
					<td><input type="text"
						style="border: 0px; background-color: transparent;" id="title"
						name="title" value="${BoardDTO.title}">
					<td>
				</tr>
				<tr>
					<th></th>
					<td><img width="100%" height="5px"
						src="resources/img/pngwing.png"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea
							style="border: 1px solid lightgrey; background-color: transparent; height: 300px;"
							id="content" name="content">${BoardDTO.content}</textarea>
					<td>
				</tr>
				<tr>
					<th>사진 첨부</th>
					<input type="hidden" id="curphoto" name="curphoto"
						value="${BoardDTO.photo}">
					<td><input type="file" id="photo" name="file"
						onchange="setThumbnail(event);" accept=" .jpg, .png"></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<div id="image_container">
							<img src="resources/upload/${BoardDTO.photo}"
								onerror="this.src='resources/img/diary/error.JPG'">
						</div>
					</td>
				</tr>
			</table>

			<input type="submit" class="btn1" value="수정">
		</form>
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