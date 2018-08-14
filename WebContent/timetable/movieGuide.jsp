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
<title>Insert title here</title>
</head>
<body>

<br/><br/><br/><br/><br/>
	<div class="sub_navi ">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li><a class="timetable i0 "
					href="<%=cp%>/timetable/movieGuide.jsp" title="예매안내 바로가기">예매안내</a></li>
				<li><a class="timetable i1 "
					href="<%=cp%>/Timetable/movieTime.do" title="영화별 상영시간표 바로가기	">영화별
						상영시간표</a></li>
				<li><a class="timetable i2 " href="<%=cp%>/timetable/movieCity.jsp" title="영화관별 상영시간표 바로가기">영화관별
						상영시간표</a></li>

			</ul>
		</div>
	</div>
	
	
	
	<table width ="800" cellpadding="0" cellspacing="10" align="center" >
		<tr>
			<td><a href=""><img src="image/예몌3.png" width="200" height="50" border="2" align="middle"></a></td>
		</tr>
		<tr>
			<td><img src="image/예매.png" width="800" height="600" border="2"></td>
		</tr>
	</table>
	

</body>
</html>