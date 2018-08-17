<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 내역</title>
<link rel="stylesheet" href="<%=cp%>/mypage/css/list.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">
	
	function cancel(booked_id) {
		
		var f = document.bookingListForm
	
		if(confirm("예매를 취소하시겠습니까?") == true){
			
			f.action = "<%=cp%>/Mypage/list/bookingList_ok.do?booked_id='"+booked_id+"'";
				
			f.submit();

		}else{
			return;
		}
	}

</script>


</head>
<body>
<div id="list">
<form action="" name="bookingListForm" method="post">
<table>
	<tr>
		<td colspan="7" height="1px" style="border-bottom: 2px solid #503396;"></td>
	</tr>
	<tr>
		<th class="num">NO</th>
		<th class="resNum">예매번호</th>
		<th class="movieTitle">영화명</th>
		<th class="cinema">영화관</th>
		<th class="playDate">상영일시</th>
		<th class="saleDate">예매일</th>
		<th class="cancel">예매취소</th>
	</tr>
	<!-- DB에서 정보 불러서 돌려야함 -->
	<c:set var="i" value="1"/>
	<c:forEach items="${bookingList }" var="dto">
	<tr>
		<td>${i }
		<c:set var="i" value="${i+1 }"/>
		</td>
		<td>${dto.getBookded_id() }</td>
		<td>${dto.getMovie_name() }</td>
		<td>${dto.getDistrict() } ${dto.getScreen_num()}관</td>
		<td><c:out value="${fn:substring(dto.getStart_time(),0,fn:length(dto.getStart_time())-6) }"></c:out>
		<br/><c:out value="${fn:substring(dto.getStart_time(),fn:length(dto.getStart_time())-6,fn:length(dto.getStart_time())) }"></c:out>~${dto.getEnd_time() } </td>
		<td>${dto.getReservation_date() }</td>
		<td><input type="button" value="예매취소" onclick="cancel(${dto.getBookded_id() });" class="btn1"></td>
	</tr>
	</c:forEach>
</table>
</form>


</div>
</body>
</html>