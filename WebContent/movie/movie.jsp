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
<link rel="stylesheet" href="<%=cp%>/movie/css/movie.css" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>Movie Info</title>
<script type="text/javascript">
</script>
</head>
<body marginheight="0" marginwidth="0" scroll=auto style="overflow-x:hidden;">
<div class="all">
	<table border="0" width="888px" height="376px" style="margin-bottom: 40px;">
		<tr>
			<td rowspan="5" width="230px" valign="top">
			<span>
			<img src="./image/mission.jpg" width="230px" height="336px"/></span>
			</td>
			<td rowspan="5" width="10px;"></td>
			<td height="3%" class="title">
			<img src="./image/age15big.png"/>
			<span style="color: #353535; font-size: 22pt; vertical-align: top;">${dto.movie_name }</span>
			<p style="color: #747474; font-size: 9pt; font-family: 맑은고딕;">
			Mission:Impossible- Fallout ,</p></td>
		</tr>
		<tr>
			<td height="42px" style="padding-top: 5px;">
			<div style="float: left;">
			<img src="./image/allstar.png" align="bottom"/><br>
			<font style="font-size: 9pt; color: #747474; vertical-align: top;">${dto.count }명 참여</font></div>
			<span style="float: left; margin-left: 10px;">
			<strong style="font-size: 20pt; font-weight: bold; color: #353535; vertical-align: top;">${dto.rating }</strong>
			</span>
			
			<span style="float: right;"><input type="button" name="booking" value="예매하기" class="btn1"
			onclick="<%=cp%>/booking/booking.jsp"/>
			</span>
			</td>		
		</tr>
		<tr>
			<td height=100px class="middle">
			<p><font style="font-weight: bold;">타입</font> : ${dto.type }</p>
			<p><font style="font-weight: bold;">개봉일</font> : ${dto.release_date }</p>
			<p><font style="font-weight: bold;">감독</font> : ${dto.director }</p>
			<p><font style="font-weight: bold;">출연진</font> : ${dto.actors }</p>
			<p><font style="font-weight: bold;">장르</font> : ${dto.genre } / ${dto.showtimes } 분</p>			
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
	<div class="summary">
		<h3>줄거리</h3>
		<div style="font-size: 14px; color: #666666; font-weight: lighter;">
		${dto.summary }
		</div>
	</div>
	<div id="image">
		<h3>스틸컷 <font style="font-size: 14px;">22</font></h3>
		<div id="image_top">						
			<div class="lbtn"><a href="javascript:void(0);" title="이전 스틸컷 보기">
			<img src="./image/left_btnn.png"/></a></div>
			<span style="float: left;"><img src="./mvImage/mission1.jpg" height="110px"/></span>
			<span style="float: left;"><img src="./mvImage/mission2.jpg" height="110px"/></span>
			<span style="float: left;"><img src="./mvImage/mission3.jpg" height="110px"/></span>
		
		<div class="rbtn"><a href="javascript:void(0);" title="이전 스틸컷 보기">
			<img src="./image/right_btnn.png"/></a></div>		
	</div>
		<div id="image_content">
			<div class="lbtn"><a href="javascript:void(0);">
			<img src="./image/left_btnbig.png"/></a></div>
			<img src="./mvImage/mission1.jpg" height="500px">
			<div class="rbtn"><a href="javascript:void(0);">
			<img src="./image/right_btnbig.png"/></a></div>
		</div>
	</div>
	<div id="comment">
		<div id="comment_head">
		<h3>한줄평 <span style="color: #666666; font-size: 14px;">(20)</span></h3>
		</div>
		<div style="width: 888px; height: 128px;">
			<span style="padding-top: 58px; float: left;">
			<img width="56px" height="56px" src="./image/profile.png"></span>
			<table id="comment_input">
				<tr>
					<td class="star"></td>
					<td class="text">
					<textarea title="댓글쓰기" name="comment" maxlength="100"
					class="textarea"></textarea>
					</td>
					<td width="84px" height="84px">
					<input type="button" value="등록" class="btn"/>
					</td>
				</tr>
			</table>
		</div>
		<div id="comment_view">
			<div class="cell">
				<div style="width: 80px; float: left;">
					<img src="./image/profile.png" height="54px" width="54px"/>
				</div>
				<div class="text">
				<div class="id"><strong>knr12**</strong></div>
				<div class="date"><span>18.08.16</span></div>
				<div><img src="./image/smallstar.png"/></div>
				<p><span class="content">재밌는 영화
				</span></p>
				<div class="bottom">
				<a href="javascript:thumb();">
				<img src="./image/thumb.png" style="vertical-align: middle;" /> 추천 
				<font style="font-weight: bold;">5</font></a></div>		
				</div>
			</div>	
			
		</div>
	</div>
	
	
		
</div>





</body>
</html>