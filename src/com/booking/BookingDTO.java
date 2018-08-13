package com.booking;

public class BookingDTO {

	private String userId; // 사용자 Id ( EX. luckysong7 )
	private String theater; // 영화관 ( EX. 영통 메가박스 )
	private String title;  // 영화 제목 ( EX. 미션임파서블 )
	private String date; // 상영날짜 ( EX. 14일 )
	private String time; // 상영시간 ( EX. 11:10 ~ 12:44 )
	
	private int normalNum; // 일반 상영인원수
	private int teenNum; // 청소년 상영인원수
	private int childNum; // 어린이 상영인원수
	private int oldNum; // 우대 상영인원수
	private int ealryNormalNum; // 조조일반 상영인원수 
	private int ealryChildNum; // 조조청소년 상영인원수 
	private int ealryOldNum; // 조조우대 상영인원수
	
	private int seatNum; // 좌석번호
	
	
	
	
	
}
