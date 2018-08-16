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
<link rel="stylesheet" href="<%=cp%>/timetable/style.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>

	<br /><br /><br /><br /><br />
	
	<div class="sub_navi ">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li><a class="timetable i0 "
					href="<%=cp%>/timetable/movieGuide.jsp" title="예매안내 바로가기">예매안내</a></li>
				<li><a class="timetable i1 " href="<%=cp%>/Timetable/movieTime.do"
					title="영화별 상영시간표 바로가기">영화별 상영시간표</a></li>
				<li><a class="timetable i2 " href="<%=cp%>/timetable/movieCity.jsp"
					title="영화관별 상영시간표 바로가기">영화관별 상영시간표</a></li>

			</ul>
		</div>
	</div>
	<br/><br/><br/><br/><br/>
	
	<table width="1000" cellpadding="0" cellspacing="0" align="center" border="1">
		<tr height="100">
			<td width ="100"align="center"><a href="">서울</a></td>
			<td width="100" align="center">강남</td>
			<td rowspan="6">
		</tr>
		<tr height="100">
			<td align="center"><a href="">경기</a></td>
			<td align="center">동대문</td>
		</tr>
		<tr height="100">
			<td align="center"><a href="">인천</a></td>
			<td align="center">마곡</td>
		</tr>
		<tr height="100">
			<td align="center"><a href="">대전</a></td>
			<td align="center">이수</td>
		</tr>
		<tr height="100">
			<td align="center"><a href="">부산</a></td>
			<td align="center">상암</td>
		</tr>
		<tr height="100">
			<td align="center"><a href="">광주</a></td>
			
		</tr>
			
	
	</table>
	
	
	
	


</body>
</html>