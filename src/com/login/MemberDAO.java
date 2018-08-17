package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	
	public MemberDAO(Connection conn){
		
		this.conn = conn;
	}

	
	//로그인 - 하나의 데이터를 읽어옴
	public MemberDTO getReadMemberData(String user_id){
		
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select user_id,user_pwd,user_name,to_char(birth,'YYYY-MM-DD') birth,tel,email,addr from member where user_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dto = new MemberDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setBirth(rs.getString("birth"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddr(rs.getString("addr"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
		
	}
	
	
	
}
