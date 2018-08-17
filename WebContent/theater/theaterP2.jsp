<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	//한글을 3바이트로 받아줘서 안깨지게해주는것
	request.setCharacterEncoding("UTF-8");
//  cp = ~/study 까지 경로
	String cp = request.getContextPath();
%>

<%
Calendar cal = Calendar.getInstance();


//오늘날짜
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH) + 1;
int nowDay = cal.get(Calendar.DAY_OF_MONTH);



//클라이언트에서 넘어온 데이터

String strYear = request.getParameter("year"); //사용자에게 년,월 값을 받아옴
String strMonth = request.getParameter("month");
String strDay = request.getParameter("day");

//표시할 달력의 년,월
int year = nowYear; //오늘날짜로 초기화
int month = nowMonth;
int day = nowDay;

if (strYear != null) { //사용자가 입력한 값이 null이 아니면
	year = Integer.parseInt(strYear); //사용자가 선택한 년도	
}
if (strMonth != null) {
	month = Integer.parseInt(strMonth); //사용자가 선택한 월
}
if(strDay !=null){
	day = Integer.parseInt(strDay);
}

int preYear = year;
int preMonth = month;
int preDay = day-1;

if(preDay <1){
	preYear = year;
	preMonth = month-1;
	cal.set(preYear, preMonth, 1);
	preDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
}

if (preMonth < 1) { //월이 0보다 작으면
	preYear = year - 1; //-1년 
	preMonth = 12; // 월 = 12
}

int nextYear = year;
int nextMonth = month;
int nextDay = day+1;


if(nextDay > cal.getActualMaximum(Calendar.DAY_OF_MONTH)){
	nextDay = 1;
	nextMonth = month+1;
	nextYear = year;
}


if (nextMonth > 12) { //월이 12보다 크면
	nextYear = year + 1; //+1년
	nextMonth = 1; //월 = 1
}

//표시할 달력 셋팅
cal.set(year, month - 1, day); //년 월 일
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
<link rel="stylesheet" href="<%=cp%>/theater/css/theaterP2_menutab.css" type="text/css"/>


<script type="text/javascript">

//달력팝업
function showCalendar() {
	var date;
	var f = document.calendarForm;
	
	window.open("calendar.do","달력",
			"location = no, menubar = no, directories=no,left=580, top=150, width=350, height=350, toolbar = no, enubar=no, status=no, scrollbars=no, resizable=no, status = no");
}

</script>



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
		<td height="0" align="center">
		</td>
	</tr>
</table>
<table border="0" align="center" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" style="padding-bottom: 0px;">
			<h2 style="font-weight: bold; font-size: 50px; color: white; padding-left: 20px;">${district }</h2>
		</td>
	</tr>
	<tr align="center">
		<td>
			<div id="topMenu"> 
			<ul > 
				<li class="topMenuLi"> 
					<a class="menuLink">서울</a> 
					<ul class="submenu"> 
						<li><a class="submenuLink" href="">강남</a></li> 
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

<form action="" name="calendarForm">
<table border="0" align="center" cellspacing="0" cellpadding="0" width="1300px">
	<tr>
		<td colspan="5" align="center" style="padding-bottom: 10px; height: 62px">
			<h1>그림 넣기</h1>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" style="padding-bottom: 3px">
			<h3>상영시간표</h3>
		</td>
	</tr>
	<tr>
		<td colspan="5" height="2" style="background-color: #BDBDBD; padding-bottom: 3px">
		</td>
	</tr>
	<tr>
		<td style="height: 62px; width: 100px;" align="center" >
		
			<a onclick="showCalendar();">달력</a> 
		
		</td>
		<td style="width: 50px;" align="center">			
			<!--  <a href="calender.jsp?year=< %= nowYear %>&month=< %= nowMonth%>"><img src="./image/today.jpg" align="left"></a> -->
			<a href="<%=cp %>/Theater/theaterP2.do?district=${district}&year=<%=preYear %>&month=<%=preMonth%>&day=<%=preDay%>">
			<img src="../theater/image/화살표1.png" width="30" height="30" border="2" align="middle">
			</a> 
		</td>
		<td style="width: 200px; padding: 0px;" align="center">	
			<font style="font-size: 30px;"><b>&nbsp;<%=month %>월&nbsp;&nbsp;<%=day %>일</b>&nbsp;</font>
		</td>
		<td style="width: 50px;" align="center">	
			<a href="<%=cp %>/Theater/theaterP2.do?district=${district}&year=<%=nextYear %>&month=<%=nextMonth%>&day=<%=nextDay %>">
			<img src="../theater/image/화살표2.png" width="30" height="30" border="2" align="middle">
			</a>	
		</td>
		<td>
		</td>
	</tr>
</table>
</form>




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
<h3 style="color: white; padding-left: 10px; font-size: 25px;" class="theater_pay">관람료</h3>

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

