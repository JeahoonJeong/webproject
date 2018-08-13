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
<link rel="stylesheet" href="<%=cp%>/mypage/css/mypage.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>나의 메가박스</title>
</head>
<body>

<div id="mypage">

<div><span class="font" >userName</span> 님, 오늘도 영화처럼 멋진 하루 되세요!<br/><br/>
<hr size="3" color="#7A67AC" width="800px" style="float: left"></div>
<br/><br/>

<div>
	<ul class="nav_gnb">     	
		<li>
           <a href="#"><img src="<%=cp%>/mypage/image/res.JPG" alt=""/><span>예매 확인/취소</span></a>
        </li>
        <li>
           <a href="#"><img src="<%=cp%>/mypage/image/moviestory.JPG" alt=""/><span>나의 무비스토리</span></a>
        </li>
        <li>
           <a href="#"><img src="<%=cp%>/mypage/image/update.JPG" alt=""/><span>개인정보수정</span></a>
        </li>
    </ul>
</div>

<br/><br/><br/><br/><br/>
<div class="box" style="background-color: #e1e1e1">
	<table bgcolor="#e1e1e1">
		<tr>
			<td><span class="title">개인정보</span> <span class="right"><input type="button" value="수정하기" class="btn1"></span></td>
		</tr>
		<tr>
			<td>휴대폰  <span class="right">userTel</span></td>
		</tr>
		<tr>
			<td>선호 영화관  <span class="right"></span></td>
		</tr>
		<tr>
			<td>SMS수신여부  <span class="right">거부/수신</span></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>
<div class="box">
	<table>
		<tr>
			<td><span class="title">최근 예매 내역</span>  <span class="right"><input type="button" value="더보기" class="btn1"></span></td>
		</tr>
	</table>
</div>
<div class="box">
	<table>
		<tr>
			<td><span class="title">나의 무비스토리</span></td>
		</tr>
		<tr>
			<td>보고싶어</td>
		</tr>
		<tr>
			<td>본영화</td>
		</tr>
		<tr>
			<td>나의 한줄평</td>
		</tr>
	</table>
</div>





</div>

</body>
</html>