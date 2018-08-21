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
<jsp:include page="../header.jsp" flush="false"/>

	 <div class="sub_navi ">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li>
					<a class="timetable i0 " href="<%=cp%>/Timetable/movieGuide.do"  title="예매안내 바로가기">예매안내</a>
				</li>
				<li>
					<a class="timetable i1 " href="<%=cp%>/Timetable/movieTime.do"  title="영화별 상영시간표 바로가기">영화별 상영시간표</a>
				</li>
				<li>
					<a class="timetable i2 " href="<%=cp%>/Theater/theaterP2.do"  title="영화관별 상영시간표 바로가기">영화관별 상영시간표</a>
				</li>
				
			</ul> 
		</div>
	</div>
	
		<%
			String str;
			String strUrl;

			strUrl = cp + "/Booking/booking.do";
			str = "window.open('" + strUrl + "', 'Think', ";
			str = str + "'left=100, ";
			str = str + "top=20, ";
			str = str + "width=1100, ";
			str = str + "height=650, ";
			str = str + "toolbar=no, ";
			str = str + "menubar=no, ";
			str = str + "status=no, ";
			str = str + "scrollbars=no, ";
			str = str + "resizable=no')";
		%>
	
	
	<table width ="800" cellpadding="0" cellspacing="10" align="center" >
		<tr> 
			<td><a href="<%=cp %>" onclick="<%=str%>">
				<img src="${imagePath}/예몌3.PNG" width="200" height="50" border="2" align="middle"></a></td>
		</tr>
		<tr>
			<td><img src="${imagePath}/예매.png" width="800" height="600" border="2"></td>
		</tr>
	</table>
	
	
		<br/><br/><br/><br/><br/>
	<jsp:include page="../footer.jsp" flush="false"/>

</body>
</html>