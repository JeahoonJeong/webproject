package com.timetable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.imageTest.TimetableDTO;


public class TimetableDAO {
	
	private Connection conn;
	
	public TimetableDAO(Connection conn){
		this.conn = conn;
	}		

	

	//영화_중복제거
	public List<TimetableDTO> getMovie(){
		List<TimetableDTO> lists = new ArrayList<TimetableDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			//city, district, movie_name, screen_num, start_time, end_time, seatedseat, seatnumber, type, age_limt, movie_id	
			sql ="select movie_id, movie_name, age_limt from timetable group by movie_name,movie_id";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			while(rs.next()){
				TimetableDTO dto = new TimetableDTO();
				
				
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setAge_limit(rs.getString("age_limt"));
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
	}
	
	//특정영화의 데이터 가져오기
	public List<TimetableDTO> getList(String movie_id){
		List<TimetableDTO> lists = new ArrayList<TimetableDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		try {
			//city, district, movie_name, screen_num, start_time, end_time, seatedseat, seatnumber, type, age_limt, movie_id	
			//sql ="select city, district, movie_name, screen_num, start_time,, end_time, seatedseat, seatnumber, type, age_limit, movie_id from timetable where movie_id=?";
			sql ="select city, district, movie_name, screen_num, to_char(start_time,'hh24:mi') start_time, to_char(end_time,'hh24:mi') end_time, ";
			sql+="seatedseat, seatnumber, type, age_limit, movie_id from timetable where movie_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();	
			
			while(rs.next()){
				TimetableDTO dto = new TimetableDTO();
				
				dto.setCity(rs.getString("city"));
				dto.setDistrict(rs.getString("district"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setScreen_num(rs.getString("screen_num"));
				dto.setStart_time(rs.getString("start_time"));
				dto.setEnd_time(rs.getString("end_time"));
				dto.setSeatedseat(rs.getInt("seatedseat"));
				dto.setSeatnumber(rs.getInt("seatnumber"));
				dto.setType(rs.getString("type"));
				dto.setAge_limit(rs.getString("age_limit"));				
				
				
				lists.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return lists;
		
		
	}
	
/*	//데이터 전체 갯수
	public int getDataCount(){
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select count(distinct movieName) from timetable";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dataCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println();
		}
		return dataCount;
	}*/
	
	
	
	

}
