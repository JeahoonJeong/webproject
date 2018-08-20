package com.movie;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.MemberDTO;

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
		
		if(uri.indexOf("list.do")!=-1){// ¿µÈ­ ¸®½ºÆ®
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);
			
			//ï¿½ï¿½Ã¼ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			int numPerPage = 21;
			int dataCount = dao.getDataCount();
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage=totalPage;
			
			//ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Û°ï¿½ ï¿½ï¿½
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
			
		}else if(uri.indexOf("movie.do")!=-1){//¿µÈ­ »ó¼¼ÆäÀÌÁö
		
			/*String pageNum;
			
			if(req.getParameter("pageNum")==null||req.getParameter("pageNum").equals("")){
				pageNum="1";
			}else{
				pageNum = req.getParameter("pageNum");
			}*/

			
			MovieDTO dto = new MovieDTO();
			String movie_id = req.getParameter("movie_id");
			
			dto = dao.getOneData(movie_id);
			
			/*int currentPage = 1;
			
			if(pageNum!=null)
				currentPage = Integer.parseInt(pageNum);
			
			//ÀüÃ¼ µ¥ÀÌÅÍ °¹¼ö
			int numPerPage = 10;
			int dataCount = dto.getCommCount();
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage)
				currentPage=totalPage;
			
			//µ¥ÀÌÅÍ ½ÃÀÛ°ú ³¡
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;*/
			
			List<MovieDTO> still = dao.getStillcut(movie_id);
			List<MovieDTO> comm = dao.getAllComment(movie_id);
			int stillCount = dao.getStillCount(movie_id);
					
			dto.setSummary(dto.getSummary().replaceAll("/", "<br>"));
			/*
			String listUrl = cp + "/Movie/movie.do?movie_id" + movie_id;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);*/
			
			String imagePath = cp + "/mv/imageFile";
			
			/*req.setAttribute("totalPage", totalPage);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);*/
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("dto", dto);
			req.setAttribute("still", still);
			req.setAttribute("comm", comm);
			req.setAttribute("stillCount", stillCount);
	
			url = "/movie/movie.jsp?movie_id= + movie_id";
			forward(req, resp, url);
			
			
		
		}else if(uri.indexOf("comments.do")!=-1){//ÄÚ¸àÆ® ³»¿ë ÀúÀå
			
			HttpSession session = req.getSession();
			
			MemberDTO member = (MemberDTO)session.getAttribute("member");
			
			String user_id = member.getUser_id();
			
			String movie_id = req.getParameter("movie_id");
			
			MovieDTO dto = new MovieDTO();
			
			dto.setMovie_id(movie_id);
			dto.setUser_id(user_id);
			dto.setComments(req.getParameter("comments"));
			System.out.println(req.getParameter("rating"));
			dto.setRating(Integer.parseInt(req.getParameter("rating")));
			
			dao.insertComment(dto);
			
			url = "/Movie/movie.do?movie_id=" + movie_id;			
			forward(req, resp, url);


			
		}else if(uri.indexOf("movieTime_ok.do")!=-1){ // »ó¿µ½Ã°£Ç¥·Î ¿¬°á
			
			String movie_id = req.getParameter("movie_id");
			
			
			url = "/timetable/movieTime_ok.jsp?movie_id=" + movie_id;
			forward(req, resp, url);
			
		}
			
		
			
		
		
		
		
		
		
	}
	
	

}
