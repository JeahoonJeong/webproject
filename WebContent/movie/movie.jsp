<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script type="text/javascript">

	<%-- function imageChange(file_name) {
		
		var i = "${imagePath }/" + file_name;
		
		alert(i);
		
		var f = document.mvFrom;
		
		f.action = "<%=cp%>/Movie/movie.do"
		f.submit();
		
		
		
	} --%>

	
	function sendIt() {
		var f = document.mvForm;
		
		str = f.rate2.value;
		if(!str){
			alert("평점을 선택하세요");
			return;
		}
		f.rate2.value = str;
		
		str = f.comments.value;
		if(!str){
			alert("내용을 입력해주세요");
			f.comments.focus();
			return;
		}
		f.comments.value = str;
		
		f.action = "<%=cp%>/Movie/comments.do?movie_id=" + ${dto.movie_id };
		f.submit();	
	}

	
	function star() {
		var f = document.mvForm;

		var svalue = f.rate2.selectedIndex;
		
		f.rating.value=f.rate2.options[svalue].value;
	}


</script>

<title>Movie Info</title>
<style type="text/css">

select#rate option[value="0"] { background-image:url(${imagePath}/midrate0.png);   }

</style>

<script type="text/javascript">

function goToP() {
	
	window.opener.location.href="<%=cp%>/Timetable/movieTime_ok.do?movie_id=${dto.movie_id}";
	
	window.close();
}

function goToB(movie_id) {
	
	var url = "<%=cp%>/Booking/booking.do?selectedMoviedId="+movie_id+"&checking=5";
	
	var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90, width=968, height=650, left='+(screen.width-968)/2+'';
	
	window.open(url,"booking",setting);
	
	window.close();
	
}

function sendIt() {
	var f = document.mvForm;
	
	str = f.rate2.value;
	if(!str){
		alert("평점을 선택하세요");
		return;
	}
	f.rate2.value = str;
	
	str = f.comments.value;
	if(!str){
		alert("내용을 입력해주세요");
		f.comments.focus();
		return;
	}
	f.comments.value = str;
	
	f.action = "<%=cp%>/Movie/comments.do?movie_id=" + ${dto.movie_id};
	f.submit();
		
}

