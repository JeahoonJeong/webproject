package com.theater;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;

public class TheaterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		
		doPost(req, resp);
		
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,
			String url) throws ServletException, IOException {
			
		RequestDispatcher rd = req.getRequestDispatcher(url);
		
		rd.forward(req, resp);
	
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBCPConn.getConnection();
		TheaterDAO dao = new TheaterDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		if(uri.indexOf("theater.do") != -1){
			
			url = "/theater/theater.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("theaterP2.do") != -1){
			
			url = "/theater/theaterP2.jsp";
			forward(req, resp, url);
		}
		
		
	}
	
	
}
