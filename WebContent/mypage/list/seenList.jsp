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
<style type="text/css">

.guest_book{width:100%;padding:0px; color: #363636; margin: 0px;margin-bottom: 0px;}
.g_book-box{width:100%;}
.g_book-box dd{width:100%; height:160px; padding:10px; font-size:10pt; border-top:1px solid #ddd; background:#fff;border-bottom:1px solid #ddd;}
.g_book-box dd span{float:right; font-size:9pt; font-weight: normal; cursor: pointer;}

</style>

</head>
<body>
<div id="list"><br/><br/>
* 본 영화 리스트는 실제 관람한 이력으로 보여지며, 상영일 익일에 자동 노출됩니다.<br/><br/><br/>
<div class="guest_book">	
            <dl class="g_book-box">
                <dd>
					<img alt="" src="<%=cp%>/mypage/image/wishmovie.JPG" style="float: left;" height="160px">
                	<img src="<%=cp%>/mypage/image/age15.JPG" height="30px" width="30px" style="float: left;">
                
                      <font size="4" style="font-weight: bold;">스파이더맨 홈커밍</font><span><img src="<%=cp%>/mypage/image/del.JPG"></span>
                     <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     2017-07-09 13:30~15:53
                     <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     수원 1관/2명
                       <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      등록된 평점이 없습니다.
                      <span><input type="button" value="한줄평 쓰기>" class="btn3"></span>
                </dd>  
            </dl>

</div>
<div class="guest_book">	
            <dl class="g_book-box">
                <dd>
					<img alt="" src="<%=cp%>/mypage/image/wishmovie.JPG" style="float: left;">
                	<img src="<%=cp%>/mypage/image/age15.JPG" height="30px" width="30px" style="float: left;">
                
                      <font size="4" style="font-weight: bold;">스파이더맨 홈커밍</font><span><img src="<%=cp%>/mypage/image/del.JPG"></span>
                     <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     2017-07-09 13:30~15:53
                     <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     수원 1관/2명
                       <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      등록된 평점이 없습니다.
                      <span><input type="button" value="한줄평 쓰기>" class="btn3"></span>
                </dd>  
            </dl>

</div>

<div class="guest_book">	
            <dl class="g_book-box">
                <dd>
					<img alt="" src="<%=cp%>/mypage/image/wishmovie.JPG" style="float: left;">
                	<img src="<%=cp%>/mypage/image/age15.JPG" height="30px" width="30px" style="float: left;">
                
                      <font size="4" style="font-weight: bold;">스파이더맨 홈커밍</font><span><img src="<%=cp%>/mypage/image/del.JPG"></span>
                     <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     2017-07-09 13:30~15:53
                     <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     수원 1관/2명
                       <br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      등록된 평점이 없습니다.
                      <span><input type="button" value="한줄평 쓰기>" class="btn3"></span>
                </dd>  
            </dl>

</div>




</div>
</body>
</html>