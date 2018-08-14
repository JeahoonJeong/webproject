<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	//한글을 3바이트로 받아줘서 안깨지게해주는것
	request.setCharacterEncoding("UTF-8");
//  cp = ~/study 까지 경로
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/theater/css/box.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/theater/css/theme.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/theater/css/theme2.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/theater/css/menubarP2.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/theater/css/scheduleP2.css" type="text/css"/>

<style type="text/css">

.bgimg {
    border: 0;
    padding: 0; 
    max-height: 100%;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
    max-width: 100%;
}

#topMenu {
 height: 30px; /* 메인 메뉴의 높이 */ 
width: 1300px /* 메인 메뉴의 넓이 */ 
} 
#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */ 
list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */ 
margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */ 
padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */ 
} 
#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */ 
color: white; /* 글씨 색을 흰색으로 설정 */ 
background-color: #2d2d2d; /* 배경 색을 RGB(2D2D2D)로 설정 */ 
float: left; /* 왼쪽으로 나열되도록 설정 */ 
line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */ 
vertical-align: middle; /* 세로 정렬을 가운데로 설정 */ 
text-align: center; /* 텍스트를 가운데로 정렬 */ 
position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */ 
} 
.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */ 
text-decoration:none; /* a 태그의 꾸밈 효과 제거 */ 
display: block; /* a 태그의 클릭 범위를 넓힘 */ 
width: 158px; /* 기본 넓이를 150px로 설정 */ 
font-size: 12px; /* 폰트 사이즈를 12px로 설정 */ 
font-weight: bold; /* 폰트를 굵게 설정 */ 
font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */ 
} 
.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */ 
color: white; 
} 
.topMenuLi:hover .menuLink { 
/* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */ 
color: #368AFF; /* 글씨 색 빨간색 */ 
background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */ 
} 
.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */ 
color: #000000; /* 글씨 색을 RGB(2D2D2D)로 설정 */ 
background-color: white; /* 배경색을 흰색으로 설정 */ 
border: solid 1px black; /* 테두리를 설정 */ 
margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */ 
} 
.longLink { /* 좀 더 긴 메뉴 스타일 설정 */ 
width: 190px; /* 넓이는 190px로 설정 */ 
} 
.submenu { 
/* 하위 메뉴 스타일 설정 */ 
position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */ 
height: 0px; /* 초기 높이는 0px로 설정 */ 
overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ 
transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ 
-webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */ 
-moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */ 
-o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */ } 
.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */ 
height: 310px; /* 높이를 31px / 메뉴 설정 */ 
} 
.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */ 
color: #368AFF; /* 글씨색을 빨간색으로 설정 */ 
background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */ 
}

