package com.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

	private Connection conn;
	
	// DI (의존성주입)
	public BookingDAO(Connection conn) {
		this.conn = conn;
		
	}
	
	// 1. 영화관 정보 가져오기 (Select)
	public List<TheaterDTO> getReadData(){
		List<TheaterDTO> lists_theater = new ArrayList<TheaterDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ;
		
		try {
			sql = "select theater_id ,city, district from theater "; // 상영관 정보 가져오는 sql문
					
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				TheaterDTO dto = new TheaterDTO();
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setCity(rs.getString("city"));
				dto.setDistrict(rs.getString("district"));
				
				lists_theater.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists_theater;
		
	}
	
	
	// 2. 영화와 날짜 시간에 따른 정보 가져오기 (Select) .v2
//	 public List<MovieDTO> getMovieData(String movieName,String date){
//		List<MovieDTO> lists2 = new ArrayList<MovieDTO>();
//		
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql ;
//		
//		try {
//			sql = "SELECT to_char(start_time,'HH24:MI'), to_char(end_time,'HH24:MI'), "
//					+ "age_limit , movie_name, type , city, district"
//					+ "FROM TIMETABLE;"; // 상영관 정보 가져오는 sql문
//					
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, );
//			
//			rs = pstmt.executeQuery();
//			
//			
//			
//			while(rs.next()){
//				MovieDTO dto = new MovieDTO();
//				
//				
//				
//				
//				
//				lists2.add(dto);
//			}
//			
//			rs.close();
//			pstmt.close();
//			
//		} catch (Exception e) {
//			System.out.println(e.toString());
//		}
//		
//		
//		return lists2;	
//		
//	}
	// 2. 영화와 날짜 시간에 따른 정보 가져오기 (Select) .v1
	 public List<MovieDTO> getMovieData(){
			List<MovieDTO> lists2 = new ArrayList<MovieDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ;
			
			try {
				sql = "SELECT to_char(start_time,'HH24:MI') as start_time, to_char(end_time,'HH24:MI') as end_time, "
						+ "age_limit, movie_name, type, district, screen_num, seatedseat, seatnumber "
						+ "FROM TIMETABLE"; // 상영관 정보 가져오는 sql문
						
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					MovieDTO dto = new MovieDTO();
					
					dto.setStart_time(rs.getString("start_time"));
					dto.setEnd_time(rs.getString("end_time"));
					dto.setAge_limit(rs.getString("age_limit"));
					dto.setMovie_name(rs.getString("movie_name"));
					dto.setType(rs.getString("type"));
					dto.setDistrict(rs.getString("district"));
					dto.setScreen_num(rs.getString("screen_num"));
					dto.setSeatedSeat(rs.getString("seatedseat"));
					dto.setSeatNumber(rs.getString("seatnumber"));
					
					lists2.add(dto);
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return lists2;

		}
	
	// 3. 영화의 예매된 좌석 인원정보 가져오기 (Select)
//	public List<E> getSelectedSeatData(){
//		List<E> lists = new ArrayList<E>();
//		
//		PreparedStatement pstmt = null;
//		
//		ResultSet rs = null;
//		
//		String sql;
//		
//		try {
//			sql = "select  from ";
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()){
//				dataCount = rs.getInt(1);
//				
//			}
//			rs.close();
//			pstmt.close();
//		} catch (Exception e) {
//			e.toString();
//		}
//		
//		return ;	
//	}
//	
	
	// 4. 좌석 선택 (Insert)
	 public int insertData(String userId, String movie_id, String screen_id){
		 int result = 0 ; 
		 
		 
		 
		 
		 
		 
		 return result;
		 
	 }
	

	
}
