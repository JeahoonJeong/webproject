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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Movie Info</title>
<style type="text/css">

.all{ 
	padding-top: 65px;
	padding-left: 40px;
	font-family: 'Nanum Gothic', sans-serif;
}
.title{
	padding: 0px;
	border-bottom: 1px solid #CCCCCC;
}
.pic{
	background: url(./image/star_mid_off.png) no-repeat;
}
.pic:hover{
	background: url(./image/star_mid_on.png) no-repeat;
}
.btn1{
	width: 121px;
	height: 43px;
	color: white;
	background-color: #00858C;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	font-size: 12pt;
	border-style: none;
	cursor: pointer;
}
</style>
</head>
<body marginheight="0" marginwidth="0" class="all">
<div>
	<table border="1" width="888px">
		<tr>
			<td rowspan="4" height="336px" width="230px">
			<img src="./image/mission.jpg" width="230px" height="336px"/>
			</td>
			<td rowspan="4" width="10px;"></td>
			<td height="3%" class="title">
			<img src="./image/age15big.png"/>
			<span style="color: #353535; font-size: 22pt; vertical-align: top;">미션 임파서블: 폴아웃</span>
			<p style="color: #747474; font-size: 9pt; font-family: 맑은고딕;">
			Mission:Impossible- Fallout ,</p></td>
		</tr>
		<tr style="margin: 9px;">
			<td height="42px">
			<span style="float: left; line-height: 30px;"><img src="./image/allstar.png">
			<p style="font-size: 9pt; color: #747474;">0001명 참여</p></span>
			&nbsp;&nbsp;<span style="font-size: 20pt; font-weight: bold; color: #353535;">8.0</span>
			<span style="float: right;"><input type="button" name="booking" value="예매하기" class="btn1"
			onclick="<%=cp%>/booking/booking.jsp"/></span>
			</td>		
		</tr>
		<tr>
			<td height=160px></td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
		
</div>





</body>
</html>