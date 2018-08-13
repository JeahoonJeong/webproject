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
	<div style="border-top: 2pt solid #351f66; ">
		<dl>
			<dt class="num">NO</dt>
			<dt class="resNum">예매번호</dt>
			<dt class="movieTitle">영화명</dt>
			<dt class="cinema">영화관</dt>
			<dt class="playDate">상영일시</dt>
			<dt class="saleDate">예매일</dt>
			<dt class="cancel">예매취소</dt>
		</dl>
	</div>
	<div>
		<dl>
			<dd>1</dd>
			<dd>123456-123456</dd>
			<dd>신과함께-인과 연</dd>
			<dd>수원 1관</dd>
			<dd>2018-01-01 13:30~15:53</dd>
			<dd>2018-01-01</dd>
			<dd><input type="button" value="예매취소" onclick=""></dd>
		</dl>
	</div>
	
	
	
</div>
</body>
</html>