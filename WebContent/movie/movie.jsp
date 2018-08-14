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
	padding-right: 40px;
	font-family: 'Nanum Gothic', sans-serif;
}
.title{
	padding: 0px;
	border-bottom: 1px solid #CCCCCC;
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

.btn2{
	width: 100px;
	height: 39px;
	background-color: white;
	color: #666666;
	border-style: none;
	border: 1px solid #A6A6A6;
	font-weight: bold;
	font-size: 10pt;
	font-family: 'Nanum Gothic', sans-serif;
	cursor: pointer;
}
.btn3{
	width: 100px;
	height: 39px;
	background-color: white;
	color: #00858C;
	border-style: none;
	border: 1px solid #A6A6A6;
	font-weight: bold;
	font-size: 10pt;
	font-family: 'Nanum Gothic', sans-serif;
	cursor: pointer;
}

.middle{
	padding: 0px;
	vertical-align: top;
	border-bottom: 1px solid #CCCCCC;
	color: #4C4C4C;
	font-size: 10pt;
}
.content{
	width: 888px;
	
}
.btn2:hover{background-color: #666666; color: white;}
.btn3:hover{border: 1px solid #00858C;}

</style>
</head>
<body marginheight="0" marginwidth="0" class="all">
<div>
	<table border="0" width="888px" height="376px" style="margin-bottom: 60px;">
		<tr>
			<td rowspan="5" width="230px" valign="top">
			<span>
			<img src="./image/mission.jpg" width="230px" height="336px"/></span>
			</td>
			<td rowspan="5" width="10px;"></td>
			<td height="3%" class="title">
			<img src="./image/age15big.png"/>
			<span style="color: #353535; font-size: 22pt; vertical-align: top;">미션 임파서블: 폴아웃</span>
			<p style="color: #747474; font-size: 9pt; font-family: 맑은고딕;">
			Mission:Impossible- Fallout ,</p></td>
		</tr>
		<tr>
			<td height="42px" style="padding-top: 5px;">
			<span style="float: left;">
			<img src="./image/allstar.png" align="bottom"/><br>
			<font style="font-size: 9pt; color: #747474; vertical-align: top;">0001명 참여</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<strong style="font-size: 20pt; font-weight: bold; color: #353535;">8.0</strong></span>
			
			<span style="float: right;"><input type="button" name="booking" value="예매하기" class="btn1"
			onclick="<%=cp%>/booking/booking.jsp"/></span>
			</td>		
		</tr>
		<tr>
			<td height=100px class="middle">
			<p><font style="font-weight: bold;">타입</font> : 디지털(자막)</p>
			<p><font style="font-weight: bold;">개봉일</font> : 2018.07.25</p>
			<p><font style="font-weight: bold;">감독</font> : 크리스토퍼 맥쿼리</p>
			<p><font style="font-weight: bold;">출연진</font> : 톰 크루즈</p>
			<p><font style="font-weight: bold;">장르</font> : 스릴러, 액션 / 147 분</p>			
			</td>
		</tr>
		<tr>
			<td height="50px" rowspan="2" style="padding: 0px;">
			<span style="float: left;">
			<font size="2pt;" color="#4C4C4C">내 평점</font> <img src="./image/bg_allstar1.png" align="middle"/> 
			<font size="1pt;" color="#4C4C4C">너무 멋진 영화였어요!</font></span>
			<span style="float: right;">
			<input type="button" value="♥보고싶어" name="wishMovie" onclick="" class="btn2"/>
			<input type="button" value="상영시간표" name="booking" onclick="" class="btn3"/>
			
			</span>
			</td>
		</tr>
	</table>
	
	<div class="content">
		<dt>
		<h3>줄거리</h3><br><br>
		
		</dt>		
	</div>
	
	
		
</div>





</body>
</html>