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
	
	
	// 2. 영화와 날짜 시간에 따른 정보 가져오기 (Select)
//	public List<E> getMovieData(String movieName,String date){
//		
//		
//		
//		
//	}
	
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
	
	// 6. 영화의 예매된 좌석 개수 가져오기 (Select)
//	public int getSelectedSeatDataCount(){
//		int dataCount = 0 ; 
//		
//		PreparedStatement pstmt = null;
//		
//		ResultSet rs = null;
//		
//		String sql;
//		
//		try {
//			sql = "select nvl(count(*),0) from ";
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
//		return dataCount ;	
//	}
//	
	
}
