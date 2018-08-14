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
<div>
<div class="content">
	<table style="float: left;">
		<tr>
			<td width="220px" class="top">
			<img src="<%=cp%>/movie/image/mission.jpg" width="100%" height="330px"/>
			</td>
		</tr>
		<tr>
		<td width="220px" height="50px" class="bottom">
		<span style="line-height: 25px;">
		<font color="grey" style="font-weight: bold;">평점8.3</font></span>
		<span style="float: right;"><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/emptystar.png"/>
		</span>
		</td>
		</tr>
		<tr>
		<td class="middle">
		<img src="<%=cp%>/movie/image/age15.png" align="middle"/>
		<font color="#353535" style="font-weight: bold;">
		<a href="<%=cp%>/movie/movie.jsp">미션임파서블:폴</a>…</font></td>
		</tr>
		<tr>
		<td class="bottom" align="center"> 
		<input type="button" value="상세정보" class="btn2"
		onclick="javascipt:location.href='<%=cp%>/movie/movie.jsp'"/>
		&nbsp;<input type="button" value="예매하기" class="btn2"
		onclick=""/></td>
		</tr>
	</table>
	<table style="float: left;">
		<tr>
			<td width="220px" class="top">
			<img src="<%=cp%>/movie/image/mission.jpg" width="100%" height="330px"/>
			</td>
		</tr>
		<tr>
		<td width="220px" height="50px" class="bottom">
		<span style="line-height: 25px;">
		<font color="grey" style="font-weight: bold;">평점8.3</font></span>
		<span style="float: right;"><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/star.png"/><img src="<%=cp%>/movie/image/emptystar.png"/>
		</span>
		</td>
		</tr>
		<tr>
		<td class="middle">
		<img src="<%=cp%>/movie/image/age15.png" align="middle"/>
		<font color="#353535" style="font-weight: bold;">
		<a href="<%=cp%>/movie/movie.jsp">미션임파서블:폴</a>…</font></td>
		</tr>
		<tr>
		<td class="bottom" align="center"> 
		<input type="button" value="상세정보" class="btn2"
		onclick="javascipt:location.href='<%=cp%>/movie/movie.jsp'"/>
		&nbsp;<input type="button" value="예매하기" class="btn2"
		onclick=""/></td>
		</tr>
	</table>
	<table style="float: left;" class="wish_movie">
		<tr>
			<td width="235px" rowspan="4" height="515px"><img alt="" src="<%=cp%>/mypage/image/wishmovie.JPG">
			</td>
		</tr>
	</table>
</div>


</div>

</div>
</body>
</html>