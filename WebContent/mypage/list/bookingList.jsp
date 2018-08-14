<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/mypage/css/list.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
</head>
<body>
<div id="list">
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
	<tr>
		<td>1</td>
		<td>123456-123456</td>
		<td>신과함께-인과 연</td>
		<td>수원 1관</td>
		<td>2018-01-01 13:30~15:53</td>
		<td>2018-01-01</td>
		<td><input type="button" value="예매취소" onclick="" class="btn1"></td>
	</tr>

</table>


</div>
</body>
</html>