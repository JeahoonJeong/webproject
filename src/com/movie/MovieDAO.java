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
	
	
	//ÀüÃ¼ µ¥ÀÌÅÍ °¹¼ö
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
	
	public List<MovieDTO> getAllMV(int start, int end){//list.do ¿¡ »Ñ¸± µ¥ÀÌÅÍ¸¦ °¡Á®¿È
		
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
	
	
	public MovieDTO getOneData(String movie_id){ //movie.do ¿¡ »Ñ¸± ÇØ´ç ¿µÈ­ µ¥ÀÌÅÍ¸¦ °¡Á®¿È
		
		MovieDTO dto = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			/*sql = "select (b.movie_id) movie_id,movie_name,rating,release_date,type,director,actors,genre,showtimes,summary,";
			sql+= "age_limit,file_name,countRate from movie a, (select rating, countRate, file_name, a.movie_id from ";
			sql+= "(select count(rating) countRate,round(avg(rating)) rating,movie_id from rating group by movie_id having movie_id=?) a";
			sql+= ", (select * from image_files where file_name like ('%Post%')) b where a.movie_id = b.movie_id) b ";
			sql+= "where a.movie_id=b.movie_id";
			*/
			
			sql = "select * from (select (b.movie_id) movie_id,movie_name,rating,release_date,type,director,actors,genre,showtimes,summary,";
			sql+= "age_limit,file_name,countRate from movie a, (select rating, countRate, file_name, a.movie_id from ";
			sql+= "(select count(rating) countRate,round(avg(rating)) rating,movie_id from rating group by movie_id having movie_id=?) a";
			sql+= ", (select * from image_files where file_name like ('%Post%')) b where a.movie_id = b.movie_id) b ";
			sql+= "where a.movie_id=b.movie_id)a, (select count(comments) commCount from comments where movie_id=?) b";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, movie_id);
			pstmt.setString(2, movie_id);
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
				dto.setCountRate(rs.getString("countRate"));
				dto.setCommCount(rs.getInt("commCount"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
		
	}
	
	public List<MovieDTO> getStillcut(String movie_id){//movie.do¿¡ »Ñ¸± ¿µÈ­ ½ºÆ¿ÄÆÀ» °¡Á®¿È
		
		List<MovieDTO> lst = new ArrayList<MovieDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select file_name from image_files where movie_id=? and file_name like '%Still%'";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movie_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MovieDTO dto = new MovieDTO();
				
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
	
	
	public List<MovieDTO> getAllComment(String movie_id){//moive.do¿¡ »Ñ¸± ¿µÈ­ ÄÚ¸àÆ®¸¦ °¡Á®¿È
		
		List<MovieDTO> lst = new ArrayList<MovieDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		try {
			
			sql = "select a.*, rating from(select movie_id,a.user_id,comment_date,comments,recommend_num,file_name from comments a,";
			sql+= "member_image b where a.user_id=b.user_id and movie_id=?) a , rating b where a.movie_id=b.movie_id and a.user_id=b.user_id";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movie_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MovieDTO dto = new MovieDTO();
				
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComment_date(rs.getString("comment_date"));
				dto.setComments(rs.getString("comments"));
				dto.setRecommend_num(rs.getInt("recommend_num"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setRating(rs.getInt("rating"));
				
				lst.add(dto);	
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lst;
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
