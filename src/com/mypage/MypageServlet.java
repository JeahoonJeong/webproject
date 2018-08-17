package com.mypage;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.MemberDAO;
import com.login.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

		MypageDAO dao = new MypageDAO(conn);
		
		MemberDAO memberdao = new MemberDAO(conn);

		String url;

		String uri = req.getRequestURI();

		//ÆÄÀÏÀ» ÀúÀåÇÒ °æ·Î
		String root = getServletContext().getRealPath("/");
		String path = root + "memberImages";
		
		System.out.println(path);
		
		File f = new File(path);

		if(!f.exists()){
			f.mkdirs();
		}

		if(uri.indexOf("mypageMain.do")!=-1){

			//ï¿½Ö±ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½(ï¿½Ö±ï¿½ ï¿½Ñ´ï¿½ ï¿½ï¿½ï¿½ï¿½) ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			List<String> idList = new ArrayList<String>();

			HttpSession session = req.getSession();

			MemberDTO member = (MemberDTO)session.getAttribute("member");

			idList = dao.getBookedId(member.getUser_id());

			List<MyBookingDTO> recentBookedList = new ArrayList<MyBookingDTO>();

			recentBookedList = dao.getRecentBookedList(idList);

			req.setAttribute("recentBookedList", recentBookedList);
			//ï¿½Ö±ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½(ï¿½Ö±ï¿½ ï¿½Ñ´ï¿½ ï¿½ï¿½ï¿½ï¿½) ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ï·ï¿½

			//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ä¸® Ä«ï¿½ï¿½Æ® ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			int wishMovieCount = dao.getWishMovieCount(member.getUser_id());
			int seenMovieCount = dao.getSeenMovieCount(member.getUser_id());
			int commentCount = dao.getCommentCount(member.getUser_id());

			req.setAttribute("wishMovieCount", wishMovieCount);
			req.setAttribute("seenMovieCount", seenMovieCount);
			req.setAttribute("commentCount", commentCount);
			//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ä¸® Ä«ï¿½ï¿½Æ® ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ï·ï¿½

			//ï¿½ï¿½È£ ï¿½ï¿½È­ï¿½ï¿½ ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½
			String preferredTheater = dao.getPreferredTheater(member.getUser_id());
			
			session.setAttribute("preferredTheater", preferredTheater);

			url = "/mypage/mypageMain.jsp";
			forward(req, resp, url);


		}else if(uri.indexOf("myBooking.do")!=-1){

			//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
			List<String> idList = new ArrayList<String>();

			HttpSession session = req.getSession();

			MemberDTO member = (MemberDTO)session.getAttribute("member");

			idList = dao.getBookedId(member.getUser_id());

			List<MyBookingDTO> bookingList = new ArrayList<MyBookingDTO>();

			bookingList = dao.getBookingList(idList);

			session.setAttribute("bookingList", bookingList);
			//ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ò·ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ï·ï¿½




			List<MyBookingDTO> seenMovieList = new ArrayList<MyBookingDTO>();
			seenMovieList = dao.getSeenMoiveList(idList);

			session.setAttribute("seenMovieList", seenMovieList);





			List<MyBookingDTO> canceledList = new ArrayList<MyBookingDTO>();

			canceledList = dao.getCanceledBooking(idList);

			session.setAttribute("canceledList", canceledList);



			url = "/mypage/myBooking.jsp";
			forward(req, resp, url);


		}else if(uri.indexOf("cancel_ok.do")!=-1){

			//update cancel_date

			String booked_id = req.getParameter("booked_id");

			dao.cancelReservation(booked_id);

			url = "/mypage/list/bookingList.jsp";

			resp.sendRedirect(url);

		}else if(uri.indexOf("myMoivestory.do")!=-1){

			url = "/mypage/myMoviestory.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("myInfo.do")!=-1){

			url = "/mypage/myInfo.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("myInfo_ok.do")!=-1){

			HttpSession session = req.getSession();
			
			MemberDTO member = new MemberDTO();

			member = (MemberDTO)session.getAttribute("member");
			
			String user_id = member.getUser_id();

			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			String file_name;
			String preferred_theater;
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			file_name = mr.getFilesystemName("file_name");
			
			System.out.println(file_name);
			
			//member image file check
			if(file_name!=null){
				
				String getFileName = dao.getMemberImage(user_id);
				
				if(getFileName==null){				
					dao.insertMemberImage(user_id, file_name);				
				}
				else{				
					dao.updateMemberImage(user_id, file_name);		
				}
			}

			MemberDTO updateMember = new MemberDTO();
		
			updateMember.setBirth(mr.getParameter("birth"));
			updateMember.setTel(mr.getParameter("tel"));
			updateMember.setEmail(mr.getParameter("email"));
			updateMember.setAddr(mr.getParameter("addr"));
			String city = mr.getParameter("city");
			String district = mr.getParameter("district");
			
			System.out.println(city);
			System.out.println(district);
			
			//preferred_theater check
			if(city!=null){
				
				preferred_theater = dao.getPreferredTheater(user_id);
				
				String theater_id = dao.getTheaterId(city, district);
				
				if(preferred_theater==null){

					dao.insertPreferredTheater(user_id, theater_id);
					
				}
				else{
					
					dao.updatePreferredTheater(user_id, theater_id);
				}
				
			}
			
			//member update
			dao.updateMember(user_id, updateMember);
			
			MemberDTO dto = new MemberDTO();
			
			dto = memberdao.getReadMemberData(user_id);
			
			session.setAttribute("member", dto);
			
			String preferredTheater = dao.getPreferredTheater(member.getUser_id());
			
			session.setAttribute("preferredTheater", preferredTheater);

			url = cp + "/mypage/mypageMain.jsp";
			
			resp.sendRedirect(url);
			
			
			

		}

	}



}
