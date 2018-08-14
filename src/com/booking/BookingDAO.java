package com.booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

	private Connection conn;
	
	// DI (����������)
	public BookingDAO(Connection conn) {
		this.conn = conn;
		
	}
	
	// 1. ��ȭ�� ���� �������� (Select)
	public List<TheaterDTO> getReadData(){
		List<TheaterDTO> lists_theater = new ArrayList<TheaterDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ;
		
		try {
			sql = "select theater_id ,city, district from theater "; // �󿵰� ���� �������� sql��
					
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
	
	
	// 2. ��ȭ�� ��¥ �ð��� ���� ���� �������� (Select)
//	public List<E> getMovieData(String movieName,String date){
//		
//		
//		
//		
//	}
	
	// 3. ��ȭ�� ���ŵ� �¼� �ο����� �������� (Select)
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
	
	// 4. �¼� ���� (Insert)
	
	// 6. ��ȭ�� ���ŵ� �¼� ���� �������� (Select)
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
