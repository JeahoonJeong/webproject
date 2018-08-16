package com.movie;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;
import util.MyUtil;

public class MovieServlet extends HttpServlet{

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
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBCPConn.getConnection();
		MovieDAO dao = new MovieDAO(conn);
		MyUtil myUtil = new MyUtil();
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;
		
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "mv" + File.separator + "imageFile";
		
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		
		if(uri.indexOf("list.do")!=-1){
			
			url = "/movie/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("movie.do")!=-1){
			
			
			url = "/movie/movie.jsp";
			forward(req, resp, url);
			
		}
		
		
		
		
		
		
	}
	
	

}
