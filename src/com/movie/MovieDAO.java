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
	
	public List<MovieDTO> getAllMV(int start, int end){//영화 페이지에 뿌릴 데이터를 가져옴
		
		List<MovieDTO> lst = new ArrayList<MovieDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select * from (select rownum rnum, data.* from(";
			sql+= "select num,title,star,relDate,saveFileName from movie ";
			sql+= "order by num desc) data) where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MovieDTO dto = new MovieDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setStar(rs.getInt("star"));
				dto.setRelDate(rs.getString("relDate"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				
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
