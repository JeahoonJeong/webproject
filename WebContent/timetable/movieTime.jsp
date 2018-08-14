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

<script type="text/javascript">

	


</script>


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
	
<!--  	<table width ="100%" height="80" cellpadding="1" cellspacing="0" align ="center" bgcolor="#e6e6e6" >		
		
		<tr>
			<td width="20%"></td>
			<td width="20%" align="center"><a href=""><b>예매 안내</b></a></td>
			<td width="20%" align="center"><a href="<%=cp%>/image/movieTime.do"><b>영화별 상영시간표</b></a></td>
			<td width="20%" align="center"><a href=""><b>영화관별 상영시간표</b></a></td>	
			<td width="20%"></td>
			
			</tr>
			
			
	</table>
	-->
		
	
	


	
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
	
	
	<table width="1000" cellpadding="0" cellspacing="0" align="center" border="0">	
		
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
	
	</table> 
	
	
	<br/><br/><br/><br/><br/>
	
	
	
	
	

</body>
</html>