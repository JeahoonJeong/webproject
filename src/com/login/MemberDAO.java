package com.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.driver.DBConversion;

public class MemberDAO {
	
	private Connection conn;
	
	public MemberDAO(Connection conn){
		
		this.conn = conn;
	}

	
	//�α��� - �ϳ��� �����͸� �о��
	public MemberDTO getReadMemberData(String user_id){
		
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select user_id,user_pwd,user_name, birth,tel,email,addr, file_name, theater_id from "
					+ "(select c.user_id,user_pwd,user_name, birth,tel,email,addr, file_name, theater_id from "
					+ "(select a.user_id,user_pwd,user_name,to_char(birth,'YYYY-MM-DD') birth,"
					+ "tel,email,addr, file_name from member a left join member_image b on a.user_id=b.user_id) c "
					+ "left join preferred_theater d on c.user_id=d.user_id) where user_id=?";
			
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
				dto.setFile_name(rs.getString("file_name"));
				dto.setTheater_id(rs.getString("theater_id"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
		
	}
	
	
	public int insertData(MemberDTO dto){
		int result =  0 ; 
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into member(USER_ID, USER_PWD, USER_NAME, BIRTH, TEL, EMAIL, ADDR) "
					+ "values(?,?,?,to_date(?,'YYYY-MM-DD'),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result ;
		
	}
	
}

























