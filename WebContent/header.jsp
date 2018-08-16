<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
#header-wrap {
	position: fixed;
	top: -20px;
	left: 0px;
	width: 100%;
	background-color: white;
}

#header {
	background-color: white;
	width: 1000px;
	margin: auto;
	height: 50px;
}

#header img {
	float: left;
	width: 200px;
	height: 50px;
}

#header ul li {
	list-style: none;
	float: left;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	border-style: groove;
	border-width: 1px;
	border-color: gray;
}

#header .menuLink {
	background-color: white;
	color: black;
	text-decoration: none;
	display: block;
	width: 100px;
	font-size: 12px;
	font-weight: bold;
}

#header .menuLink:hover {
	color: #198591;
}

#header-menu {
	margin: auto;
	margin-top: 80px;
	padding-left: 0px;
	height: 120px;
	width: 1000px;
	height: 120px;
}

#header-menu-left {
	padding-left: 0px;
	margin-left: 0px;
	float: left;
	margin-left: 0px;
}

#header-menu-right {
	float: right;
}

#header-menu-left img {
	width: 80px;
	height: 40px;
}

#header-menu-right img {
	width: 110px;
	height: 40px;
}

#header-menu ul li {
	list-style: none;
	float: left;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
}

#header-menu-left .menu-left {
	color: black;
	text-decoration: none;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	text-align: left;
}

#header-menu-right .menu-right {
	color: black;
	text-decoration: none;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	text-align: left;
}
</style>


</head>
<body>
	
	<!-- HEADER 시작 -->
	<div id="header-wrap">
		<div id="header">
			<ul>
				<li><a href="<%=cp %>/"><img alt="" src="../image/magabox.jpg"></a></li>
				<li><a class="menuLink" href="<%=cp%>/movie/">영화</a></li>
				<li><a class="menuLink" href="#">큐레이션</a></li>
				<li><a class="menuLink" href="<%=cp%>/Theater/theater.do">영화관</a></li>
				<li><a class="menuLink" href="#">특별관</a></li>
				<li><a class="menuLink" href="#">스토어</a></li>
				<li><a class="menuLink" href="#">이벤트</a></li>
				<li><a class="menuLink" href="<%=cp%>/Login/login.do">로그인</a></li>
			</ul>
		</div>
	</div>
	<div id="header-menu">
		<div id="header-menu-left">
			<ul>
				<li class="menu-left"><img alt="" src="../image/menu.jpg"></li>
				<li class="menu-left">필름소사이어티</li>
				<li class="menu-left">클래식 소사이어티</li>
			</ul>
		</div>

		<div id="header-menu-right">
			<ul>
				<li class="menu-right">고객센터 | 멤버십 | VIP</li>
				<li class="menu-right"><img alt=""
					src="../image/timetable.jpg"></li>
				<li class="menu-right"><img alt=""
					src="../image/booking.jpg"></li>
			</ul>
		</div>
	</div>
	<!-- HEADER 끝 -->
	

</body>
</html>