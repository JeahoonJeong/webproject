<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String linkpage  = request.getParameter("linkpage");
	
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
<jsp:include page="../header.jsp" flush="false"/>
<div id="mypage">

<div>
<a href="<%=cp%>/Mypage/mypageMain.do"><span class="font">나의 메가박스</span></a><br/><br/>
<hr size="3" color="#7A67AC" width="800px" style="float: left;"><br/><br/></div>
<div><span class="font" >${member.getUser_name() }</span> 님, 오늘도 영화처럼 멋진 하루 되세요!<br/><br/>
<hr size="1" color="#7A67AC" width="800px" style="float: left"></div>
<br/><br/>

<div>
	<ul class="nav_gnb">     	
		<li>
            <a href="<%=cp%>/Mypage/myBooking.do"><img src="<%=cp%>/mypage/image/res.JPG" alt=""/><span>예매 확인/취소</span></a>
        </li>
        <li>
           <a href="#"><img src="<%=cp%>/mypage/image/moviestory.JPG" alt=""/><span>나의 무비스토리</span></a>
        </li>
        <li>
           <a href="<%=cp%>/Mypage/myInfo.do"><img src="<%=cp%>/mypage/image/update.JPG" alt=""/><span>개인정보수정</span></a>
        </li>
    </ul>
</div>

<div style="clear: both;">
	<br/>
<div style="clear: both;">
	<span class="title2">나의 무비스토리</span> &nbsp;&nbsp;&nbsp; 
	<br/><br/>
</div>

<div style="clear: both;">
	<ul>
		<li class="tab"><a href="<%=cp %>/mypage/list/interestingList.jsp" target="iframe1">보고싶어</a></li>
		<li class="tab"><a href="<%=cp %>/mypage/list/seenList.jsp" target="iframe1">본 영화</a></li>
		<li class="tab"><a href="<%=cp %>/mypage/list/myCommentList.jsp" target="iframe1">나의 한줄평</a></li>
	</ul>
</div>
	<br/><br/>

<div style="clear: both;">
<iframe  src="<%=cp %>/mypage/list/<%=linkpage %>.jsp"  name="iframe1" width="900px" height="900px" frameborder="0"></iframe>
</div>


</div>


</div>
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>