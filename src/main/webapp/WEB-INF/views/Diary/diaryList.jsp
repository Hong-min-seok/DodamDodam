<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 

    
<c:set value="${user}" var="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>DodamDodam Diary List</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/ScrollTrigger.min.js"></script>
<script src="resources/js/diarylist.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" type = "text/css" href="resources/css/common.css">
<link rel="stylesheet" type = "text/css" href="resources/css/diaryList.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.min.js"></script>
	
<script>
$(document).ready(function() {
	$('.jscroll').jscroll({
		autoTrigger : true,
		loadingHtml: '<img class = "next" src="resources/img/icon/loading.gif" style="width: 100px;"/>',
		nextSelector : 'a.nextPage:last',
		contentSelector : '.scrollsection'
	});
});

$(function() {
	$("#searchtext").focus(function() {
		console.log("실행됨");
		var searchcriteria = $("#searchcriteria").val();
		
		if (searchcriteria == "꽃 종류") {
			console.log("꽃종류");
			dlist = '<datalist id="plant">'
				  + '<c:forEach items="${searchlist}" var="list">'
				  + "<option value=\"${list.f_name}\">${list.f_name}</option>"
				  + '</c:forEach>'
				  + '</datalist>'
			
			$("#searchtext").append(dlist);
		}
		
		else {
			$("#searchtext").empty();
		}
		
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
	

	<div class="album py-5 bg-light jscroll">
	
		<div id="searchcontainer">
			<form id="searchform" action="diarysearch" method="POST">
				<select id="searchcriteria" name="searchcriteria">
					<option value="꽃 종류">식물 종</option>
					<option value="닉네임">닉네임</option>
					<option value="아이디">아이디</option>
				</select>
				<input type="text" id="searchtext" name="searchtext" list="plant" placeholder="검색어를 입력하세요.">
				<input type="submit" id="diarysearchbtn" value="">
			</form>
			
			<c:if test="${user != null}">
				<button id="mydiarybtn" class="btn1" onclick="location.href='diary_list?writerid=${user.userid}&page=1'">내가 쓴 글</button>
			</c:if>
		</div>
	
		<c:if test="${exist == true }">
			<div class="scrollsection">
				<div class="container">
				
				
					<div class="row">
						<c:forEach items="${diaryDTOs}" var="DDto">
							<div class="col-md-4">
								<div class="card mb-4 box-shadow" onclick="location.href='./diary_detail?index=${DDto.index}'" style="cursor: pointer">
										
									<img src="<spring:url value='resources/upload/${DDto.img}'/>"
									onerror="this.src='<spring:url value='resources/img/diary/error.JPG'/>'"
									width="100%" height="225px">	
										
									<div class="card-body">
										<p class="card-text">${DDto.title}</p>
										<p class="blog-meta">
											<span class="author"> <i class="fas fa-user"></i>&nbsp;&nbsp;${DDto.nick}
											</span> &nbsp;&nbsp; <span class="date"> <i
												class="fas fa-calendar"></i>&nbsp;&nbsp;${DDto.date}
											</span>
		
										</p>
		
										<div class="d-flex justify-content-between align-items-center">
											<a href="./diary_detail?index=${DDto.index}" class="read-more-btn">read more
												<i class="fas fa-angle-right"></i>
											</a> <small class="text-muted"><span class="like"
												style="color: #FF4848;"> <i class="fas fa-heart"></i></span>
												${DDto.like.size()}</small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				
					<div class="scrollsection">
						<c:if test="${species == null && writer == null && writerid == null}">
							<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
							<a href="diary_list?page=<%=nextpage%>" class="nextPage">다음페이지</a>
						</c:if>
						<c:if test="${species != null && writer == null && writerid == null}">
							<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
							<a href="diary_list?species=${species}&page=<%=nextpage%>" class="nextPage">다음페이지</a>
						</c:if>
						<c:if test="${species == null && writer != null && writerid == null}">
							<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
							<a href="diary_list?writer=${writer}&page=<%=nextpage%>" class="nextPage">다음페이지</a>
						</c:if>
						<c:if test="${species == null && writer == null && writerid != null}">
							<%int nextpage = Integer.parseInt(request.getParameter("page")) + 1; %>
							<a href="diary_list?writerid=${writerid}&page=<%=nextpage%>" class="nextPage">다음페이지</a>
						</c:if>
					</div>
				
				</div>
				
			</div>
			</c:if>
			<c:if test="${exist == false }">
				<div class="ne_imgcontianer">
					<img alt="not exist" src="resources/img/diary/searchnotfound.png">
				</div>
			</c:if>
			
		<img src="resources/img/icon/up.png" id="MOVE_TOP_BTN">

	</div>
	
	
</body>

<footer class="footer">
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