.tmain_container>.no1 {
    position: relative;
    height: 585px;
    padding: 0;
    background: url(http://image2.megabox.co.kr/mop/home/theater/bg.jpg) 50% 0 no-repeat;
    background-size: cover;

</style>



</head>
<body>
<!-- 처음 이미지 -->
<div style="background-image: 
	url(http://image2.megabox.co.kr/mop/cinema/2018/57/703AF3-6E8B-4149-ABA3-E270FD395135.jpg); 
	background-repeat: no-repeat; height: 580px; border: 1px solid black">				
</div>
<!-- 처음 이미지 끝 -->


<div class="tmain_container" align="center">			

<table align="center">
	<tr>
		<td height="11" align="center">
		</td>
	</tr>
</table>
<table border="0" align="center" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" style="padding-bottom: 10px;">
			<h2><b>영화관 이름(하얀색으로)</b></h2>
		</td>
	</tr>
	<tr align="center">
		<td>
			<div id="topMenu"> 
			<ul > 
				<li class="topMenuLi"> 
					<a class="menuLink">서울</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">강남</a></li> 
						<li><a class="submenuLink">강남대로(씨티)</a></li> 
						<li><a class="submenuLink">강동</a></li> 
						<li><a class="submenuLink">동대문</a></li> 
						<li><a class="submenuLink">마곡</a></li> 
						<li><a class="submenuLink">목동</a></li> 
						<li><a class="submenuLink">상봉</a></li> 
						<li><a class="submenuLink">상암월드컵경기장</a></li> 
						<li><a class="submenuLink">센트럴</a></li> 
						<li><a class="submenuLink">송파파크하비오</a></li> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi"> 
					<a class="menuLink">경기</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">고양스타필드</a></li> 
						<li><a class="submenuLink">남양주</a></li> 
						<li><a class="submenuLink">미사강변</a></li> 
						<li><a class="submenuLink">별내</a></li> 
						<li><a class="submenuLink">수원</a></li> 
						<li><a class="submenuLink">시흥배곧</a></li> 
						<li><a class="submenuLink">양주</a></li> 
						<li><a class="submenuLink">오산</a></li> 
						<li><a class="submenuLink">일산</a></li> 
						<li><a class="submenuLink">킨텍스</a></li> 
					</ul> 
				</li> 
				<li>|</li> 
				<li class="topMenuLi"> 
					<a class="menuLink">인천</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">검단</a></li> 
						<li><a class="submenuLink">인천논현</a></li> 
						<li><a class="submenuLink">미사강변</a></li> 
						<li><a class="submenuLink">청라지젤</a></li> 
						<li><a class="submenuLink">송도</a></li> 
						<li><a class="submenuLink">청라</a></li> 
					</ul> 
				</li> 
				<li>|</li> 
				<li class="topMenuLi"> 
					<a class="menuLink">대전/충정/세종</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">공주</a></li> 
						<li><a class="submenuLink">대전</a></li> 
						<li><a class="submenuLink">세종</a></li> 
						<li><a class="submenuLink">오창</a></li> 
						<li><a class="submenuLink">제천</a></li> 
						<li><a class="submenuLink">진천</a></li> 
						<li><a class="submenuLink">천안</a></li> 
						<li><a class="submenuLink">충주</a></li> 
						<li><a class="submenuLink">흥성내포</a></li> 
					</ul> 
				</li> 
				<li>|</li> 
				<li class="topMenuLi"> 
					<a class="menuLink">부산/대수/경상</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">거창</a></li> 
						<li><a class="submenuLink">경산하양</a></li> 
						<li><a class="submenuLink">구미</a></li> 
						<li><a class="submenuLink">김천</a></li> 
						<li><a class="submenuLink">대구(칠성로)</a></li> 
						<li><a class="submenuLink">덕천</a></li> 
						<li><a class="submenuLink">문경</a></li> 
						<li><a class="submenuLink">부산대</a></li> 
						<li><a class="submenuLink">사천</a></li> 
						<li><a class="submenuLink">서면</a></li> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi"> 
					<a class="menuLink">광주/전라</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">광주(충장로)</a></li> 
						<li><a class="submenuLink">광주하남</a></li> 
						<li><a class="submenuLink">목포</a></li> 
						<li><a class="submenuLink">송천</a></li> 
						<li><a class="submenuLink">여수</a></li> 
						<li><a class="submenuLink">전대(광주)</a></li> 
						<li><a class="submenuLink">첨단</a></li> 
						<li><a class="submenuLink">광주상무</a></li> 
						<li><a class="submenuLink">남원</a></li> 
						<li><a class="submenuLink">목포하당(포르모)</a></li> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi"> 
					<a class="menuLink">경기</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">남춘천</a></li> 
						<li><a class="submenuLink">속초</a></li> 
						<li><a class="submenuLink">원주</a></li> 
						<li><a class="submenuLink">원주센트럴</a></li> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi"> 
					<a class="menuLink">제주</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink">제주</a></li> 
						<li><a class="submenuLink">제주아라</a></li> 
					</ul> 
				</li> 
			</ul> 
			</div>
		</td>
	</tr>
</table>

<table border="0" align="center" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" style="padding-bottom: 10px; height: 62px">
		</td>
	</tr>
	<tr align="center">
		<td>
			<div id="topMenu2"> 
			<ul > 
				<li class="topMenuLi2"> 
					<a class="menuLink2">상영시간표</a> 
					<ul class="submenu2"> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi2"> 
					<a class="menuLink2">층별안내</a> 
					<ul class="submenu2"> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi2"> 
					<a class="menuLink2">약도/교통/주차</a> 
					<ul class="submenu2"> 
					</ul> 
				</li> 
				<li>|</li>
				<li class="topMenuLi2"> 
					<a class="menuLink2">관람료</a> 
					<ul class="submenu2"> 
					</ul> 
				</li> 
				<li>|</li>
			</ul>
			</div>
		</td>
	</tr>
</table>

<table border="0" align="center" cellspacing="0" cellpadding="0" width="1300px">
	<tr>
		<td align="center" style="padding-bottom: 10px; height: 62px">
			<h1>그림 넣기</h1>
		</td>
	</tr>
	
	<tr>
		<td style="padding-bottom: 3px">
			<h3>상영시간표</h3>
		</td>
	</tr>
	<tr>
		<td height="2" style="background-color: #BDBDBD; padding-bottom: 3px">
		</td>
	</tr>
	<tr>
		<td style="height: 62px">
			달력 (( 8.15 수 ))
		</td>
	</tr>
</table>

<table border="0" class="scheduleP2">

<!-- 영화 한칸 시작 -->
	<tr>
		<th style="width: 100px; padding-left: 15px; padding-right: 10px; border-right: 1px solid #e5e5e5;">
			12세 관람가 공작
		</th>
		
		<th style="width: 50px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px; ">
			<div>4관</div>
			<small>디지털</small>
		</th>
		
		<td>
<!-- 영화 시작시간  -->
			<div class="movie_time">
				<a>
				<span class="mhover_time" style="display: none;">13:40~16:07</span>
				</a>
					<p class="mtime_info">
						<span class="type"></span>
						<span class="time">13:40</span>
						<span class="seat">162/217</span>

						<strong class="ico_box">

					</strong>
				</p>
			</div>
<!-- 영화 끝 -->
<!-- 영화 시작시간  -->
			<div class="movie_time">
				<a>
				<span class="mhover_time" style="display: none;">13:40~16:07</span>
				</a>
					<p class="mtime_info">
						<span class="type"></span>
						<span class="time">20:40</span>
						<span class="seat">162/217</span>

						<strong class="ico_box">

					</strong>
				</p>
			</div>
<!-- 영화 끝 -->
		</td>
	</tr>
<!-- 영화 한칸 끝  -->
	<tr>
		<th style="width: 100px; padding-left: 15px; padding-right: 10px; border-right: 1px solid #e5e5e5;">
			<!-- 몇세 관람가 및 영화 제목  -->
		</th>
		
		<th style="width: 50px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px; ">
			<div>5관</div>
			<small>디지털</small>
		</th>
		
		<td>
			<div class="movie_time">
				<a>
				<span class="mhover_time" style="display: none;">09:40~16:07</span>
				</a>
					<p class="mtime_info">
						<span class="type"></span>
						<span class="time">09:40</span>
						<span class="seat">150/217</span>

						<strong class="ico_box">

					</strong>
				</p>
			</div>
		</td>
	</tr>
</table>

<!-- 층 안내 시작 -->
<div class="floorinfo" style="padding-top: 100px; padding-left: 10px;">
	<div style="position: relative; width: 1300px; margin: 0 auto;">
		<h3>층별안내</h3>
		
		<div class="floorP2" style="margin-bottom: 15px;">
			<strong>1층</strong>
			<p>매표소, 매점, 무인발권기, 남자/여자 화장실, 상영관 (MX관, COMFORT관, 3~9관)</p>
		</div>
	</div>
</div>
<!-- 층 안내 끝 -->
<!-- 약도/교통/주차 시작 -->
<div class="floorinfo" style="padding-top: 10px; padding-left: 10px;">
	<div style="position: relative; width: 1300px; margin: 0 auto;">
		<h3>교통/약도/주차</h3>
		
		<div class="mapInfo" style="margin-bottom: 15px;">
			<p>도로명 주소 : 서울특별시 마포구 우러드컵로 240, 1층(성산동)</p>
		</div>	
		<div class="mapInfo" style="margin-bottom: 15px;">
			<p>지번 주소 : 서울특별시 마포구 성산동 515번지 월드컵몰 1층</p>
		</div>
	</div>
</div>
<!-- 약도/교통/주차 끝 -->

<!-- 네이버 지도 API  -->




<!-- 네이버 지도 API  -->

<!-- 약도/교통/주차 시작 -->
<div class="trafficInfo" style="padding-top: 10px; padding-left: 10px;">
	<div style="width: 1300px; margin: 0 auto;">
		<h3>교통안내</h3>
		
		<div class="traInfo">
			<ul>
				<li>733번, 6715번, 7011번, 7013A번, 7013B번, 7715번, 7019번</li>
				<li>271번, 571번, 710번</li>
				<li>9711A</li>
				<li>마포08번</li>
				<li>8777번(토, 일 운행)</li>
			</ul>
			<ul>
				<li>6호선 월드컵경기장역 하차 2번 출구 경기장 북문 진입</li>
			</ul>
		</div>
		
	<div class="trafficInfo" style="padding-top: 10px; padding-left: 10px; text-align: left;">
		<ul>
			<li><strong style="padding-left: 5px; font-size: 15px" >주차요금</strong>
			<ul>
				<li>2시간2,000원(1,600원 할인)이후 5분당 150원 추가</li>
				<li>결제는 신용카드와 현금으로만 가능</li>
				<li>극장입구의 무인 정산소와 서문 주차 정산소에서 진행(남문 홈플러스 주차장 이용 시 할인 불가)</li>
			</ul>
			</li>
		</ul>
	
	</div>
</div>
<!-- 약도/교통/주차 끝 -->

<!-- 관람료  -->
<div class="section no5" id="menu4" style="background-color: #1F0000;">

<div id="theaterpay">
<div class="content_wrap narrow" style="width: 1300px">
<h3 class="theater_pay">관람료</h3>

<h4>1. 영화관람료</h4>

<table class="table_dark" summary="영화관람료">
	<caption class="blind2">영화관람료: 상영관, 구분, 상영시간, 성인, 청소년, 어린이, 우대 등의 항목으로 구성된 표입니다</caption>
	<thead>
		<tr>
			<th scope="col" style="width: 14.28%;">상영관</th>
			<th scope="col" style="width: 14.28%;">구분</th>
			<th scope="col" style="width: 14.28%;">상영시간</th>
			<th scope="col" style="width: 14.28%;">성인</th>
			<th scope="col" style="width: 14.28%;">청소년</th>
			<th scope="col" style="width: 14.28%;">어린이</th>
			<th scope="col" style="width: 14.28%;">우대</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="16">일반관</td>
			<td rowspan="4">월요일~목요일</td>
			<td>조조(10시 전)</td>
			<td>7,000</td>
			<td>6,000</td>
			<td>6,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>8,000</td>
			<td>8,000</td>
			<td>6,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>11,000</td>
			<td>8,000</td>
			<td>6,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>6,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td rowspan="4">금요일~일요일<br>
			공휴일</td>
			<td>조조(10시 전)</td>
			<td>8,000</td>
			<td>6,000</td>
			<td>6,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>11,000</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>일반(12시~23시 전)</td>
			<td>12,000</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>10,000</td>
			<td>8,000</td>
			<td>7,000</td>
			<td>5,000</td>
		</tr>
		<tr>
			<td rowspan="4">월요일~목요일<br>
			(3D)</td>
			<td>조조(10시 전)</td>
			<td>9,000</td>
			<td>8,000</td>
			<td>8,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>10,000</td>
			<td>9,000</td>
			<td>8,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>12,000</td>
			<td>9,000</td>
			<td>8,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>11,000</td>
			<td>8,000</td>
			<td>8,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td rowspan="4">금요일~일요일<br>
			공휴일<br>
			(3D)</td>
			<td>조조(10시 전)</td>
			<td>10,000</td>
			<td>9,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>13,000</td>
			<td>11,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>14,000</td>
			<td>11,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>12,000</td>
			<td>10,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td rowspan="16">MX관</td>
			<td rowspan="4">월요일~목요일</td>
			<td>조조(10시 전)</td>
			<td>10,000</td>
			<td>9,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>13,000</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>12,000</td>
			<td>10,000</td>
			<td>10,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td rowspan="4">금요일~일요일<br>
			공휴일</td>
			<td>조조(10시 전)</td>
			<td>11,000</td>
			<td>9,000</td>
			<td>9,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>13,000</td>
			<td>12,000</td>
			<td>12,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>14,000</td>
			<td>12,000</td>
			<td>12,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>13,000</td>
			<td>10,000</td>
			<td>10,000</td>
			<td>8,000</td>
		</tr>
		<tr>
			<td rowspan="4">월요일~목요일<br>
			(3D)</td>
			<td>조조(10시 전)</td>
			<td>12,000</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>13,000</td>
			<td>12,000</td>
			<td>12,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>15,000</td>
			<td>12,000</td>
			<td>12,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>14,000</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td rowspan="4">금요일~일요일<br>
			공휴일<br>
			(3D)</td>
			<td>조조(10시 전)</td>
			<td>12,000</td>
			<td>11,000</td>
			<td>11,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>15,000</td>
			<td>13,000</td>
			<td>13,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>16,000</td>
			<td>13,000</td>
			<td>13,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>15,000</td>
			<td>12,000</td>
			<td>12,000</td>
			<td>11,000</td>
		</tr>
		<tr>
			<td rowspan="8">COMFORT관</td>
			<td rowspan="4">월요일~목요일</td>
			<td>조조(10시 전)</td>
			<td>8,000</td>
			<td>7,000</td>
			<td>7,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>9,000</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>일반(13시~23시 전)</td>
			<td>12,000</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>10,000</td>
			<td>8,000</td>
			<td>7,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td rowspan="4">금요일~일요일<br>
			공휴일</td>
			<td>조조(10시 전)</td>
			<td>9,000</td>
			<td>7,000</td>
			<td>7,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>브런치(10시~13시)</td>
			<td>12,000</td>
			<td>10,000</td>
			<td>8,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>일반(12시~23시 전)</td>
			<td>13,000</td>
			<td>10,000</td>
			<td>8,000</td>
			<td>6,000</td>
		</tr>
		<tr>
			<td>심야(23시~)</td>
			<td>11,000</td>
			<td>9,000</td>
			<td>8,000</td>
			<td>6,000</td>
		</tr>
	</tbody>
</table>

<h4>2. 요금제 기준</h4>

<table class="table_dark" summary="관람료, 요금제 기준">
	<caption class="blind2">요금제 기준: 구분, 적용기준, 증빙서류의 항목으로 구성된 표입니다.</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">적용기준</th>
			<th scope="col">증빙서류</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="1">어린이 요금</td>
			<td>만7세 ~ 만12세 (초등학생)</td>
			<td>의료보험증, 주민등록 등,초본</td>
		</tr>
		<tr>
			<td rowspan="1">청소년 요금</td>
			<td>만13세 ~ 만18세 (중학생~고등학생)</td>
			<td>학생증, 교복, 청소년증, 그 외 청소년 확인 가능 서류</td>
		</tr>
		<tr>
			<td rowspan="1">마티네 요금</td>
			<td>매주 화요일 14시 전 영화</td>
			<td>메가박스 멤버십 카드</td>
		</tr>
	</tbody>
</table>

<dl class="icon_list theater dark">
	<dt>* 48개월 미만의 경우 증빙원(예:의료보험증,주민등록 초/등본 등) 지참 시에만 무료관람 가능</dt>
	<dt>* 마티네 요금 : 메가박스 멤버십 회원대상, 매주 화요일 첫 회 ~ 14시 전 상영작까지 6,000원에 관람이 가능한 요금제 (일부 특별관의 경우 추가요금이 발생)</dt>
</dl>

<h4>3. 우대적용기준</h4>

<table class="table_dark" summary="관람료, 우대적용기준">
	<caption class="blind2">우대적용기준: 구분, 적용기준, 증빙서류의 항목으로 구성된 표입니다.</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">적용기준</th>
			<th scope="col">증빙서류</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td rowspan="1">국가유공자</td>
			<td>본인 외 동반 1인까지</td>
			<td>국가유공자증</td>
		</tr>
		<tr>
			<td rowspan="1">장애인</td>
			<td>장애인1급~3급까지 동반 1인<br>
			장애인4급~6급은 본인만</td>
			<td>(장애인)복지카드</td>
		</tr>
		<tr>
			<td rowspan="1">경로</td>
			<td>만 65세 이상 본인만</td>
			<td>신분증</td>
		</tr>
		<tr>
			<td rowspan="1">미취학아동</td>
			<td>만4세~만6세 까지 본인<br>
			(부모동반시 적용)</td>
			<td>의료보험증, 주민등록 등,초본</td>
		</tr>
		<tr>
			<td rowspan="1">군.경.소방종사자</td>
			<td>군인,경찰,소방관 본인</td>
			<td>(군인,경찰,소방)공무원증, 정복</td>
		</tr>
	</tbody>
</table>
</div>
<!-- //content_wrap -->
</div>

</div>















































<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
</div>
</div>	
</body>
</html>

