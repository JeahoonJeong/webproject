package com.booking;

public class BookingDTO {

	private String userId; // 사용자 Id ( EX. luckysong7 )
	private String theater_id; // 영화관 ( EX. 영통 메가박스 )
	private String screen_id; // 상영관 번호 ( EX. 3관)
	private String movie_id;  // 영화 제목 ( EX. 미션임파서블 )
	private String date; // 상영날짜 ( EX. 14일 )
	private String time; // 상영시간 ( EX. 11:10 ~ 12:44 )
	
	private int type ; // 성인 , 청소년, 어린이, 우대 구분  
	private int row_num; // 행 번호
	private int seat_num; // 열 번호
	
	
	
	
	
	
	
}
