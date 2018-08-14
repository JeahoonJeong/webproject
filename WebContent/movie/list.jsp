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
<link rel="stylesheet" href="<%=cp%>/movie/css/style.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script type="text/javascript">

	function showPop() {
		
		window.open("movie.jsp","movieInfo",
				"top=90, width=968, height=500, left="
				+(screen.width-968)/2+"",
				"toolbar=no", "menubar=no", "status=no","resizable=no",
				"location=no");	
	}

</script>
</head>
<body>

<div id="title">
	<table width="1000px" height="50px" align="center" style="vertical-align: middle;" class="topMenu">
		<tr>
			<td><a href=<%=cp %>/movie/list.jsp><font color="#503396">박스오피스</font></a></td>
			<td><a href=<%=cp %>/movie/list_date.jsp>최신개봉작</a></td>
			<td><a href=<%=cp %>/movie/list_pre.jsp>상영예정작</a></td>
			<td><span style="float: left;">
			<a href="<%=cp %>/movie/wishMov.jsp">♥ 보고싶어</a></span>
			<span style="float: right;">
			<font size="2pt">
			<a href="<%=cp %>/movie/myMov.jsp">나의 무비스토리</a></font></span></td>
		</tr>
	</table>
	
</div>


<div class="content">
	<table>
		<tr>
			<td width="220px" class="top">
			<img src="./image/mission.jpg" width="100%" height="330px"/>
			</td>
		</tr>
		<tr>
		<td width="220px" height="50px" class="bottom">
		<span style="line-height: 25px;">
		<font color="grey" style="font-weight: bold; font-size: 11pt;">평점8.3</font></span>
		<span style="float: right;"><img src="./image/bg_allstar1.png"/></span>
		</td>
		</tr>
		<tr>
		<td class="middle">
		<img src="./image/age15.png" align="middle"/>
		<font color="#353535" style="font-weight: bold;">
		<a href="javascript:showPop();">미션임파서블:폴</a>…</td>
		</tr>
		<tr>
		<td class="bottom" align="center"> 
		<input type="button" value="상세정보" class="btn1"
		onclick="showPop();"/>
		&nbsp;<input type="button" value="예매하기" class="btn1"
		onclick=""/></td>
		</tr>
	</table>
</div>


<div class="content">
	<table>
	<c:set var="i" value="0"/>
	<c:forEach var="dto" items="${lst }">
	<c:if test="${i==0 }">
		<tr>
	</c:if>
	<c:if test="${i!=0&&i%3==0 }">
		</tr>
		<tr>
	</c:if>
	<td width="220px" class="top">
	<img src="${imagePath }/${dto.saveFileName}" width="100%" height="330px"/>
	</td>
	</tr>
	<tr>
	<c:if test="${dto.relDate<sysdate }">
	<td width="150px" height="30px">평점${dto.star }</td></c:if>
	<c:if test="${dto.relDate>sysdate }">
	<td width="150px" height="30px" >${dto.relDate }
	<table cellspacing="5" bgcolor="#503396"><tr><td></td></tr></table></td>
	</c:if>
	</tr>
	<tr>
	<td><img src="${imagePath }/${dto.saveFileName}"/>&nbsp;${dto.title }</td>
	</tr>
	<tr>
	<td>상세정보&nbsp;예매하기</td>
	</tr>
	</c:forEach>
	</table>
</div>





</body>
</html>