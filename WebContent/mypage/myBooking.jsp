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

<div style="clear: both;">
<br/>
<div style="clear: both;">
예매 확인/취소  예매하신 영화 내역과 취소 내역을 확인할 수 있습니다.
<br/><br/>
</div>


<iframe  src="<%=cp %>/mypage/bookingList.jsp"  name="iframe1" width="720px" height="300px" frameborder="0">



</iframe>
</div>



</div>

</body>
</html>