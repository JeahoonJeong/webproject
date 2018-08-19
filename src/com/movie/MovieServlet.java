package com.movie;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.List;

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
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);
			
			//��ü ������ ����
			int numPerPage = 21;
			int dataCount = dao.getDataCount();
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage=totalPage;
			
			//������ ���۰� ��
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<MovieDTO> lst = dao.getAllMV(start, end);
			
			String listUrl = cp + "/Movie/list.do";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			String imagePath = cp + "/mv/imageFile";
			
			req.setAttribute("lst", lst);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);
				
			
			url = "/movie/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("movie.do")!=-1){
			
			
			String pageNum = req.getParameter("pageNum");
			
			MovieDTO dto = new MovieDTO();
			
			String movie_id = req.getParameter("movie_id");
			
			System.out.println(movie_id);
			
			dto = dao.getOneData(movie_id);
			List<MovieDTO> still = dao.getStillcut(movie_id);
					
			dto.setSummary(dto.getSummary().replaceAll("/", "<br>"));
			
			String imagePath = cp + "/mv/imageFile";
			
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			req.setAttribute("still", still);
	
			url = "/movie/movie.jsp?movie_id=" + movie_id;
			forward(req, resp, url);
			
		}else if(uri.indexOf("movieTime_ok.do")!=-1){
			
			String movie_id = req.getParameter("movie_id");
			
			
			url = "/timetable/movieTime_ok.jsp?movie_id=" + movie_id;
			forward(req, resp, url);
			
		}
			
		
			
		
		
		
		
		
		
	}
	
	

}
