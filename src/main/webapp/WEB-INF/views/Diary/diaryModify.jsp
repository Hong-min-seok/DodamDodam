<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

    
<c:set value="${user}" var="user"/>
    
 <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>DodamDodam Diary Write</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
   <script src="resources/js/jquery.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/common.js"></script>
   <script src="resources/js/diaryModify.js"></script>
     
   
   <link rel="stylesheet" type = "text/css" href="resources/css/common.css">
   <link rel="stylesheet" type = "text/css" href="resources/css/demo.css">
   <link rel="stylesheet" type = "text/css" href="resources/css/diarywrite.css">
   
    <!-- aos 효과 -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
    
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript"></script>
    
	
<style type="text/css">

</style>


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
	<script> 
            AOS.init(); 
	</script>

	<img src="resources/img/diary/img1.png" class="img1" >
	<img src="resources/img/diary/img2.png" class="img2">
	<img src="resources/img/diary/img3.png" class="img3">
	<img src="resources/img/diary/img5.png" class="img5">



    <div class="box">
    	 <div class="centerContainer flantNameFont" >
    		<p class="line-1 anim-typewriter" data-aos="fade-up" data-aos-duration="1250">[ ${diaryDTO.date} ]</p>
    		<p class="line-1 anim-typewriter2" data-aos="fade-up" data-aos-duration="1500">${diaryDTO.f_nick}의 관찰일지</p>
    		<p class="line-1 anim-typewriter3" data-aos="fade-up" data-aos-duration="1750">수정을 시작합니다.</p>
    	</div>
    </div>
    
    <div class="box" id="box2">
    	<div class="centerContainer flantNameFont" >
    			<p data-aos="fade-up" data-aos-duration="1250">수정할 사진을 선택해주세요.</p>
    			
    			<form action="./diaryModify_Ok" method="post" enctype="multipart/form-data" id="diaryform">
    			
    				<input type="hidden" value="<%=request.getParameter("index") %>" name="index">
    				
    				<div id="image_container" data-aos="fade-up" data-aos-duration="1350">
							
							<img src="resources/upload/${diaryDTO.img}"
							onerror="this.src='resources/img/diary/error.JPG'" width="13em" height="10em">
					</div>
					
					<div class="filebox" id="filebox" data-aos="fade-up" data-aos-duration="1450">
 						<label for="ex_file">업로드</label>
  						<input type="file" id="ex_file" name="file" onchange="setThumbnail(event);" accept=" .jpg, .png">
					</div>
				
			 
    	</div>
    </div>
    
    <div class="box" id="box3">
        <div class="centerContainer flantNameFont" >
    			<p data-aos="fade-up" data-aos-duration="1250">수정할 제목을 입력해주세요.</p>
				<input type="text" name="title" class="titleText" data-aos="fade-up" data-aos-duration="1400" 
					id="title" maxlength="19" placeholder="4자 이상 입력해주세요." value="${diaryDTO.title}">
    	</div>
    </div>
    
    <div class="box" id="box4">
    	<div class="centerContainer flantNameFont" >
    			<p data-aos="fade-up" data-aos-duration="1250"  >수정할 관찰일지 내용을 입력해주세요.</p>
    			<textarea id="content" name="content" class="content" cols="48" rows="7" 
    				data-aos="fade-up" data-aos-duration="1350" maxlength="224"
    				 placeholder="70자 이상 입력해주세요.">${diaryDTO.content}</textarea>
    				 
    	<img src="resources/img/diary/f1.png" class="f1" width="70px;" height="70px">
    	<img src="resources/img/diary/f2.png" class="f2" width="70px;" height="70px">
    	<img src="resources/img/diary/f3.png" class="f3" width="70px;" height="70px">
    	</div>
    </div>
    
    <div class="box" id="box5">
    	<div class="centerContainer flantNameFont" >
    		
    			<p data-aos="fade-up" data-aos-duration="1250" >관찰을 통해 어떤  마음을 느꼇나요?</p>
    			<p data-aos="fade-up" data-aos-duration="1350" style="font-size: 28px;">떠오른 생각을 표현해보세요</p>
    			
    				<textarea id="review" name="review" class="review"  cols="45" rows="4" 
    				data-aos="fade-up" data-aos-duration="1450"  maxlength="168" 
    				placeholder="40자 이상 입력해주세요." >${diaryDTO.review}</textarea>
    			</form>
    	</div>
    </div>
       
    <div class="box">
    	<div class="centerContainer flantNameFont" >
    		<p data-aos="fade-up" data-aos-duration="1250" >수정한 관찰일지를 저장할까요?</p>
    		<button class="btn btn-success submitBtn" id="submitbtn"  data-aos="fade-up" data-aos-duration="1300" >네</button>
    	</div>
    	
    </div>
    

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