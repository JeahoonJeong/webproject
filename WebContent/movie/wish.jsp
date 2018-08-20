<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../header.jsp" flush="false" />
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp%>/movie/css/list.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/mypage/css/list.css"
	type="text/css">
<link rel="stylesheet" href="<%=cp%>/mypage/css/wishlist.css"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<script type="text/javascript">
	function showPop(movie_id) {

		var url = "movie.do?movie_id=" + movie_id;

		var setting = 'toolbar=no,menubar=no,status=no,resizable=no,location=no,top=90, width=968, height=650, left='
				+ (screen.width - 968) / 2 + '';

		window.open(url, "movieInfo", setting);

	}
</script>
</head>
<body>
	<form action="" method="post" id="mvForm">
		<div id="title">
			<table width="1000px" height="50px" align="center"
				style="vertical-align: middle;" class="topMenu">
				<tr>
					<td><a href=<%=cp%> /Movie/list.do>박스오피스</a></td>
					<td><a href=<%=cp%> /Movie/list_date.do>최신개봉작</a></td>
					<td><a href=<%=cp%> /Movie/list_pre.do>상영예정작</a></td>
					<td><span style="float: left;"> <a
							href="<%=cp%>/Movie/wish.do"><font color="#503396">♥
									보고싶어</font></a></span> <span style="float: right;"> <font size="2pt">
								<a href="<%=cp%>/movie/myMov.jsp">나의 무비스토리 ></a>
						</font></span></td>
				</tr>
			</table>
		</div>

		<div id="content">

			<div id="list" align="center">
				* 보고싶은 영화 해제는 영화 상세정보 페이지에서 가능합니다.
				<div>

					<c:if test="${empty wishList }">
						<div id="content">
							<table style="float: left;" class="wish_movie" width="235px"
								height="515px">
								<tr>
									<td style="border-bottom: none;"><img alt=""
										src="<%=cp%>/mypage/image/wishmovie.JPG"></td>
								</tr>
							</table>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</form>




	<div style="clear: both;">
		<jsp:include page="../footer.jsp" flush="false" />
	</div>
</body>
</html>