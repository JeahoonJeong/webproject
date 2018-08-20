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
				
				req.setAttribute("message", "아이디를 다시 확인하세요!");
				
				url = "/loginPage/login.jsp";
				forward(req, resp, url);
				
				return;
				
			}else if(!(dto.getUser_pwd().equals(user_pwd))){
				
				req.setAttribute("message", "비밀번호를 다시 확인하세요!");
				
				url = "/loginPage/login.jsp";
				forward(req, resp, url);
				
				return;
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("member", dto);

			url = cp + "/Mypage/mypageMain.do";
			
			resp.sendRedirect(url);

			
		}else if(uri.indexOf("register.do")!=-1){
			
			url = "/login/register.jsp";
			forward(req,resp,url);
			
		}else if(uri.indexOf("register_ok.do")!=-1){
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUser_id(req.getParameter("id"));
			dto.setUser_id(req.getParameter("pwd"));
			dto.setUser_id(req.getParameter("name"));
			dto.setUser_id(req.getParameter("birth"));
			dto.setUser_id(req.getParameter("tel"));
			dto.setUser_id(req.getParameter("email"));
			dto.setUser_id(req.getParameter("addr"));
			
			dao.insertData(dto);
			
			url = cp+"/Mypage/mypageMain.do";
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("log_out.do")!=-1){
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("member"); 
			session.invalidate();	
			
			resp.sendRedirect(cp);
			
		}
		
		
		
		
	}

}
