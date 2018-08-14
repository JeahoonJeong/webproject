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

.guest_book{width:100%;padding:0; color: #363636; margin: 0;margin-bottom: 0px;}
.g_book-box{width:100%;}
.g_book-box dd{width:100%; height:100px; padding:10px; font-size:10pt; border-top:1px solid #ddd; background:#fff;border-bottom:1px solid #ddd;}
.g_book-box dd span{float:right; font-size:9pt; font-weight: normal; cursor: pointer;}

</style>

</head>
<body>
<div id="list"><br/><br/>

<div class="guest_book" style="display: table; height: 100px">	
            <dl class="g_book-box">
                <dd>
					<img alt="" src="<%=cp%>/mypage/image/wishmovie.JPG" style="float: left;" height="100px">
					<div style="float: left; text-align: center; height: 100px; width: 200px;"><br/><img src="<%=cp%>/mypage/image/age15.JPG" height="25px" width="25px""> <font size="2" style="font-weight: bold; line-height: 25px">스파이더맨 홈커밍</font>
					<br/><br/><img src="<%=cp%>/movie/image/star.png"><img src="<%=cp%>/movie/image/star.png"><img src="<%=cp%>/movie/image/star.png"><img src="<%=cp%>/movie/image/star.png"></div>
                	  	<div style="float: left; text-align: left; display: table-cell; taxt-align:center;vertical-align:middle;" >      
						액션은 화려하고 좋았지만, 스토리는 다소 아쉬웠어요
                <br/>
                     추천? | 2018.08.13 11:14
               
                		</div>
                	<div style="float: left; text-align: center; height: 100px; width: 50px;">
                	  <span><img src="<%=cp%>/mypage/image/del.JPG"></span><span><img src="<%=cp%>/mypage/image/modify.JPG"></span>
                	</div>
                 
                      
                </dd>  
            </dl>

</div>





</div>
</body>
</html>