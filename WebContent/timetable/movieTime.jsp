<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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
	if (strDay != null) {
		day = Integer.parseInt(strDay);
	}

	int preYear = year;
	int preMonth = month;
	int preDay = day - 1;

	if (preDay < 1) {
		preYear = year;
		preMonth = month - 1;
		cal.set(preYear, preMonth, 1);
		preDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	if (preMonth < 1) { //월이 0보다 작으면
		preYear = year - 1; //-1년 
		preMonth = 12; // 월 = 12
	}

	int nextYear = year;
	int nextMonth = month;
	int nextDay = day + 1;

	if (nextDay > cal.getActualMaximum(Calendar.DAY_OF_MONTH)) {
		nextDay = 1;
		nextMonth = month + 1;
		nextYear = year;
	}

	if (nextMonth > 12) { //월이 12보다 크면
		nextYear = year + 1; //+1년
		nextMonth = 1; //월 = 1
	}

	//표시할 달력 셋팅
	cal.set(year, month - 1, day); //년 월 일
	int startDay = 1; //월의 첫날은 1
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);//월의 마지막날

	int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp%>/timetable/style.css"
	type="text/css" />
<link rel="stylesheet" href="<%=cp%>/timetable/dd.css" type="text/css" />
<title>Insert title here</title>


</head>
<body>
	<jsp:include page="../header.jsp" flush="false" />
	<div class="sub_navi ">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li><a class="timetable i0 "
					href="<%=cp%>/Timetable/movieGuide.do" title="예매안내 바로가기">예매안내</a></li>
				<li><a class="timetable i1 "
					href="<%=cp%>/Timetable/movieTime.do" title="영화별 상영시간표 바로가기">영화별
						상영시간표</a></li>
				<li><a class="timetable i2 "
					href="<%=cp%>/Theater/theaterP2.do" title="영화관별 상영시간표 바로가기">영화관별
						상영시간표</a></li>

			</ul>
		</div>
	</div>

	<form name="myForm" method="post" action="">
		<table width="100" cellpadding="0" cellspacing="10" align="center">
			<tr>
				<c:forEach var="dto" items="${lists1 }">
					<td><a href="<%=cp%>/Timetable/movieTime_ok.do?movie_id=${dto.movie_id}">
						<img src="${imagePath}/${dto.movie_name}.PNG" width="180" height="180" border="2">
					</a></td>
				</c:forEach>
			</tr>
		</table>
	</form>

	<br /><br />

	<table align="center" width="250" cellpadding="2" cellspacing="1">

		<tr>
			<td align="center" style="font-size: 20pt;">			
				<a href="<%=cp %>/Timetable/movieTime_ok.do?movie_id=${movie_id}&year=<%=preYear%>&month=<%=preMonth%>&day=<%=preDay%>">
				<img src="${imagePath}/화살표1.png" width="30" height="30" border="0" align="middle"></a><b>&nbsp; <%=month%>월&nbsp;&nbsp; <%=day%>일</b> 
				<a href="<%=cp %>/Timetable/movieTime_ok.do?movie_id=${movie_id }&year=<%=nextYear %>&month=<%=nextMonth%>&day=<%=nextDay %>">
				<img src="${imagePath}/화살표2.png" width="30" height="30" border="0" align="middle"></a>
			</td>
		</tr>
	</table>

	<c:if test="${movie_id==null }">
		<p align="center"><img src="${imagePath}/nullmovie.PNG" width="1000" height="400" border="2" align="middle"></p>
	</c:if>

	<table border="0" class="scheduleP2">
		<c:forEach var="dto" items="${lists }">
			<c:if test="${!dto.district.equals(district)||!dto.screen_num.equals(screen_num) }">
				<tr>
					<th	style="width: 50px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px;"><div>${dto.city}</div>
						<small>${dto.district}</small></th>
					<th	style="width: 110px; padding-left: 15px; padding-right: 10px; border-right: 1px solid #e5e5e5;"><div>${dto.movie_name}</div>
						<small>
						<c:if test="${dto.age_limit eq 'all'}">전체관람가</c:if> <c:if test="${dto.age_limit ne 'all'}">${dto.age_limit}세 관람가</c:if>
						</small>
					</th>
					<th style="width: 100px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px;"><div>${dto.screen_num}관</div>
						<small>${dto.type}</small>
					</th>
					<td>
			</c:if>

			<div class="movie_time">
				<p class="mtime_info">
					<span class="time">${dto.start_time }~${dto.end_time }</span> 
					<span class="seat"> ${dto.seatedseat}/${dto.seatnumber}</span><br>
					<br><a href="<%=cp%>">예매</a>
				</p>
			</div>
			<c:set var="district" value="${dto.district }" />
			<c:set var="screen_num" value="${dto.screen_num}" />
		</c:forEach>
	</table>


	<br /><br /><br /><br /><br />
	<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>