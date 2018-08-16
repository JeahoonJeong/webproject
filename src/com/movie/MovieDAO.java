package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBCPConn;

public class MovieDAO {
	
	private Connection conn;
	
	public MovieDAO(Connection conn){
		this.conn = conn;
	}
	
	
	//전체 데이터 갯수
	public int getDataCount(){
		
		int dataCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select nvl(count(*),0) from movie";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				dataCount = rs.getInt(1);
			
			rs.close();
			pstmt.close();
		
			
		} catch (Exception e) { 
			System.out.println(e.toString());
		}
		return dataCount;
		
	}
	
	public List<MovieDTO> getAllMV(int start, int end){//list.do 에 뿌릴 데이터를 가져옴
		
		List<MovieDTO> lst = new ArrayList<MovieDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			/*sql = "select * from (select rownum rnum, data.* from(select a.movie_id,movie_name,age_limit, rating, file_name ";
			sql+= "from movie a,(select rating, file_name, a.movie_id from ";
			sql+= "(select round(avg(rating)) rating, movie_id from rating group by movie_id) a, ";
			sql+= "(select file_name, movie_id from image_files where file_name like ('%Post%')) b where a.movie_id = b.movie_id) ";
			sql+= "b where a.movie_id=b.movie_id order by movie_id) data) where rnum>=? and rnum<=?";*/
			
			sql = "select rnum,movie_id,movie_name,age_limit,rating,file_name from movie_list where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MovieDTO dto = new MovieDTO();
				
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setAge_limit(rs.getString("age_limit"));
				dto.setRating(rs.getInt("rating"));
				dto.setFile_name(rs.getString("file_name"));
				
				lst.add(dto);	
			}
			
			
			rs.close();
			pstmt.close();	
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lst;
		
	}
	
	
	public MovieDTO getOneData(String movie_id){ //movie.do 에 뿌릴 해당 영화 데이터를 가져옴
		
		MovieDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select movie_id,movie_name,rating,release_date,type,director,actors,genre,showtimes,summary,count,";
			sql+= "age_limit,rating,file_name from movie a, (select rating, file_name, a.movie_id from ";
			sql+= "(select count(rating) count,avg(rating) rating,movie_id from rating group by movie_id having movie_id='?') a";
			sql+= ", (select * from image_files where file_name like ('%Post%')) b where a.movie_id = b.movie_id) b ";
			sql+= "where a.movie_id=b.movie_id";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movie_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dto = new MovieDTO();
				
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setRating(rs.getInt("rating"));
				dto.setRelease_date(rs.getString("release_date"));
				dto.setType(rs.getString("type"));
				dto.setDirector(rs.getString("director"));
				dto.setActors(rs.getString("actors"));
				dto.setGenre(rs.getString("genre"));
				dto.setShowtimes(rs.getString("showtimes"));
				dto.setSummary(rs.getString("summary"));
				dto.setAge_limit(rs.getString("age_limit"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setCount(rs.getString("count"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
		
	}
	
	public List<MovieDTO> getStillcut(String movie_id){//movie.do에 뿌릴 영화 스틸컷을 가져옴
		
		
	}
	
	public List<MovieDTO> getAllComment(String movie_id){//moive.do에 뿌릴 영화 코멘트를 가져옴
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