</script>
</head>
<body marginheight="0" marginwidth="0" scroll=auto style="overflow-x:hidden;">
<form action="" method="post" name="mvForm">
<div class="all">
	<table border="0" width="888px" height="376px" style="margin-bottom: 40px;">
		<tr>
			<td rowspan="5" width="230px" valign="top">
			<span>
			<img src="${imagePath }/${dto.file_name}" width="230px" height="336px"/></span>
			</td>
			<td rowspan="5" width="10px;"></td>
			<td height="3%" class="title">
			<span style="vertical-align: bottom;">
			<img src="${imagePath }/age${dto.age_limit}big.png"/></span>
			<span style="color: #353535; font-size: 22pt; vertical-align: top; font-weight: bold;">
			${dto.movie_name }</span>
			<p style="color: #747474; font-size: 9pt; font-family: 맑은고딕;">
			${dto.movie_eng_name }</p></td>
		</tr>
		<tr>
			<td height="42px" style="padding-top: 5px;">
			<div style="float: left;">
			<c:if test="${dto.rating==0 }"><img src="${imagePath }/mvrate0.png"></c:if>
			<c:if test="${dto.rating<3&&0<dto.rating}"><img src="${imagePath }/mvrate1.png"></c:if>
			<c:if test="${2<dto.rating&&dto.rating<5}"><img src="${imagePath }/mvrate2.png"></c:if>
			<c:if test="${4<dto.rating&&dto.rating<7 }"><img src="${imagePath }/mvrate3.png"></c:if>
			<c:if test="${6<dto.rating&&dto.rating<9 }"><img src="${imagePath }/mvrate4.png"></c:if>
			<c:if test="${8<dto.rating&&dto.rating<11 }"><img src="${imagePath }/mvrate5.png"></c:if>
			<br>
			<font style="font-size: 9pt; color: #747474; vertical-align: top;">${dto.countRate }명 참여</font></div>
			<span style="float: left; margin-left: 10px;">
			<strong style="font-size: 20pt; font-weight: bold; color: #353535; vertical-align: top;">${dto.rating } 점</strong>
			</span>
			
			<span style="float: right;"><input type="button" name="booking" value="예매하기" class="btn1"
			onclick="goToB(${dto.movie_id});"/>
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
			<!-- <span style="float: left;">
			<font size="2pt;" color="#4C4C4C">내 평점</font> 

			<select id="rate1" style="width: 119px; height: 20px;">
			<option value="0"></option>
			</select>
			
			<font size="1pt;" color="#4C4C4C">너무 멋진 영화였어요!</font></span> -->
			<span style="float: right;">
			<c:if test="${empty wish }">
				<input type="button" value="♥ 보고싶어" name="wishMovie" class="btn2" onclick="javascipt:location.href='<%=cp%>/Movie/wish_add.do?movie_id=${dto.movie_id}'">
			</c:if>
			<c:if test="${!empty wish }">
				<input type="button" value="♡ 보기싫어" name="wishMovie" onclick="javascipt:location.href='<%=cp%>/Movie/wish_remove.do?movie_id=${dto.movie_id}'" class="btn4"/>
			</c:if>
			<input type="button" value="상영시간표" name="booking" onclick="goToP();" class="btn3"/>
			<br/><font size="2pt" color="red">${message }</font>
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
		<h3>스틸컷 <font style="font-size: 14px;">${stillCount }</font></h3>
		<div id="image_top">						
			<%-- <div class="lbtn"><a href="javascript:void(0);" title="이전 스틸컷 보기">
			<img src="${imagePath }/left_btnn.png"/></a></div> --%>
			
			<c:forEach var="still" items="${still }">
			<ul style="float: left;">
			<li>
			<a href="#image_top"><img src="${imagePath }/${still.file_name}" height="110px"/></a>

			<img class="full" src="${imagePath }/${still.file_name}" height="500px" />
			
			</li>
			</ul>
			</c:forEach>

		
			<%-- <div class="rbtn"><a href="javascript:void(0);" title="이전 스틸컷 보기">
			<img src="${imagePath }/right_btnn.png"/></a></div>	 --%>	
	</div>
		<div id="image_content">
			<%-- <div class="lbtn"><a href="javascript:void(0);">
			<img src="${imagePath }/left_btnbig.png"/></a></div> --%>
		
			
	<%-- 	<div class="rbtn"><a href="javascript:void(0);">
			<img src="${imagePath }/right_btnbig.png"/></a></div> --%>
		</div>

		
	</div>
	<!-- </form> -->
	<div id="comment">
		<div id="comment_head">
		<h3>한줄평 <span style="color: #666666; font-size: 14px;">(${dto.commCount })</span></h3>
		</div>
		<div style="width: 888px; height: 128px;">
			<c:choose>
				<c:when test="${empty sessionScope.member.user_id }">
				<span style="padding-top: 58px; float: left;">
					<img class="radius" width="56px" height="56px" src="${imagePath }/profile.png"></span>
				</c:when>
				<c:otherwise>
				<span style="padding-top: 58px; float: left;">
					<img width="56px" height="56px" src="${imagePath }/${sessionScope.member.file_name}"></span>
				</c:otherwise>
			</c:choose>
			<table id="comment_input">
				<tr>
					<c:choose>
						<c:when test="${empty sessionScope.member.user_id }">
						<td class="star">
						</td>
						<td class="text">
						<span class="textarea">로그인 후 이용 가능합니다</span>
						</td>
						<td width="84px" height="84px">
						<input type="button" value="등록" class="btn" onclick="#"/>
						</td>
						</c:when>
						<c:otherwise>
						<td class="star">
						<input type="hidden" name="rating" />
						<select id="rate2" style="width: 119px; height: 30px; border-style: none; appearance: none;" onchange="star();">
						<option value="0">☆☆☆☆☆</option>
						<option value="2">★☆☆☆☆</option>
						<option value="4">★★☆☆☆</option>
						<option value="6">★★★☆☆</option>
						<option value="8">★★★★☆</option>
						<option value="10">★★★★★</option>
						</select>
						</td>
						<td class="text">
						<textarea title="댓글쓰기" name="comments" maxlength="100"
						class="textarea"></textarea>
						</td>
						<td width="84px" height="84px">
						<input type="button" value="등록" class="btn" onclick="sendIt();"/>
						</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	<div id="comment_view">
		<table width="888px">
			<tr>
				<td class="head" colspan="2"></td>
			</tr>
			<c:set var="i" value="0"/>	
			<c:forEach var="comm" items="${comm }">
			<c:if test="${i==0 }">
			<tr>
			</c:if>
			<c:if test="${i!=0&&i%2==0 }">
			</tr>
			<tr>
			</c:if>
				<td class="cell">
				<span style="width: 80px; float: left;">
				<c:choose>
					<c:when test="${empty comm.file_name }">
						<img class="radius" src="${imagePath }/profile.png" height="54px" width="54px"/>
					</c:when>
					<c:otherwise>
						<img class="radius" src="${imagePath }/${comm.file_name}" height="54px" width="54px"/>
					</c:otherwise>
				</c:choose>
				</span>
				<span class="text">
				<span class="id"><strong>${comm.user_id }</strong></span>
				<span class="date">${comm.comment_date }</span>
				<span>
					<c:if test="${comm.rating==0 }"><img src="${imagePath }/s_star0.png"></c:if>
					<c:if test="${comm.rating<3&&0<comm.rating}"><img src="${imagePath }/s_star1.png"></c:if>
					<c:if test="${2<comm.rating&&comm.rating<5}"><img src="${imagePath }/s_star2.png"></c:if>
					<c:if test="${4<comm.rating&&comm.rating<7 }"><img src="${imagePath }/s_star3.png"></c:if>
					<c:if test="${6<comm.rating&&comm.rating<9 }"><img src="${imagePath }/s_star4.png"></c:if>
					<c:if test="${8<comm.rating&&comm.rating<11 }"><img src="${imagePath }/s_star5.png"></c:if>
				</span>
				<p><span class="content">
				${comm.comments }
				</span></p>
				<p class="bottom">
					<a href="javascript:location.href=
					'<%=cp%>/Movie/recommend.do?user_id=${comm.user_id }&movie_id=${dto.movie_id }'">
					<img src="${imagePath }/thumb.png" style="vertical-align: middle;" /> 추천 
					<font style="font-weight: bold;">${comm.recommend_num }</font></a></span>
				</p>
				</td>
			<c:set var="i" value="${i+1 }" />
			</c:forEach>
			<c:if test="${i>0&&i%2!=0 }">
			<td class="cell">&nbsp;</td>
			</c:if>
			<c:if test="${i!=0 }"></td></c:if>
		</table>
		<input type="hidden" name="stillCount" value="${stillCount }"/>
		<%-- <div>
		<p align="center">
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된 코멘트가 없습니다.
			</c:if>
				
		</p>
		</div> --%>
	</div>
	</div>
</div>
</form>

	
	





</body>
</html>