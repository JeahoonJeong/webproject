<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=cp%>/timetable/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/timetable/dd.css" type="text/css" />
<title>Insert title here</title>


</head>
<body>

	<br/><br/><br/><br/><br/>
	
	
	 <div class="sub_navi ">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li>
					<a class="timetable i0 " href="<%=cp%>/timetable/movieGuide.jsp"  title="예매안내 바로가기">예매안내</a>
				</li>
				<li>
					<a class="timetable i1 " href="<%=cp%>/Timetable/movieTime.do"  title="영화별 상영시간표 바로가기">영화별 상영시간표</a>
				</li>
				<li>
					<a class="timetable i2 " href="<%=cp%>/timetable/movieCity.jsp"  title="영화관별 상영시간표 바로가기">영화관별 상영시간표</a>
				</li>
				
			</ul>
		</div>
	</div>
	
	<form name="myForm" method="post" action="">
	<table width ="100" cellpadding="0" cellspacing="10" align="center" >
		
		
	<tr>
		
	<c:forEach var="dto" items="${lists1 }">	
			
			<td><a href="<%=cp%>/Timetable/movieTime_ok.do?movie_id=${dto.movie_id}" >
			<img src="${imagePath}/${dto.movie_name}.PNG" width="180" height="180" border="2"></a>
			</td>	
					
			</c:forEach>	
		
		</tr>
	
	</table>
	</form>

	
	
	<br/><br/>
	
	
	<%-- <table width="1000" cellpadding="0" cellspacing="0" align="center" border="0">	
		
		<c:forEach var="dto" items="${lists }">		
		
		<c:if test="${!dto.district.equals(district) }">
		<tr height="50">
		<td align="center" bgcolor="#e6e6e6" width="100">${dto.city}<br/>(${dto.district})</td>		
		<td align="center" bgcolor="#e6e6e6" width="100">${dto.movie_name }<br/>(${dto.age_limit })</td>
		<td align="center" bgcolor="#e6e6e6" width="150">${dto.screen_num }<br/>(${dto.type })</td>	
		
		</c:if>
		<td align="center" bgcolor="#ffffff" width="60">		
			${dto.start_time }~    ${dto.end_time }         ${dto.seatedseat}/${dto.seatnumber }    <a href="">예매</a></td>
			
	
	
	
		<c:set var="district" value="${dto.district }"/>
		</c:forEach>	
	
	</table>  --%>
		<c:if test="${movie_id==null }">
	
		<p align="center"><img src="${imagePath}/nullmovie.PNG" width="1000" height="400" border="2" align="middle"></p>
	
	</c:if>
	
	
	<c:if test="${movie_id!=null }">
	<table border="0" class="scheduleP2">

			<c:forEach var="dto" items="${lists }">
				<c:if test="${!dto.district.equals(district)||!dto.screen_num.equals(screen_num) }">

					<tr>
						<th
							style="width: 50px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px;"><div>${dto.city}</div>
							<small>${dto.district}</small></th>
						<th
							style="width: 110px; padding-left: 15px; padding-right: 10px; border-right: 1px solid #e5e5e5;"><div>${dto.movie_name}</div>
							<small>${dto.age_limit}세 관람가</small></th>
						<th
							style="width: 100px; font-size: 14px; text-align: right; padding-right: 15px; padding-left: 10px;"><div>${dto.screen_num}관</div>
							<small>${dto.type}</small></th>
						<td>
				</c:if>

				<div class="movie_time">
					<p class="mtime_info">
						<span class="time">${dto.start_time }~${dto.end_time }</span> <span
							class="seat"> ${dto.seatedseat}/${dto.seatnumber}</span> <br>
						<br>
						<a href="">예매</a>
					</p>
				</div>

				<c:set var="district" value="${dto.district }" />
				<c:set var="screen_num" value="${dto.screen_num}"/>
			</c:forEach>
		</table>
	</c:if>
	
	<br/><br/><br/><br/><br/>
	
	
	
	
	

</body>
</html>