<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${user}" var="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Board Detail</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/boarddetail.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" type = "text/css" href="resources/css/common.css">
<link rel="stylesheet" type = "text/css" href="resources/css/boarddetail.css">
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
	
	<input type="hidden" id="userid" name="userid" value="${user.userid}">
	<input type="hidden" id="nick" name="nick" value="${user.nick}">
	<input type="hidden" id="index" name="index" value="${BoardDTO.index}">
	
	<div class="container1">
	
		<div class="title text">
			${BoardDTO.title}
		</div>
		
		<div class="info">
			<div class="writer text">
				${BoardDTO.nick} | ${BoardDTO.date}
			</div>
			
			<div class="icon">
				<div class="like text">
					<span style="color: #FF4848; font-size: 17px;"> 
						<i class="fas fa-heart fa-lg"></i> 
					</span>
					<span id="likeNum">
						${BoardDTO.like.size()}&nbsp;&nbsp;
					</span>
				</div>
				
				<div class="hit text">
					<span style="color: #6799FF; font-size: 17px;">
						<i class="far fa-eye fa-lg"></i>
					</span>
					${BoardDTO.hit}
				</div>
			</div>
		</div>
		
		<hr>
		
		<div class="img_container">
			<c:if test="${BoardDTO.photo != null}">
				<img alt="img" src="resources/upload/${BoardDTO.photo}">
			</c:if>
		</div>
		
		<div class="content">
			<pre class="text" style="text-align:left">${BoardDTO.content}</pre>
		</div>
		
	</div>
	
		<div class= "button_container">
			<button class="btn1" onclick="location.href='boardlist?page=1'" style="margin-left:10px;">목록</button>
			<div>
				<c:if test="${BoardDTO.userid == user.userid}">
					<button class="btn1" onclick="location.href='BoardModify?index=${BoardDTO.index}'">수정</button>
					<button class="btn1" onclick="location.href='BoardDelete?index=${BoardDTO.index}'">삭제</button>
				</c:if>
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
  				<i class="fa fa-heart" aria-hidden="true"></i> 이 글을 좋아합니다!
  			</button>
		</c:if>
	</div>
	
	
	<div class="comment_container">
		<div class="comment_container_title">
			댓글
		</div>
		<c:forEach items="${BoardDTO.comment}" var="comment">
			<div class="comment" id="comment${comment.index}">
				<div class="comment_title">
					<div class="comment_nick"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;${comment.nick}</div>
					<div class="comment_date">
						${comment.date}&nbsp;&nbsp;&nbsp;
						<c:if test="${comment.userid == user.userid}">
							<a onclick="deleteComment(${comment.index})">X</a>
						</c:if>
					</div>
				</div>
				<div class="comment_content">
					${comment.content}
				</div>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${user != null }">
		<div class="writecomment">
			<div class="writecomment_title">
				<div class="comment_writernick"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;${user.nick}</div>
				<button class="btn1" onclick="comment()">등록</button>
			</div>
			<textarea class="comment_textarea" placeholder="댓글을 입력해주세요.."></textarea>
		</div>
	</c:if>
	
	<c:if test="${user == null }">
		<div class="writecomment">
			<div class="writecomment_title">
				<div class="comment_writernick"><i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;로그인을 하시면 댓글을 달 수 있습니다.</div>
			</div>
			<textarea class="comment_textarea" disabled="disabled"></textarea>
		</div>
	</c:if>
	
	
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