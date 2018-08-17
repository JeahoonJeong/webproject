package com.theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TheaterDAO {
	
	private Connection conn;
	
	//의존성 주입
	public TheaterDAO(Connection conn){
		this.conn = conn;
	}
	 
	//모든데이터 가져오기
	public List<TheaterDTO> getlist(int theater_id, String start_time){
		
		List<TheaterDTO> lists = new ArrayList<TheaterDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql ="select * from timetable ";
			sql +="where theater_id like '?' and to_char(start_time, 'YYYY-MM-DD') = '?'";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, theater_id);
			pstmt.setString(2, start_time);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){

				TheaterDTO dto = new TheaterDTO();
				
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setTheater_id(rs.getString("theater_id"));
				dto.setScree_num(rs.getString("screen_id"));
				dto.setCity(rs.getString("city"));
				dto.setDistrict(rs.getString("district"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setScree_num(rs.getString("screen_num"));
				dto.setStart_time(rs.getString("start_time"));
				dto.setEnd_time(rs.getString("end_time"));
				dto.setSeatedSeat(rs.getInt("seatedSeat"));
				dto.setSeatNumber(rs.getInt("seatNumber"));
				dto.setType(rs.getString("type"));
				dto.setAge_limit(rs.getInt("age_limit"));
				
				lists.add(dto);
			}
			
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;

	}
	
	
	
}
