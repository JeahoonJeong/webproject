package com.login;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBCPConn;

public class LoginServlet extends HttpServlet{

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
		
		MemberDAO dao = new MemberDAO(conn);
		
		String url;
		
		String uri = req.getRequestURI();
		
		
		if(uri.indexOf("login.do")!=-1){
			
			url = "/loginPage/login.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("login_ok.do")!=-1){
			
			String user_id = req.getParameter("user_id");
			String user_pwd = req.getParameter("user_pwd");
			
			MemberDTO dto = dao.getReadMemberData(user_id);
			
			if(dto==null || !(dto.getUser_id().equals(user_id))){
				
				req.setAttribute("message", "���̵� �ٽ� Ȯ���ϼ���!");
				
				url = "/loginPage/login.jsp";
				forward(req, resp, url);
				
				return;
				
			}else if(!(dto.getUser_pwd().equals(user_pwd))){
				
				req.setAttribute("message", "��й�ȣ�� �ٽ� Ȯ���ϼ���!");
				
				url = "/loginPage/login.jsp";
				forward(req, resp, url);
				
				return;
			}
			
			HttpSession session = req.getSession(true);
			session.setAttribute("member", dto);
			
			
			
			url = cp + "/Mypage/mypageMain.do";
			
			resp.sendRedirect(url);

			
		}else if(uri.indexOf("register.do")!=-1){
			
			url = "/login/register.jsp";
			forward(req,resp,url);
			
		}
		
	}

}
