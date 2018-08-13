package com.booking;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;


public class BookingServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// Get占쏙옙占� 처占쏙옙
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	// 占쏙옙占쏙옙占쏙옙 占쌨소듸옙
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		
		// url 占쏙옙 占쌍소뤄옙 RequestDistpatcher 占쏙옙체 占쏙옙占쏙옙
		RequestDispatcher rd = req.getRequestDispatcher(url); 
		// 占쏙옙占쏙옙占쏙옙 占쌜억옙
		rd.forward(req, resp); 
		
	}
	
	// Post 占쏙옙占� 처占쏙옙
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		Connection conn = DBCPConn.getConnection();
		BookingDAO dao = new BookingDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();

		String url;
		
		if(uri.indexOf("booking.do") != -1){
			
			url = "/booking/booking.jsp";
			forward(req, resp, url);
			
		}
		
		
		
	}
	
	
	
}
