package com.mypage;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.MemberDTO;

import util.DBCPConn;

public class MypageServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String cp = req.getContextPath();
		
		Connection conn = DBCPConn.getConnection();
		
		String url;
		
		String uri = req.getRequestURI();
		
		if(uri.indexOf("mypageMain.do")!=-1){
			
			HttpSession session = req.getSession();
			
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			
			
			
			
			
			
			
			
			url = "/mypage/mypageMain.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("myBooking.do")!=-1){
			
			url = "/mypage/myBooking.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("myMoivestory.do")!=-1){
			
			url = "/mypage/myMoviestory.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("myInfo.do")!=-1){
			
			url = "/mypage/myInfo.jsp";
			forward(req, resp, url);
			
		}
		
		
		
	}
	
	

}
