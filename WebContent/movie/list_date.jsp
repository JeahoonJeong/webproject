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
<link rel="stylesheet" href="<%=cp%>/movie/style.css" type="text/css"/>
</head>
<body>
<div id="title">
	<table width="1000px" height="50px" align="center" style="vertical-align: middle;" class="topMenu">
		<tr>
			<td><a href=<%=cp %>/movie/list.jsp>박스오피스</a></td>
			<td><a href=<%=cp %>/movie/list_date.jsp><font color="#503396">최신개봉작</font></a></td>
			<td><a href=<%=cp %>/movie/list_pre.jsp>상영예정작</a></td>
			<td><span style="float: left;">♥ 보고싶어</span>
			<span style="float: right;">
			<font size="2pt">나의 무비스토리</font></span></td>
		</tr>
	</table>
	
</div>





</body>
</html>