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
	
	
	// 2. ��ȭ�� ��¥ �ð��� ���� ���� �������� (Select) .v2
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
//					+ "FROM TIMETABLE;"; // �󿵰� ���� �������� sql��
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
	// 2. ��ȭ�� ��¥ �ð��� ���� ���� �������� (Select) .v1
	 public List<MovieDTO> getMovieData(){
			List<MovieDTO> lists2 = new ArrayList<MovieDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ;
			
			try {
				sql = "SELECT screen_id ,to_char(start_time,'HH24:MI') as start_time, to_char(end_time,'HH24:MI') as end_time, "
						+ "age_limit, movie_name, type, district, screen_num, seatedseat, seatnumber "
						+ "FROM TIMETABLE"; // �󿵰� ���� �������� sql��
						
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
					dto.setScreen_id(rs.getString("screen_id"));
					
					lists2.add(dto);
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return lists2;

		}
	
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
	 public int insertData(String userId, String movie_id, String screen_id){
		 int result = 0 ; 
		 
		 
		 
		 
		 
		 
		 return result;
		 
	 }
	 
	 
	 public List<BookingDTO> getSeatInfo(String screenId){
			List<BookingDTO> lists = new ArrayList<BookingDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ;
			
			try {
				
				sql = "select rnum, screen_id, row_num, seat_num, status from "
						+ " (select rownum rnum, data.* "
						+ " from (select screen_id, row_num, seat_num, status from seat "
						+ " where screen_id = 1 order by row_num,seat_num) data)";
						
				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, "1");
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					BookingDTO dto = new BookingDTO();
					dto.setRnum(rs.getString("rnum"));
					dto.setScreen_id(rs.getString("screen_id"));
					dto.setRow_num(rs.getString("row_num"));
					dto.setSeat_num(rs.getInt("seat_num"));
					dto.setStatus(rs.getInt("status"));
					
					lists.add(dto);
				}
				
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return lists;

		}
	 
	 public void insertBookedSeats(List<bookedSeatDTO> lists, int booked_id){
		 
		 PreparedStatement pstmt = null;
		 String sql;
		 
		 sql = "insert into booked_seats(screen_id, row_num, seat_num, booked_id, user_id"
					+ ", reservation_date, type, cancel_date) values(?,?,?,?,?,sysdate,?,null)";
		 
		 
		 try {
			 
			pstmt = conn.prepareStatement(sql);
			
			for(bookedSeatDTO dto : lists){
				pstmt.setString(1, dto.getScreen_id());
				pstmt.setString(2, dto.getRow_num());
				pstmt.setInt(3,dto.getSeat_num());
				pstmt.setInt(4,booked_id);
				pstmt.setString(5, dto.getUser_id());
				pstmt.setString(6,dto.getType());
				
				pstmt.addBatch();
			}
			
			pstmt.executeBatch();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
	 }
	 
	 
	 public int getBookedNum(){
			
			int maxNum = 0;
			
			PreparedStatement pstmt = null;
			String sql= "";
			ResultSet rs = null;
			
			try {
				sql = "select nvl(max(booked_id),0) from booked_seats";
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					
					maxNum = rs.getInt(1);
					
				}
				rs.close();
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return maxNum;
		}
	 
	

	
}
