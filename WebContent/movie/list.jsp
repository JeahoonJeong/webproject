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
<style type="text/css">

#title{

	width: 100%;
	background-color:  #F2F2F2;
	border-bottom: 3px solid #503396;
	height: 50px;
	margin-top: 140px;
	font-family: 나눔고딕코딩;
	font-size: 12pt;
	font-weight: bold;
	color: #4C4C4C;
}

.content{
	
	font-family: 나눔고딕코딩;
	margin-top: 50px;
	margin-left: 70px;
	margin-right: 70px;
	align: center;
}

.top{
	border-top: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
}
.middle{
	font-size: 16pt;
	padding: 10px;
	padding-bottom: 0px;
	height: 50px;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
}
.bottom{
	font-size: 10pt;
	padding: 10px;
	height: 30px;
	border-bottom: 1px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
}
.btn1{
	font-family: 나눔고딕코딩;
	font-size: 11pt;
	font-weight: bold;
	color: #4C4C4C;
	background-color: #F2F2F2;
	width: 100px;
	height: 50px;
	border-style: none;
	cursor: pointer;
}
.btn1:hover{
	background-color: white; 
	color: #1294AB;
	border-color: #1294AB;
	border-style: solid;;
}

.topMenu a:hover {text-decoration: none; color: #503396;}
.topMenu a:visited {text-decoration: none; color: #503396;}	

a:link {text-decoration: none; color: #4C4C4C;}

</style>

</head>
<body>

<div id="title">
	<table width="1000px" height="50px" align="center" style="vertical-align: middle;" class="topMenu">
		<tr>
			<td><a href=<%=cp %>/movie/list.jsp>박스오피스</a></td>
			<td><a href=<%=cp %>/movie/list_date.jsp>최신개봉작</a></td>
			<td><a href=<%=cp %>/movie/list_pre.jsp>상영예정작</a></td>
			<td><span style="float: left;">♥ 보고싶어</span>
			<span style="float: right;">
			<font size="2pt">나의 무비스토리</font></span></td>
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
		<font color="grey" style="font-weight: bold;">평점8.3</font></span>
		<span style="float: right;"><img src="./image/star.png"/><img src="./image/star.png"/><img src="./image/star.png"/><img src="./image/star.png"/><img src="./image/emptystar.png"/>
		</span>
		</td>
		</tr>
		<tr>
		<td class="middle">
		<img src="./image/age15.png" align="middle"/>
		<font color="#353535" style="font-weight: bold;">
		<a href=<%=cp%>/movie/movieInfo.jsp>미션임파서블:폴</a>…</td>
		</tr>
		<tr>
		<td class="bottom" align="center"> 
		<input type="button" value="상세정보" class="btn1"
		onclick="javascipt:location.href='<%=cp%>/movie/movieInfo.jsp'"/>
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
	<td width="150px">
	<img src="${imagePath }/${dto.saveFileName}" width="100%" height="200px"/>
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