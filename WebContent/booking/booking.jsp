<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
	



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
	var windowObj; // 자식창 window 객체를 저장할 변수

	// 달력 팝업
	function showCalendar() {
		var date;
		var f = document.bookingForm;
		
		window.open("calendar.do","달력",
				"location = no, menubar = no, directories=no,left=580, top=150, width=350, height=350, toolbar = no, enubar=no, status=no, scrollbars=no, resizable=no, status = no");
	}
	
	// 영화관 선택목록 팝업
	function showTheaterList(){
		var f = document.bookingForm;
		windowObj = window.open("theaterSelect.do","영화관 목록",
				"location = no, menubar = no, directories=no, left=700, top=300, width=600, height=600, toolbar = no, enubar=no, status=no, scrollbars=auto, resizable=no, status = no");
	}
	
	// 날짜 앞으로 이동
	function changeDay1(){
		var f = document.bookingForm;
		changedDate = ${day - 1};
		changedTime = ${hour -1};
		var currentDate =  ${nowDay-1 };
	
		if(changedDate ==currentDate){
			return; // 현재 날짜보다 적으면 그냥 리턴
		}
		f.action = "<%=cp%>/Booking/booking.do?nowDay="+changedDate+"&nowHour="+changedTime;
		f.submit();
	}
	// 날짜 뒤로 이동
	function changeDay2(){
		var f = document.bookingForm;
	    changedDate = ${day + 1};
	    changedTime = ${hour };
		var endDate = ${nowDay +3}; 
		// 7일 후까지만 볼수 있음
		if(changedDate == endDate){
			return;
			
		}
		f.action = "<%=cp%>/Booking/booking.do?nowDay="+changedDate+"&nowHour="+changedTime;
		f.submit();
		
	}
	
	// 시간 앞으로 이동
	function changeTime1() {
		var f = document.bookingForm;
		changedDate = ${day };
		changedTime = ${hour -1}; // 시작시간 
		if(changedTime == 4){ // 오전 6시 부터
			return; 
		}
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate;
		f.submit();
		
	}
	// 시간 뒤로 이동 
	function changeTime2(){
		var f = document.bookingForm;
		changedDate = ${day };
		changedTime = ${hour +1};
		var changedTime2 = ${hour+10}; // 마지막 시간
		if(changedTime2 == 26){ // 새벽2시 까지만
			return;
		}
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate;
		f.submit();
	}
	
	function selectDate1(){
		var f = document.bookingForm;
		
		date = f.dateButton1.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	function selectDate1(){
		var f = document.bookingForm;
		
		date = f.dateButton1.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	function selectDate2(){
		var f = document.bookingForm;
		
		date = f.dateButton2.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	function selectDate3(){
		var f = document.bookingForm;
		
		date = f.dateButton3.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	function selectDate4(){
		var f = document.bookingForm;
		
		date = f.dateButton4.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	function selectDate5(){
		var f = document.bookingForm;
		
		date = f.dateButton5.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&seletedDate="+date;
		f.submit();		
	}
	
	
	
</script>



</head>
<body>

	<div align="center">
		<form name ="bookingForm" method="post">
		<table class="tb1" border="1" cellpadding="0" cellspacing="0" 
			style="border-color: #CFCFCF; border-width: 1px; " >
			<tr height="100" >
				<td width="430" >
					<div>
						<span class="text" style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">날짜</span> 
						<!-- 달력 팝업창으로 보여주는 이미지  -->
						<img align="right" src="<%=cp %>/booking/image/calImg.PNG"
						onclick="showCalendar()" style="width: 30px; height: 30px; margin-top:5px; margin-right: 10px; margin-bottom: 10px;">
					</div>
					<br/>
					<div align="center" >
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px;" type="button" value="◀" class = "btn2" onclick="changeDay1();"/> <!-- 현재 날짜 --> 
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day}일" class = "btn1" onclick="selectDate1();" name = "dateButton1"/> <!-- 현재 날짜 --> 
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+1 }일" class = "btn1" onclick="selectDate2();" name = "dateButton2"/> <!-- 현재 날짜 +1 -->
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+2 }일" class = "btn1" onclick="selectDate3();" name = "dateButton3"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+3 }일" class = "btn1" onclick="selectDate4();" name = "dateButton4"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+4 }일" class = "btn1" onclick="selectDate5();" name = "dateButton5"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px; "type="button" value="▶" class = "btn2" onclick="changeDay2();"/> <!-- 현재 날짜 --> 
					</div>
				</td>

				<td width="470" ><span class="text" style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">시간</span>
				<br/><br/>
				<div align="center">
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px;" type="button" value="◀" class = "btn2" onclick="changeTime1();" /> <!-- 현재 시간 --> 
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+1 }" class ="btn3" onclick="selectTime2()" name = "timeButton1"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+2 }" class ="btn3" onclick="selectTime2();" name = "timeButton2"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+3 }" class ="btn3" onclick="selectTime2();" name = "timeButton3"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+4 }" class ="btn3" onclick="selectTime2();" name = "timeButton4"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+5 }" class ="btn3" onclick="selectTime2();" name = "timeButton5"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+6 }" class ="btn3" onclick="selectTime2();" name = "timeButton6" />
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+7 }" class ="btn3" onclick="selectTime2();" name = "timeButton7"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+8 }" class ="btn3" onclick="selectTime2();" name = "timeButton8"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+9 }" class ="btn3" onclick="selectTime2();" name = "timeButton9"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+10 }" class ="btn3" onclick="selectTime2();" name = "timeButton10" />
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px; " type="button" value="▶" class = "btn2" onclick="changeTime2();"/> <!-- 현재 날짜 -->
				</div>
				
				</td>
			</tr>
			<tr height="230">
				<td width="430"><span class="text" style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">극장</span>
				<br/><br/>
				
				<table border="0" class ="table" align="center" style="border-color: #CFCFCF; border-width: 1px; " cellpadding="0" cellspacing="0">
					<tr height="60px">
<%-- 						<c:if test=""></c:if> --%>
						<td class="sample1" width="160px" style="text-align: center;" ><a onclick="showTheaterList();" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a></td>
						<td width="10px" style="border: 0"></td>
						<td class="sample1" width="160px" style="text-align: center;"><a onclick="showTheaterList();" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a></td>
					</tr>
					<tr height="10px"></tr>
					<tr height="60px">
						<td class="sample1" width="160px" style="text-align: center;"><a onclick="showTheaterList();" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a></td>
						<td width="10px;" style="border: 0"></td>
						<td class="sample1" width="160px" style="text-align: center;"><a onclick="showTheaterList();" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a></td>
					</tr>
				</table>
				
				</td>
				
				<td rowspan="2" width="450" style="background-color: #ffffff" >
<%-- <c:if test=""> --%>
						<img alt="" src="<%=cp %>/booking/image/noMovie.PNG" width="440" height="460">
<%-- 				</c:if>	 --%>
					
					<table>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height="230" >
				<td><span class="text"  style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">영화</span>
				<br/><br/>
					<table style="border-color: #CFCFCF; border-width: 1px;  "align="center" border="2" width="350px;" cellpadding="0" cellspacing="0">
					<tr height="80px;">
						<td align="center" style="font-size: 25px; color: black; font-weight: bold; margin-bottom: 10px;">모든영화</td>
					</tr>
					<tr>
						<td height="60px;" align="center">
						<a style = "text-decoration:none; color: #53A4AD ; font-weight: bold; font-family: sans-serif;" href = "javascript:location.href='<%=cp%>'">영화선택 ▷</a>
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

