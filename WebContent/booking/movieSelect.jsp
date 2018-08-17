<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 선택</title>

<script type="text/javascript">
	function sendIt(){
		var f = document.myForm;
		
		var movieRb = document.getElementsByName("movie");
		var movieId ;
		for(var i = 0 ; i < movieRb.length ; i++){
			if(movieRb[i].checked == true){
				movieId = movieRb[i].value;
			}
		}
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate };
		hour = ${selectedHour }; 
		//
		theaterId = ${theaterId };
		
		f.action= "<%=cp %>/Booking/booking.do/?selectedMoviedId=" + movieId 
				+ "&nowHour=" + changedTime + "&nowDay=" +changedDate
				+ "&seletedDate="+date+"&seletedHour="+ hour + "&theaterId="+theaterId;
		f.submit();
		
	}

</script>


</head>
<body>

	<form name="myForm" method="post" action="">
	<table  border="1"   cellpadding="0" cellspacing="10" align="center" >
		
		<tr>
		
			<c:forEach var="dto" items="${lists1 }">	
			
			<td>
			<img src="${imagePath}/${dto.movie_name}.PNG" width="180" height="180" border="2">
			<br/><br/>
			<input type="radio" value ="${dto.movie_id }" name ="movie"/>${dto.age_limit } | ${dto.movie_name}
			</td>	
			
			</c:forEach>	
		
		</tr>
	
		<tr>
			<td>
				<input type="button" value = "취소" onclick="javascript:location.href='<%=cp %>/Booking/booking.do'" style=" font-size :13pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #F9F9F9 ; color : #747474 ;border: 0"/>
				
				<input type="button" value = "다음" onclick="sendIt();" style=" font-size :13pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #513396; color: #ffffff; border: 0"/>
			</td>
		</tr>
	
	</table>
	

	</form>

	


</body>
</html>