<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 선택</title>

<link rel="stylesheet" href="<%=cp%>/booking/css/bookingstyle.css"
	type="text/css" />
</head>
<body>

	<table border="1" cellpadding="0" cellspacing="0" width="1000">
		<tr height="50">
			<td colspan="2">
				<span class= "text" style="margin-left: 20px; margin-top: 10px;">인원/좌석선택</span>
			</td>
		</tr>

		<tr>
<%-- 일반		<c:when test=""></c:when>	 --%>
			<td >
				
				일반 
				<select name = "type1" onclick="">
					<option>0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
				</select>				
				
				
			
				청소년 
				<select name = "type2" onclick="">
					<option>0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
				</select>				
			
				
			
				어린이 
				<select name = "type3" onclick="">
					<option>0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option> 
					<option>8</option>
				</select>				
		
				
			
				우대 
				<select name = "type4" onclick="">
					<option>0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
				</select>				
			

<%-- 조조 			<c:when test=""></c:when>	 --%> 


<%-- 심야			<c:when test=""></c:when>	 --%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
				<span style="text-align: right; font-size: 9pt" >인원 선택은 최대 8명까지 가능합니다.</span>
			</td>
			
			<td rowspan="2" style="background-color: #555555 " width="240">
				
				<table>
					<tr>
					<td>
					<img alt="IMG" src="" width="270" height="235"> <!-- 영화정보 이미지 불러오기 -->					
					</td>
					</tr>
					<tr>
					<td></td> <!-- 영화 상세정보 -->
					</tr>
					
					<tr>
						<td></td> <!-- 결제금액 정보 -->
					</tr>
				
				
				</table>
			
			</td>
		</tr>	
		
		<tr>
			<td>
				<table>
					<tr>
						<td>
						
						
						
						
						
						
						</td> <!-- 좌석표시 -->
						<td>
							<img align="right" alt="" src="./image/infoSeatPic.PNG" width="" height=""> <!-- 좌석안내 이미지 -->
						</td>
					</tr>
				</table>
			</td>
			
		</tr>
		
		<tr height="40">
			<td>
			<table border="0" cellpadding="0" cellspacing="0">
			<tr align="center">
			<td width="460"></td>
			<td width="100">
				<img  src="./image/reChoice.PNG" width="100" height="35" onclick="">			
			</td>			
			<td width="200" >
				<span > 좌석 선택 인원 </span> 			
			</td>
			</tr>
			
			</table>
			</td>
			<td style= "background-color:#555555">
			<table border="0" align="center" style= "background-color:#555555" cellpadding="0" cellspacing="0">
				<tr height="40">
					<td>
						<input type="button" value = "이전" onclick="" style=" font-size :12pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #F9F9F9 ; color : #747474 ;border: 1"/>
						&nbsp;&nbsp;
						<input type="button" value = "다음" onclick="" style=" font-size :12pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #513396; color: #ffffff; border: 1"/>
					</td>	
				</tr>
			</table>
			</td>
		</tr>
	</table>

</body>
</html>