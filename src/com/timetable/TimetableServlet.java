package com.timetable;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;


public class TimetableServlet extends HttpServlet {

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
		TimetableDAO dao = new TimetableDAO(conn);		

		String cp = req.getContextPath();
		String url;
		String uri = req.getRequestURI();

		if (uri.indexOf("movieTime.do") != -1) {
			String imagePath = cp +"/timetable/image";
			
		
			req.setAttribute("imagePath", imagePath);
			
			//city, district, movie_name, screen_num, start_time, end_time, seatedseat, seatnumber, type, age_limt, movie_id

			// 데이터 가져오기(list)

			List<TimetableDTO> lists1 = dao.getMovie();
			req.setAttribute("lists1", lists1);		
			
			url="/timetable/movieTime.jsp";
			forward(req, resp, url);			
		}else if (uri.indexOf("movieTime_ok.do") != -1) {
			String imagePath = cp +"/timetable/image";
			String movie_id = req.getParameter("movie_id");
			req.setAttribute("movie_id", movie_id);		

			
			req.setAttribute("imagePath", imagePath);
			
			List<TimetableDTO> lists = dao.getList(movie_id);
			req.setAttribute("lists", lists);	
			
			List<TimetableDTO> lists1 = dao.getMovie();
			req.setAttribute("lists1", lists1);	
			
			url="/timetable/movieTime.jsp?movie_id="+movie_id;
			forward(req, resp, url);

		}

	}

}
