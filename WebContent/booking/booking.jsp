<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
	

	Calendar cal = Calendar.getInstance();

	// 오늘날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 현재 요일
	int nowHour = cal.get(Calendar.HOUR_OF_DAY); // 현재 시간 

	// 클라이언트에서 넘어온 데이터
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	//표시할 달력의 년과 월
		int year = nowYear;
		int month = nowMonth;

		if (strYear != null) {
			year = Integer.parseInt(strYear); // 클라이언트가 선택한 연도
		}

		if (strMonth != null) {
			month = Integer.parseInt(strMonth); // 클라이언트가 선택한 월
		}

	

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 예매</title>

<link rel="stylesheet" href="<%=cp%>/booking/css/bookingstyle.css"
	type="text/css" />
<script type="text/javascript" src="<%=cp%>/booking/js/util.js"></script>
<script type="text/javascript">
	function showCalendar() {
		var f = document.bookingForm;
		
		window.open("calendar.jsp","달력",
				"left=610, top=10, width=350, height=350, toolbar = no, enubar=no, status=no, scrollbars=no, resizable=no",
				"status = yes");
	}
</script>



</head>
<body>

	<div align="center">
		<form name ="bookingForm" method="post">
		<table border="1" >
			<tr height="100" >
				<td width="420" class ="padding">
					<div>
						<span class="text" style="margin-left: 20px; margin-top: 10px;">날짜</span> 
						<!-- 달력 팝업창으로 보여주는 이미지  -->
						<img align="right" src="./image/calImg.PNG"
						onclick="showCalendar()" style="width: 30px; height: 30px; margin-right: 10px">
					</div>
					<br/>
					<div align="center" >
					<input type="button" value="◀" class = "btn2" onclick=""/> <!-- 현재 날짜 --> 
					<input type="button" value="<%=nowDay%>일" class = "btn1"/> <!-- 현재 날짜 --> 
					<input type="button" value="<%=nowDay+1%>일" class = "btn1"/> <!-- 현재 날짜 +1 -->
					<input type="button" value="<%=nowDay+2%>일" class = "btn1"/>
					<input type="button" value="<%=nowDay+3%>일" class = "btn1"/>
					<input type="button" value="<%=nowDay+4%>일" class = "btn1"/>
					<input type="button" value="▶" class = "btn2" onclick=""/> <!-- 현재 날짜 --> 
					</div>
				</td>

				<td width="470" ><span class="text" style="margin-left: 20px; margin-top: 10px;">시간</span>
				<br/><br/>
				<div align="center">
				<input type="button" value="◀" class = "btn2" onclick=""/> <!-- 현재 시간 --> 
				<input type="button" value ="<%=nowHour +1%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +2%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +3%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +4%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +5%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +6%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +7%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +8%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +9%>" class ="btn3" onclick="" />
				<input type="button" value ="<%=nowHour +10%>" class ="btn3" onclick="" />
				<input type="button" value="▶" class = "btn2" onclick=""/> <!-- 현재 날짜 -->
				</div>
				
				</td>
			</tr>
			<tr height="230">
				<td width="420"><span class="text" style="margin-left: 20px; margin-top: 10px;">극장</span>
				<br/><br/>
				
				<table align="center" >
					<tr height="60px">
						<td width="160px" style="background-color: #ffffff"></td>
						<td width="10px"></td>
						<td width="160px" style="background-color: #ffffff"></td>
					</tr>
					<tr height="10px"></tr>
					<tr height="60px">
						<td width="160px" style="background-color: #ffffff"></td>
						<td width="10px;"></td>
						<td width="160px" style="background-color: #ffffff"></td>
					</tr>
				</table>
				
				</td>
				
				<td rowspan="2" width="450" style="background-color: #ffffff" >
<%-- 					<c:when test=""> --%>
						<img alt="" src="./image/noMovie.PNG" width="440" height="460">
					
<%-- 					</c:when> --%>
					
					<table>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</td>


			</tr>
			<tr height="230" width="420">
				<td><span class="text"  style="margin-left: 20px; margin-top: 10px;">영화</span>
				<br/><br/>
				<table align="center" border="2" width="350px;">
					<tr height="80px;">
						<td align="center" style="font-size: 25px; color: black; font-weight: bold; ">모든영화</td>
					</tr>
					<tr>
						<td height="60px;" align="center">
						<a style = "text-decoration:none; color: #53A4AD ; font-weight: bold; font-family: sans-serif;" href = "javascript:location.href='<%=cp%>'">영화선택▷</a>
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

