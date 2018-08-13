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
<link rel="stylesheet" href="<%=cp%>/loginPage/data/login.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript" src="<%=cp%>/loginPage/data/util.js"></script>

<title>로그인</title>
</head>
<body>

<div id="login">

<div style="clear: both;">
<img src="<%=cp %>/loginPage/image/megabox.JPG"><br/><br/>
<span>MEGABOX</span>에 오신것을 환영합니다.
</div>

<div style="clear: both">
<br/><br/><br/><br/>
</div>

<span>MEGABOX</span> 로그인
<br/>

<form action="" name="myForm">
<table align="center">
	<tr>
		<td><input type="text" name="userId" class="boxTX" placeholder="아이디"></td>
		<td rowspan="2"><input type="button" value="로그인" class="btn" onclick="sendIt();"></td>
	</tr>
	<tr>
		<td><input type="password" name="userPw" class="boxTX" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<td colspan="2"><br/>
		<a href="">회원가입</a>&nbsp;&nbsp;&nbsp; 
		<a href="">ID/PW찾기</a>
		</td>
	</tr>
</table>
</form>

</div>

</body>
</html>