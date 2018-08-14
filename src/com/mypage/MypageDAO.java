package com.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MypageDAO {
	
	private Connection conn;
	
	public MypageDAO(Connection conn){
		
		this.conn = conn;
	}
	
	//예매정보 불러오기--수정중입니다
	/*
	public List<MyBookingDTO> getBookingList(String user_id){
		
		List<MyBookingDTO> lists = new ArrayList<MyBookingDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select rownum rnum, data.* from (select * from booked_seats where user_id=? order by reservation_date desc ) data";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MyBookingDTO dto = new MyBookingDTO();
				
				dto.setBookded_id(rs.getString("booked_id"));
				dto.setScreen_id(rs.getString("screen_id"));
				dto.setRow_num(rs.getString("row_num"));
				dto.setSeat_num(rs.getInt("seat_num"));
				dto.setReservation_date(rs.getString("reservation_date"));
				dto.setCancel_date(rs.getString("cancel_date"));
				
				lists.add(dto);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	*/
}
