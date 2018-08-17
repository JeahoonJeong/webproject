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
<link rel="stylesheet" href="<%=cp%>/register/css/mypage.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<title>나의 메가박스</title>
</head>
<body>
<jsp:include page="../header.jsp" flush="false"/>

<div id="mypage">

<div style="clear: both;">
	<br/>
<div style="clear: both;">
	<span class="title2">개인정보 수정</span> &nbsp;&nbsp;&nbsp; 회원님의 정보를 정확히 입력해주세요.
	<br/><br/>
</div>
<font color="#666">*표시 항목은 필수입력 항목입니다.</font>
<span class="right"><input type="button" class="btn2" value="비밀번호 변경" width="120px"  > 
	<input type="button" value="회원탈퇴" class="btn1" ></span>
<br/><br/>
<div>
<table height="120px">
	<tr>
		<td rowspan="2"><img alt="" src="<%=cp%>/mypage/image/profile_m.png" align="middle"></td>
		<td style="text-align: center;">${member.getUser_id() }<br/><br/>
		<input type="file" value="찾아보기">
		<input type="button" value="삭제">
		</td>
	</tr>
</table>
</div>
<div>
<table class="info">
	<tr>
		<th colspan="2"><b>기본정보 (필수입력)</b>
		</th>
	</tr>
	<tr>
		<td width="150px">* 비밀번호 
		</td>
		<td><input type="password" style="width: 150px">
		</td>
	</tr>
	<tr>
		<td>* 이름
		</td>
		<td><input type="text" value="${member.getUser_name() }" style="width: 150px">
		</td>
	</tr>
	<tr>
		<td>* 생년월일
		</td>
		<td>
		<input type="text" style="width: 50px" maxlength="4" value="<c:out value="${fn:substring(member.getBirth(),0,fn:length(member.getBirth())-6) }"></c:out>">년&nbsp;&nbsp; 
		<input type="text" style="width: 40px" maxlength="2" value="<c:out value="${fn:substring(member.getBirth(),fn:length(member.getBirth())-5,fn:length(member.getBirth())-3) }"></c:out>">월&nbsp;&nbsp; 
		<input type="text" style="width: 40px" maxlength="2" value="<c:out value="${fn:substring(member.getBirth(),fn:length(member.getBirth())-2,fn:length(member.getBirth())) }"></c:out>">일
		</td>
	</tr>
	<tr>
		<td> * 휴대폰
		</td>
		<td>
		<input type="text" style="width: 50px" maxlength="3" value="<c:out value="${fn:substring(member.getTel(),0,fn:length(member.getTel())-10) }"></c:out>">&nbsp;-&nbsp;
		<input type="text" style="width: 50px" maxlength="4" value="<c:out value="${fn:substring(member.getTel(),fn:length(member.getTel())-9,fn:length(member.getTel())-5) }"></c:out>">&nbsp;-&nbsp;
		<input type="text" style="width: 50px" maxlength="4" value="<c:out value="${fn:substring(member.getTel(),fn:length(member.getTel())-4,fn:length(member.getTel())) }"></c:out>">
		</td>
	</tr>
	<tr>
		<td> * 이메일 
		</td>
		<td><input type="text" value="${member.getEmail() }" style="width: 180px">
		</td>
	</tr>
</table>


<table class="info">
	<tr>
		<th colspan="2">부가정보 (선택입력)</th>
	</tr>
	<tr>
		<td width="150px"> 주소 
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td> 선호영화관
		</td>
		<td>
		</td>
	</tr>
</table>
</div>

</div>

</div>
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>