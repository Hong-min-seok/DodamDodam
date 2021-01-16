<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="${user}" var="user"/>

<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,initial-scale=1" />
   <title>DodamDodam Gardening Tip</title>
   <link rel="stylesheet" href="resources/css/bootstrap.css">
   <script src="resources/js/jquery.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/common.js"></script>
   <script type="text/javascript">
      $(window).resize(function() {
         resizeYoutube();
      });
   
      $(function() {
         resizeYoutube();
      });
   
      function resizeYoutube() {
         $("iframe").each(
               function() {
                  if (/^https?:\/\/www.youtube.com\/embed\//g.test($(this)
                        .attr("src"))) {
                     /* $(this).css("width", "50%"); */
                     $(this)
                           .css(
                                 "height",
                                 Math
                                       .ceil(parseInt($(this).css(
                                             "width")) * 480 / 854)
                                       + "px");
                  }
               });
      }
   </script>
   <link rel="stylesheet" type = "text/css" href="resources/css/common.css">
   <link rel="stylesheet" href="resources/css/you.css">
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
   <div class="main">
      <div class="main_item">
         <div class="main_items">
            <ul class="list-unstyled" style="font-family: HoonDdukbokki;">
               <h3>식물 관리 하기와</h3>
               <h3>유의사항을 알려드립니다!!</h3>
               <br>
               <li>식물 기르기 사이트 도담도담에서</li>
               <li>누구나 쉽게 식물을 키울 수 있습니다!</li>
            </ul>
         </div>

      </div>
   </div>
   
   
   
   <div class="container1">
      <div class="row">
         <br>
         <br>
         <br>
         <br>
         
         <div class="accordion_box">
         	<ul class="list">
         		<li>
         			<p class="accordion_title box1">❓ 물은 언제 주는 것이 좋은가요?</p>
         			<div class="con">
         				물은 과하게 주기보다는 조금 덜 주는 것이 좋습니다. 흙에 물이 많으면 뿌리가 썩을 수도 있기 때문입니다.
         				흙이 축축하고 잎이 처져있다면 과습일 확률이 높습니다. 이 때는 물을 더 이상 주면 안됩니다. 손가락이나 이쑤시개 등으로
         				흙을 찔러보고 5cm 정도 아래까지 말라있는지 확인하고 물을 주어야합니다.
         			</div>
         		</li>
         		<li>
         			<p class="accordion_title box2">❓ 분갈이는 언제 해야하나요?</p>
         			<div class="con">
         				뿌리가 화분 밑 배수 구멍을 빠져나와 있거나 물을 줄 때마다 화분이 자꾸 넘어진다면 
         				분강리가 필요한 시기입니다. 성장 속도가 빠른 식물은 매년, 
         				아주 느린 식물은 필요한 시기마다 해줍니다. 보통 분갈이는 봄(3월~5월)과 
         				가을(9월~10월)에 하는 것이 좋습니다. 꽃이 피는 식물이라면 꽃이 지고 난 뒤에 
         				하는 것이 식물에 무리를 덜 줍니다.
         			</div>
         		</li>
         		<li>
         			<p class="accordion_title box3">❓ 식물의 잎이 노랗게 변해요</p>
         			<div class="con">
         				식물 잎이 노랗게 변하는 이유는 매우 다양합니다. 과습, 물 부족, 영양분 부족, 
         				온도 스트레스 등 다양한 원인으로 발생합니다. <br><br>
         				
         				<strong>1. 노란 잎 + 잎이 안쪽으로 말림 + 잎 처짐 또는 마름</strong><br>
         				이런 경우는 보통 물이 부족한 상태입니다. 물을 준 뒤 화분 받침에 빠져나온 물은 
         				버리고 통풍이 잘 되도록 해줍니다. <br><br>
         				
         				<strong>2. 노란 잎 + 잎끝 갈색, 검은색 + 간혹 잎이 마름</strong><br>
         				이 경우는 대부분 과습일 확률이 높습니다. 과습으로 흙이 젖은 상태가 지속되면 뿌리가 썩게됩니다. 
         				뿌리가 썩으면 줄기와 잎에 수분 및 영양 공급이 어렵게 되고 광합성을 하지 못해 잎이 노랗게 변하거나 
         				마르게 됩니다. 흙이 마를 때까지 물을 주지 말고 통풍이 잘 되는 곳에 위치해둡니다. <br><br>
         				
         				<strong>3. 잎 색이 옅어지거나 연한 노란색으로 변함</strong><br>
         				직사광선을 과도하게 받았을 때의 증상입니다. 주로 직사광선이 강한 여름에 실외에 
         				오래 두면 이 같은 증상이 발생할 수 있습니다.<br><br>
         			</div>
         		</li>
         	</ul>
         </div>
         

         
         <div class="col-md-4 rounded-left border-right text-center bg-light text-dark table-pricing">
         	<img src="resources/img/icon/watering_can.png"><br>
            <span class="h1" style="font-family: HoonDdukbokki;">물주기</span>
            <div class="text-muted item-list"style="font-family: HoonDdukbokki;">
               <br>
               <p>
                  <small class="text-muted"><strong>첫 번째 ></strong> 겉흙이 약간
                     말라 있으면 물을 주기 좋은 시기입니다. 화분 전체가 균등하게 물을 주세요!</small>
               </p>
               <p>
                  <small class="text-muted"><strong>두 번째 ></strong> 일반적으로
                     분갈이 된 화분에서는 일주일에서 10일에 한 번 물을 주면 충분합니다.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>세 번째 ></strong> 아침에 물을
                     줍니다. 저녁에 잎이 젖어 있으면 식물 병충해가 생길 수 있기 때문입니다.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>네 번째 ></strong> 식물에 주는
                     물의 양은 과한 것보다는 부족한 것이 오히려 더 좋습니다. 과한 수분 공급은 흙 속의 물고임 현상을 발생시키며 식물의
                     뿌리를 썩게 할 수 있습니다. 즉 식물이 필요로 할 때만 물을 주어야 합니다.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>다섯 번째 ></strong> 화분 속
                     수분의 정도를 확인하기 위해서는 먼저 흙 표면에서부터 약 5cm의 깊이까지 건조한 상태를 확인해야 합니다. 흙이
                     어두운 색을 띠고 있거나 촉촉하여 손가락에 달라붙은 상태라면 충분한 수분을 포함한 상태라고 할 수 있습니다</small>
               </p>

            </div>
         </div>
         <div
            class="col-md-4 border-right text-center bg-light text-dark table-pricing">
            <img src="resources/img/icon/plant_pot.png"><br>
            <span class="h1" style="font-family: HoonDdukbokki;">분갈이</span>
            <div class="text-muted item-list" style="font-family: HoonDdukbokki;">
               <br>
               <p>
                  <small class="text-muted"><strong>분갈이 해야할 때</strong> 1.화분
                     흙이 빠르게 마를 때 2. 뿌리가 화분 밖으로 삐져나왔을 때 3. 화분에 비해 식물이 지나치게 클 때 4.잎이 다른
                     이유 없이 시들시들해졌을 때 5.배수가 원활히 이뤄지지 않을 때 </small>
               </p>
               <p>
                  <small class="text-muted"><strong>1. 화분에서 식물 분리하기</strong>
                     분갈이 3~7일 전부터 물은 주지 마세요! 흙이 젖어있는 상태에서는 분갈이하지 않습니다! </small>
               </p>
               <p>
                  <small class="text-muted"><strong>2. 뿌리 정리하기</strong>시든뿌리와
                     오래된 흙을 손으로 살살 풀면서 제거해주세요. 상했거나 다른뿌리보다 지나치게 긴 뿌리는 잘라내줍니다. </small>
               </p>
               <p>
                  <small class="text-muted"><strong>3. 분갈이 할 화분선택하기</strong>
                     식물 성장속도에 따라서 한치수나 두치수 큰 화분으로 선택합니다. </small>
               </p>
               <p>
                  <small class="text-muted"><strong>4. 깔망깔기</strong> 화분
                     배수구멍을 막기 위해 깔망을 깔아주세요! </small>
               </p>
               <p>
                  <small class="text-muted"><strong>5. 배수층 만들기</strong> 화분
                     아래쪽에 물이 고여 있으면 뿌리가 썩기 쉬우므로 아래쪽에는 배수가 잘 되는 입자가 굵은 돌을 깔아 주니다. 물빠짐이
                     잘되야 하는 식물은 화분의 1/3 가량, 보통의 것은 1/5 정도면 충분합니다. </small>
               </p>
               <p>
                  <small class="text-muted"><strong>6. 분갈이 흙 선택</strong> 꽃,
                     허브, 채소 종류는 원예용상토를 사용합니다. 관엽식물과 나무종류는 관엽용 분갈이흙을 사용합니다. 다육식물은
                     다육이전용흙을 이용합니다. 블루베리는 피트모스를 이용합니다. 앞서 말한 흙의 비율은 50~70% 정도로 하고
                     추가적으로 흙을 섞습니다. </small>
               </p>
               <p>
                  <small class="text-muted"><strong>7. 흙 채우기+식물심기</strong>
                     화분 용기 높이에 따라 3~4cm 정도 여유 공간을 두고 심어주세요!!</small>
               </p>
            </div>
         </div>
         <div
            class="col-md-4 rounded-right text-center bg-light text-dark table-pricing">
            <img src="resources/img/icon/gardener.png"><br>
            <span class="h1" style="font-family: HoonDdukbokki;">유의사항</span>
            <div class="text-muted item-list" style="font-family: HoonDdukbokki;">
               <br>
               <p>
                  <small class="text-muted"><strong>첫 번째 ></strong> 적당한 크기의
                     배수구멍을 가진 화분을 골라주세요. 배수기능이 떨어지는 화분이라면 흙 속에 머금은 수분이 지속되며 흙 사이 공간에
                     공기가 충분하게 머무르지 못하고 뿌리가 적절한 활동을 할 수 없게 됩니다.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>두 번째 ></strong> 다육식물의
                     경우, 물 빠짐이 좋고 건조가 쉬워야 합니다. 그래서 다리가 있는 화분 또는 아래가 살짝 뜬 모양의 화분을 선택해주는
                     것이 좋습니다.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>세 번째 ></strong> 식물에 주는
                     물의 양은 과한 것보다는 부족한 것이 오히려 더 좋습니다. 과한 수분 공급은 흙 속의 물고임 현상을 발생시키며 식물의
                     뿌리를 썩게 할 수 있습니다. </small>
               </p>
               <p>
                  <small class="text-muted"><strong>네 번째 ></strong> 섭씨
                     18~23도 사이 온도를 유지해주십시오. 특히, 에어컨, 선풍기, 라디에이터 등 공기 또는 바람을 내뿜는 통풍구
                     근처에는 식물을 배치하지 마세요.</small>
               </p>
               <p>
                  <small class="text-muted"><strong>다섯 번째 ></strong> 식물이
                     정상적으로 성장하지 못하거나, 식물의 뿌리가 화분 밑으로 나온다면 더 큰 화분으로 분갈이를 해주어야 할 시점이
                     되었다는 의미입니다. 새로운 화분은 보통 기존의 화분보다 3~6cm 정도 큰 화분을 골라주는 것이 좋습니다.</small>
               </p>
            </div>
         </div>
      </div>

   </div>
   
   <div class="youtube">
      <div class="youtube_item">

         <iframe
            src="https://www.youtube.com/embed/F8VC47q4heI?autoplay=0"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
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