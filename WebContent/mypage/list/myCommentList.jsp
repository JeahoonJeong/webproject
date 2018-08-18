<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String path = cp + "/mv/imageFile";
	
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
.right{float:right; font-size:9pt; font-weight: normal; cursor: pointer;}

</style>
<script type="text/javascript">

function delComment(movie_id) {
	
	var f = document.myForm;

	if(confirm("삭제 하시겠습니까?") == true){
		
		f.action = "<%=cp%>/Mypage/list/comm_delete.do?movie_id=" + movie_id;
			
		f.submit();

	}else{
		return;
	}
}


function checkLength() {
	
	var f = document.myForm;
	
	 if(f.comments.value.length > 100) {

	      alert("글자수는 100자로 제한됩니다.");
			
	      f.comments.value=f.comments.value.substring(0,100);
	      
	      f.comments.focus();

	    }
	
}

function updateComment(movie_id) {
	
	var f = document.myForm;
	 
	 if(confirm("수정 하시겠습니까?") == true){
			
			f.action = "<%=cp%>/Mypage/list/comm_update.do?movie_id=" + movie_id;
				
			f.submit();

		}else{
			
			return;
		}
}


function open_field() { 
	
field.style.display='table-cell'; 

commentArea.style.display='none';

} 

function close_field() { 
	
field.style.display='none';

commentArea.style.display='table-cell';

} 


</script>

</head>
<body>
<form action="" method="post" name="myForm">
<div id="list"><br/><br/>
<c:if test="${empty commentsList }">* 나의 한줄평이 없습니다.</c:if>
<c:forEach items="${commentsList }" var="dto">
<div class="guest_book" style="display: table; height: 100px">	
            <dl class="g_book-box">
                <dd>
					<img alt="포스터" src="<%=path %>/${dto.getFile_name()}"  style="float: left;" height="100px" width="70px">
					<div style="float: left; text-align: center; height: 100px; width: 200px;"><br/>
					<img src="<%=cp%>/mypage/image/age15.JPG" height="25px" width="25px"> 
					<font size="2" style="font-weight: bold; line-height: 25px">${dto.getMovie_name() }</font>
					<br/><br/>
					 <c:if test="${empty dto.getRating()}">등록된 평점이 없습니다.</c:if>
                       <c:if test="${!empty dto.getRating() }">
                       		<c:choose>
                       			<c:when test="${dto.getRating()<3 && 0<dto.getRating() }">
                       				<img alt="" src="<%=cp%>/movie/image/rate1.png">
                       			</c:when>
                       			<c:when test="${2<dto.getRating() && dto.getRating()<5 }">
                       				<img alt="" src="<%=cp%>/movie/image/rate2.png">
                       			</c:when>
                       			<c:when test="${4<dto.getRating() && dto.getRating()<7 }">
                       				<img alt="" src="<%=cp%>/movie/image/rate3.png">
                       			</c:when>
                       			<c:when test="${6<dto.getRating() && dto.getRating()<9 }">
                       				<img alt="" src="<%=cp%>/movie/image/rate4.png">
                       			</c:when>
                       			<c:when test="${8<dto.getRating() && dto.getRating()<11 }">
                       				<img alt="" src="<%=cp%>/movie/image/rate5.png">
                       			</c:when>
                       		</c:choose>
                       </c:if>
					</div>
				
					<div id="field" style="display: none">	
						<div style="float: left; text-align: left; vertical-align:middle; width: 370px; height: 95px" >   
							<textarea rows="5" cols="40" name="comments" style="background-color: #ddd; overflow: hidden;" onkeyup="checkLength();">${dto.getComments() }</textarea>
						</div>
						<div style="float: left; text-align: center; height: 100px; width: 50px;">
							<span class="right"><img src="<%=cp%>/mypage/image/comm_cancel.png" onclick="close_field();" ></span>
                			<span class="right"><img src="<%=cp%>/mypage/image/comm_ok.png" onclick="updateComment(${dto.getMovie_id()});"></span>	
                		</div>
					</div>
					
				<div id="commentArea" style="display: table; height: 100px; width: 420px; vertical-align:middle;">
				
                	  	<div style="float: left; text-align: left; width: 370px; height: 95px" >      
						${dto.getComments() }
                <br/><br/>
                     <img src="<%=cp%>/mypage/image/mypage_reco.png"> 추천 ${dto.getRecommend_num() }&nbsp;&nbsp;|&nbsp;&nbsp;${dto.getComment_date() }
                		</div>
                	<div style="float: left; text-align: center; height: 100px; width: 50px;">
                	<span class="right"><img src="<%=cp%>/mypage/image/del.JPG" onclick="delComment(${dto.getMovie_id()});"></span>
                	<span class="right"><img src="<%=cp%>/mypage/image/modify.JPG" onclick="open_field();"></span>
                	</div>
                
                 </div>
                      
                </dd>  
            </dl>

</div>
</c:forEach>


</div>
</form>
</body>
</html>