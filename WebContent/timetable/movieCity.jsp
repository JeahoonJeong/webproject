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
	
	
	
	


</body>
</html>