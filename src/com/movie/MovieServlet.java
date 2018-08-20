package com.movie;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.MemberDTO;
import com.mypage.MypageDAO;

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
		MypageDAO daoMP = new MypageDAO(conn);
		MyUtil myUtil = new MyUtil();
		

		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url;

		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "mv" + File.separator + "imageFile";

		File f = new File(path);
		if(!f.exists())
			f.mkdirs();

		if(uri.indexOf("list.do")!=-1){// ��ȭ ����Ʈ

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

		}else if(uri.indexOf("movie.do")!=-1){//��ȭ ��������

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

			//��ü ������ ����
			int numPerPage = 10;
			int dataCount = dto.getCommCount();

			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			if(currentPage>totalPage)
				currentPage=totalPage;

			//������ ���۰� ��
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;*/

			List<MovieDTO> still = dao.getStillcut(movie_id);
			List<MovieDTO> comm = dao.getAllComment(movie_id);
			int stillCount = dao.getStillCount(movie_id);

			dto.setSummary(dto.getSummary().replaceAll("/", "<br>"));
			/*
			String listUrl = cp + "/Movie/movie.do?movie_id" + movie_id;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);*/
			
			
			/////////-------------------------------------
			HttpSession session = req.getSession();
			MemberDTO member = new MemberDTO();
			member = (MemberDTO)session.getAttribute("member");
			
			if(member!=null){
				
				String user_id = member.getUser_id();
				
				String wish = dao.searchWishlist(user_id, movie_id);
				req.setAttribute("wish", wish);
				
			}

			////////--------------------------------------
			
			
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



		}else if(uri.indexOf("comments.do")!=-1){//�ڸ�Ʈ ���� ����

			HttpSession session = req.getSession();

			MemberDTO member = (MemberDTO)session.getAttribute("member");

			String user_id = member.getUser_id();

			String movie_id = req.getParameter("movie_id");

			MovieDTO dto = new MovieDTO();

			dto.setMovie_id(movie_id);
			dto.setUser_id(user_id);
			dto.setComments(req.getParameter("comments"));
			dto.setRating(Integer.parseInt(req.getParameter("rating")));

			dao.insertComment(dto);

			url = "/Movie/movie.do?movie_id=" + movie_id;			
			forward(req, resp, url);



		}else if(uri.indexOf("list_date.do")!=-1){


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

			List<MovieDTO> lst = dao.getListDate(start, end);

			String listUrl = cp + "/Movie/list.do";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String imagePath = cp + "/mv/imageFile";

			req.setAttribute("lst", lst);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);


			url = "/movie/list_date.jsp";
			forward(req, resp, url);

		
		}else if(uri.indexOf("list_pre.do")!=-1){


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

			List<MovieDTO> lst = dao.getListPre(start, end);
			
					
			String listUrl = cp + "/Movie/list.do";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			String imagePath = cp + "/mv/imageFile";

			req.setAttribute("lst", lst);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);


			url = "/movie/list_pre.jsp";
			forward(req, resp, url);	
			

		}else if(uri.indexOf("movieTime_ok.do")!=-1){ // �󿵽ð�ǥ�� ����

			String movie_id = req.getParameter("movie_id");


			url = "/timetable/movieTime_ok.jsp?movie_id=" + movie_id;
			forward(req, resp, url);
			
			
			
		}else if(uri.indexOf("wish.do")!=-1){
			
			List<MovieDTO> lst = new ArrayList<MovieDTO>();
			
			String user_id = req.getParameter("user_id");
			
			lst = daoMP.getWishList(user_id);
			
			
			
			String imagePath = cp + "/mv/imageFile";
			
			req.setAttribute("lst", lst);
			req.setAttribute("imagePath", imagePath);
			
			url = "/movie/wish.jsp";
			forward(req, resp, url);
			
		
		////////--------------------------------------
			
		}else if(uri.indexOf("wish_add.do")!=-1){
			
			HttpSession session = req.getSession();
			MemberDTO member = new MemberDTO();
			member = (MemberDTO)session.getAttribute("member");
			String movie_id = (String) req.getParameter("movie_id");
			String message = null;
			
			if(member!=null){
				
				String user_id = member.getUser_id();

				dao.insertWishlist(user_id, movie_id);
			}
			else{
				message = "�α��� �ؾ� �̿��� �� �ֽ��ϴ�!";
			}
			
			req.setAttribute("message", message);
			/*
			url = cp + "/Movie/movie.do?movie_id=" + movie_id;
			resp.sendRedirect(url);
			*/
			
			url = "/Movie/movie.do?movie_id=" + movie_id;
			forward(req, resp, url);
			
		}else if(uri.indexOf("wish_remove.do")!=-1){
				
			HttpSession session = req.getSession();
			MemberDTO member = new MemberDTO();
			member = (MemberDTO)session.getAttribute("member");
			String user_id = member.getUser_id();
			
			String movie_id = (String) req.getParameter("movie_id");	
			
			dao.deleteWishlist(user_id, movie_id);
			
			url = cp +"/Movie/movie.do?movie_id=" + movie_id;
			resp.sendRedirect(url);
		}
		
			
		////////--------------------------------------
			
		
		
		
		
		
		
	}
}




