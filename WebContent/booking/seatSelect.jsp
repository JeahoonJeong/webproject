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
	
<script type="text/javascript">
	function selectNum(){
		var f = document.seatSelectForm;
		
		var cvalue1 = f.type1.selectedIndex;
		
		var value1 = f.type1.options[cvalue1].value;
		
		var cvalue2 = f.type2.selectedIndex;
		
		var value2 = f.type2.options[cvalue2].value;
		
		var cvalue3 = f.type3.selectedIndex;
		
		var value3 = f.type3.options[cvalue3].value;
		
		var cvalue4 = f.type4.selectedIndex;
		
		var value4 = f.type4.options[cvalue4].value;
		
		f.action = "<%=cp%>/Booking/seatSelect.do?value1="+value1+"&value2="+value2+"&value3="+value3+"&value4="+value4;
		f.submit();
	}
	
	function cntCheck(){
		var f = document.seatSelectForm;
		
		var cntCheck = 0 ; 
		
		
		
		
	}

</script>
</head>
<body>
	<div align="center">
	<form name = "seatSelectForm" method="post">
	<table border="1" cellpadding="0" cellspacing="0" width="1000" class= "tb2"
	style="border-color: #CFCFCF; border-width: 1px; ">
		<tr height="50">
			<td colspan="2">
				<span class= "text" style="margin-left: 20px; margin-top: 10px;">인원/좌석선택</span>
			</td>
		</tr>

		<tr>
<%-- 일반		<c:when test=""></c:when>	 --%>
			<td >
				
				일반 
				<select class ="selection" name = "type1" onchange="selectNum();">
					
					<option value = 0>0</option>
					<option value = 1>1</option>
					<option value = 2>2</option>
					<option value = 3>3</option>
					<option value = 4>4</option>
					<option value = 5>5</option>
					<option value = 6>6</option>
					<option value = 7>7</option>
					<option value = 8>8</option>
					
					<option value = ${value1 } selected = "selected"> ${value1 }</option>
				</select>				
				
				
			
				청소년 
				<select class ="selection" name = "type2" onchange="selectNum();">					
					<option value = 0>0</option>
					<option value = 1>1</option>
					<option value = 2>2</option>
					<option value = 3>3</option>
					<option value = 4>4</option>
					<option value = 5>5</option>
					<option value = 6>6</option>
					<option value = 7>7</option>
					<option value = 8>8</option>
					<option value = ${value2 } selected = "selected"> ${value2 }</option>
				</select>				
			
				
			
				어린이 
				<select class ="selection" name = "type3" onchange="selectNum();">
					<option value = 0>0</option>
					<option value = 1>1</option>
					<option value = 2>2</option>
					<option value = 3>3</option>
					<option value = 4>4</option>
					<option value = 5>5</option>
					<option value = 6>6</option>
					<option value = 7>7</option> 
					<option value = 8>8</option>
					<option value = ${value3 } selected = "selected"> ${value3 }</option>
				</select>				
		
				
			
				우대 
				<select class ="selection"  name = "type4" onchange="selectNum();">
					<option value = 0>0</option>
					<option value = 1>1</option>
					<option value = 2>2</option>
					<option value = 3>3</option>
					<option value = 4>4</option>
					<option value = 5>5</option>
					<option value = 6>6</option>
					<option value = 7>7</option>
					<option value = 8>8</option>
					<option value = ${value4 } selected = "selected"> ${value4 }</option>
				</select>				
			

<%-- 조조 			<c:when test=""></c:when>	 --%> 
<!-- 				조조 성인  -->
				
<!-- 				조조 청소년  -->
<!-- 	
<!-- 				우대 -->
<!-- 	
				

<%-- 심야			<c:when test=""></c:when>	 --%>

<!-- 				심야성인  -->
			
<!-- 				심야청소년  -->
		
<!-- 				어린이  -->
				
