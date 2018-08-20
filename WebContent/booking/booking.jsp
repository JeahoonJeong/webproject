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

	// 영화 선택해서 다음 좌석선택으로 넘어가기
	function goNextPage(screen_id){
		var f= document.bookingForm;
		
		f.action ="<%=cp%>/Booking/seatSelect.do?screen_id="+screen_id ;
		f.submit();
		
	}
	
	
	// 달력 팝업
	function showCalendar() {
		var date;
		var f = document.bookingForm;
		
		window.open("<%=cp%>/Booking/calendar.do","달력",
				"location = no, menubar = no, directories=no,left=580, top=150, width=350, height=350, toolbar = no, enubar=no, status=no, scrollbars=no, resizable=no, status = no");
	}
	
	// 영화관 선택목록 팝업
// 	function showTheaterList(){
		
// 		window.name="main";
		
// 		var f = document.bookingForm;
// 		windowObj = window.open("theaterSelect.do","영화관 목록",
// 				"location = no, menubar = no, directories=no, left=700, top=300, width=600, height=600, toolbar = no, enubar=no, status=no, scrollbars=auto, resizable=no, status = no");
// 	}
	
	// 영화관 선택(Radio 버튼)
	function selectTheater(){
		
		var f = document.bookingForm;
		
		var theaterRb = document.getElementsByName("theater");
		var theaterId ; 
		
		for(var j = 0 ; j < theaterRb.length ; j++){
			if(theaterRb[j].checked == true){
				theaterId = theaterRb[j].value;
			}
		}
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate };
		hour = ${selectedHour };
		//
		movieId = ${selectedMovieId };
		
		
		
		f.action= "<%=cp %>/Booking/booking.do?selectedMoviedId=" + movieId 
		+ "&nowHour=" + changedTime + "&nowDay=" +changedDate
		+ "&selectedDate="+date+"&selectedHour="+hour+"&theaterId="+theaterId;
		f.submit();
		
	}
	
	
	// 영화 선택 
	function selectMovie(){
		var f = document.bookingForm;
		
		var changedDate = ${day };
		var changedTime = ${hour };
		var date = ${selectedDate };
		var hour = ${selectedHour };
		//
		movieId = ${selectedMovieId };
		theaterId = ${theaterId };
		
		f.action = "<%=cp%>/Booking/movieSelect.do?selectedMoviedId=" + movieId +"&nowHour="+changedTime+"&nowDay="+changedDate
				+"&selectedDate="+date+"&selectedHour="+hour+"&theaterId="+theaterId;
		f.submit();
		
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
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectDate1(){ 
		var f = document.bookingForm;
		
		var date = f.dateButton1.value; // 선택된 날짜 
	
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectDate2(){
		var f = document.bookingForm;
		
		var date = f.dateButton2.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectDate3(){
		var f = document.bookingForm;
		
		date = f.dateButton3.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectDate4(){
		var f = document.bookingForm;
		
		date = f.dateButton4.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectDate5(){
		var f = document.bookingForm;
		
		date = f.dateButton5.value; // 선택된 날짜 
		changedDate = ${day };
		changedTime = ${hour };
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date;
		f.submit();		
	}
	
	function selectTime1(){
		var f = document.bookingForm;
		
		var hour = f.timeButton1.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	function selectTime2(){
		var f = document.bookingForm;
		
		var hour = f.timeButton2.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime3(){
		var f = document.bookingForm;
		
		var hour = f.timeButton3.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime4(){
		var f = document.bookingForm;
		
		var hour  = f.timeButton4.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime5(){
		var f = document.bookingForm;
		
		var hour  = f.timeButton5.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime6(){
		var f = document.bookingForm;
		
		var hour = f.timeButton6.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime7(){
		var f = document.bookingForm;
		
		var hour = f.timeButton7.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime8(){
		var f = document.bookingForm;
		
		var hour = f.timeButton8.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime9(){
		var f = document.bookingForm;
		
		var hour = f.timeButton9.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
		f.submit();		
	}
	
	
	function selectTime10(){
		var f = document.bookingForm;
		
		var hour = f.timeButton10.value-1 ; // 선택된 시간
		
		changedDate = ${day };
		changedTime = ${hour };
		date = ${selectedDate }; // 선택된 날짜 받아오기 
		
		f.action = "<%=cp%>/Booking/booking.do?nowHour="+changedTime+"&nowDay="+changedDate+"&selectedDate="+date+"&selectedHour="+hour;
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
					<div align="center" style="padding-top: 20px; ">
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px;" type="button" value="◀" class = "btn2" onclick="changeDay1();"/> <!-- 현재 날짜 --> 
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day}" class = "btn1" onclick="selectDate1();" name = "dateButton1"/> <!-- 현재 날짜 --> 
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+1 }" class = "btn1" onclick="selectDate2();" name = "dateButton2"/> <!-- 현재 날짜 +1 -->
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+2 }" class = "btn1" onclick="selectDate3();" name = "dateButton3"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+3 }" class = "btn1" onclick="selectDate4();" name = "dateButton4"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; "type="button" value="${day+4 }" class = "btn1" onclick="selectDate5();" name = "dateButton5"/>
					<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px; "type="button" value="▶" class = "btn2" onclick="changeDay2();"/> <!-- 현재 날짜 --> 
					</div>
				</td>

				<td width="470" ><span class="text" style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">시간</span>
				<br/><br/>
				<div align="center" style="padding-top: 16px;">
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px;" type="button" value="◀" class = "btn2" onclick="changeTime1();" /> <!-- 현재 시간 --> 
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+1 }" class ="btn3" onclick="selectTime1()" name = "timeButton1"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+2 }" class ="btn3" onclick="selectTime2();" name = "timeButton2"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+3 }" class ="btn3" onclick="selectTime3();" name = "timeButton3"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+4 }" class ="btn3" onclick="selectTime4();" name = "timeButton4"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+5 }" class ="btn3" onclick="selectTime5();" name = "timeButton5"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+6 }" class ="btn3" onclick="selectTime6();" name = "timeButton6" />
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+7 }" class ="btn3" onclick="selectTime7();" name = "timeButton7"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+8 }" class ="btn3" onclick="selectTime8();" name = "timeButton8"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+9 }" class ="btn3" onclick="selectTime9();" name = "timeButton9"/>
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; " type="button" value ="${hour+10 }" class ="btn3" onclick="selectTime10();" name = "timeButton10" />
				<input style="border-color: #CFCFCF; border-width: 0.5px; border-style: solid; height: 23px; " type="button" value="▶" class = "btn2" onclick="changeTime2();"/> <!-- 현재 날짜 -->
				</div>
				
				</td>
			</tr>
			<tr height="230">
				<td width="430"><span class="text" style="margin-left: 20px; margin-top: 10px; margin-bottom: 20px;">극장</span>
				<br/><br/>
				
				
				<table border="1" class ="table" align="center" style="border-color: #CFCFCF; border-width: 1px; margin-top: 20px" cellpadding="0" cellspacing="0" >
						
					
<!-- 					<tr height="60px"> -->
<!-- 						<td class="sample1" width="160px" style="text-align: center;"> -->
						
<!-- 					<a onclick="showTheaterList();" id ="theater2" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a> --> 
							
						
<!-- 						</td> -->
						
<!-- 						<td width="10px" style="border: 0"></td> -->
						
<!-- 						<td class="sample1" width="160px" style="text-align: center;"> -->
						
<!-- 						<a onclick="showTheaterList();" id ="theater2" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a> -->
						
<!-- 						</td> -->
							
<!-- 					</tr> -->
					
<!-- 					<tr height="10px"></tr> -->
					
<!-- 					<tr height="60px"> -->
<!-- 						<td class="sample1" width="160px" style="text-align: center;"> -->
						
<!-- 						<a onclick="showTheaterList();" id ="theater3" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a> -->
						
<!-- 						</td> -->
						
<!-- 						<td width="10px;" style="border: 0"></td> -->
						
<!-- 						<td class="sample1" width="160px" style="text-align: center;"> -->
						
<!-- 						<a onclick="showTheaterList();" id ="theater4" style="font-size: 30pt; color: #198691 ; text-decoration:none;">+</a> -->
						
<!-- 						</td> -->
<!-- 					</tr> -->
						<c:forEach var="dto" items="${lists }">
							<tr height="40px">
								<td class="sample1" width="320px" style="text-align: center;">
									${dto.city } | ${dto.district } 영화관 <input type="radio" id = "ff" value="${dto.theater_id } " name = "theater"  
									onclick = "selectTheater();"
									/>
									<br/>
								</td>
							</tr>
							<tr height="10px">
								<td style="border: 0"></td>
							</tr>
						</c:forEach>
				
				</table>
				
				</td>
				
				<td rowspan="2" width="450" height="460" style="background-color: #ffffff; " >
				<c:if test="${empty lists2 }">
						<img alt="" src="<%=cp %>/booking/image/noMovie.PNG" width="440" height="460">
				</c:if>	
				<c:if test="${! empty lists2}">
					<div style="height: 460; overflow: auto" >
					<table style="display: block;" height="460" border="0" class ="scrooltbody" align="center" cellpadding="0" cellspacing="0">
					<tbody>
						<c:forEach var ="dto2" items="${lists2 }" >
						
							<tr style="border-bottom: 1">		
								
								
								<td width="130" style="text-align: center;">
									<span style="font-size: 15pt; font-weight: bold;"> ${dto2.start_time }</span> ~ ${dto2.end_time }
									
									<span style="font-size : 25pt;">|</span>
											</td>										
								<td width="290" style="text-align: left;">
								
									<input type="hidden" name = "screen_id" value = "${dto2.screen_id}">
									<input type="hidden" name = "age_limit" value = "${dto2.age_limit}">
									<input type="hidden" name = "movie_name" value = "${dto2.movie_name}">
									<input type="hidden" name = "screen_num" value = "${dto2.screen_num}">
									<input type="hidden" name = "start_time" value = "${dto2.start_time}">
									<input type="hidden" name = "district" value = "${dto2.district}">
									
									<input type="hidden" name ="type" value ="${dto2.type }">
									
									&nbsp;&nbsp;<a onclick="goNextPage(${dto2.screen_id});"> 
									<c:if test="${dto2.age_limit=='all' }"><img width="20" height="20" src="${imagePath2 }/ageallbig.png"></c:if>
									<c:if test="${dto2.age_limit=='12' }"><img width="20" height="20" src="${imagePath2 }/age12big.png"></c:if>
									<c:if test="${dto2.age_limit=='15' }"><img width="20" height="20" src="${imagePath2 }/age15big.png"></c:if>
									<c:if test="${dto2.age_limit=='18' }"><img width="20" height="20" src="${imagePath2 }/age18big.png"></c:if>
									${dto2.movie_name }</a>
								<br/>
									&nbsp;&nbsp;<span style="font-size: 9pt;">${dto2.type }</span>
								</td>										
								<td>
								<span style="font-size : 25pt;">|</span>
								</td>
								<td width="50" style="text-align: center;">
								
									${dto2.district }
								<br/>
									${dto2.screen_num }관
								<br/>
									${dto2.seatNumber - dto2.seatedSeat} / ${dto2.seatNumber }
								</td>										
							
							</tr>
							<tr>
						
								<td colspan="4">
									<hr>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
					</div>
				</c:if>
				</td>
			</tr>
			<tr height="230" >
				<td><span class="text"  style="margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">영화</span>
				<br/><br/>
					<table style="padding-top :20px; border-color: #CFCFCF; border-width: 1px;  "align="center" border="2" width="350px;" cellpadding="0" cellspacing="0">
					<tr height="80px;">
						<td align="center" style="font-size: 25px; color: black; font-weight: bold; margin-bottom: 10px;">모든영화</td>
					</tr>
					<tr>
						<td height="60px;" align="center">
						<a style = "text-decoration:none; color: #53A4AD ; font-weight: bold; font-family: sans-serif;" onclick = "selectMovie();">영화선택 ▷</a>
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