<!-- 				우대 -->
					
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<span style="text-align: right; font-size: 9pt" >인원 선택은 최대 8명까지 가능합니다.</span>
			</td>
			
			<td rowspan="2" style="background-color: #555555 " width="220">
				
				<table border="0" width="220"  cellpadding="0" cellspacing="0">
					<tr height="250" >
					<td style="background-color: #555555 ">
					<img alt="IMG" src="" width="220" height="235"> <!-- 영화정보 이미지 불러오기 -->					
					</td>
					</tr>
					<tr height="50" >
						<td style="background-color: #555555 ">
							
						</td>
					</tr>
					
					<tr >
					<td style="background-color: #555555 ">
						<ul style="background-color: #555555 ">
							<li style="background-color: #555555 "></li>
							<li style="background-color: #555555 "></li>
							<c:if test="${!empty Message }">
							<li style="background-color: #555555 ">${Message }</li>
							</c:if>
						</ul>
					</td> <!-- 영화 상세정보 -->
					</tr>
					<tr height="60">
						<td style="background-color: #555555 "></td>
					</tr>
					<tr height="50" >
						<td style="background-color: #555555 ; text-align: right;" >
							<c:if test="${!empty priceMessage }">
								<span style="color : white ;background-color: #555555 ; font-size: 14pt; "> ${priceMessage } 원</span>
							</c:if>
						</td> <!-- 결제금액 정보 -->
					</tr>
				
				
				</table>
			
			</td>
		</tr>	
		
		<tr>
			<td>
				<table border="1"  style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;" >
					<tr height="50">
						<td width="600">
						<img alt="" src="<%=cp %>/booking/image/screen.PNG">
						</td> 
						
						<td rowspan="3">
							<img alt="" src="<%=cp %>/booking/image/infoSeatPic.PNG" width="" height=""> <!-- 좌석안내 이미지 -->
						</td>
					</tr>
					<tr height="150">
						<td>
						
							<c:set var = "i" value ="1"></c:set>
							<c:set var = "k" value ="1"></c:set>
								<div align="center">
								<table border="0" cellpadding="0" cellspacing="0">
									<c:forEach var = "j" begin = "1" end = "36" step = "1">
										<c:if test="${i % 9 == 1 }">
											<tr >
										</c:if>
											<td align="center" width="77">

												<c:if test="${k==1 }">
													<span style="font-weight: bold;">A&nbsp;</span>
												</c:if>
												<c:if test="${k==11 }">
													<span style="font-weight: bold;">B&nbsp;</span>
												</c:if>
												<c:if test="${k==20 }">
													<span style="font-weight: bold;">C&nbsp;</span>
												</c:if>
												<c:if test="${k==29}">
													<span style="font-weight: bold;">D&nbsp;</span>
												</c:if>
												<c:if test="${j>=1 && i <10}">
<%-- 													<c:if test=""> --%>
													<img alt="" src="<%=cp%>/booking/image/normalSeat.PNG">
<%-- 													</c:if> --%>
												
												${j }
												</c:if>
												<c:if test="${j>=10 && j < 19}">
													<img alt="" src="<%=cp%>/booking/image/normalSeat.PNG">
												${j -9}												
												</c:if>
												<c:if test="${j>=19 && i <28}">
													<img alt="" src="<%=cp%>/booking/image/noSeat.PNG">
												${j -18}
												</c:if>
												<c:if test="${j>=28 && i <=36}">
													<img alt="" src="<%=cp%>/booking/image/noSeat.PNG">
												${j -27}
												</c:if>
											</td>
										<c:if test="${i % 9 == 0 }">
											</tr>
										</c:if>
									<c:set var = "i" value ="${i+1 }"></c:set>
									<c:set var = "k" value ="${i+1 }"></c:set>
									</c:forEach>
								</table>
								</div>
						</td>
					</tr>
					<tr height="150">
						<td>
						
							<c:set var = "i" value ="1"></c:set>
							<c:set var = "k" value ="1"></c:set>
								<div align="center">
								<table border="0" cellpadding="0" cellspacing="0">
									<c:forEach var = "j" begin = "1" end = "36" step = "1">
										<c:if test="${i % 9 == 1 }">
											<tr >
										</c:if>
											<td align="center" width="77" style="font-size: 13pt;">

												<c:if test="${k==1 }">
													<span style="font-weight: bold;">A&nbsp;</span>
												</c:if>
												<c:if test="${k==11 }">
													<span style="font-weight: bold;">B&nbsp;</span>
												</c:if>
												<c:if test="${k==20 }">
													<span style="font-weight: bold;">C&nbsp;</span>
												</c:if>
												<c:if test="${k==29}">
													<span style="font-weight: bold;">D&nbsp;</span>
												</c:if>
												<input type="checkbox" value = "i" name = "seatCheckBox"/>
												<c:if test="${j>=1 && i <10}">
												${j }
												</c:if>
												<c:if test="${j>=10 && j < 19}">
												${j -9}												
												</c:if>
												<c:if test="${j>=19 && i <28}">
												${j -18}
												</c:if>
												<c:if test="${j>=28 && i <=36}">
												${j -27}
												</c:if>
												
											</td>
										<c:if test="${i % 9 == 0 }">
											</tr>
										</c:if>
									<c:set var = "i" value ="${i+1 }"></c:set>
									<c:set var = "k" value ="${i+1 }"></c:set>
									</c:forEach>
								</table>
								</div>
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
				<img src="<%=cp %>/booking/image/reChoice.PNG" width="100" height="35" onclick="javascript:location.href='<%=cp %>/Booking/booking.do'"/>			
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
						<input type="button" value = "이전" onclick="" style=" font-size :13pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #F9F9F9 ; color : #747474 ;border: 0"/>
					</td>	
					<td style= "background-color:#555555; width: 20px;" > </td>
					<td>					
						<input type="button" value = "다음" onclick="javascript:location.href='<%=cp %>'" style=" font-size :13pt ; font-weight :bold;  width: 95px; height: 40px; background-color: #513396; color: #ffffff; border: 0"/>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	</form>
	</div>

</body>
</html>