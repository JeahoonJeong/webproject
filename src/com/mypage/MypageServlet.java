package com.mypage;

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

import com.login.MemberDTO;

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

		String url;

		String uri = req.getRequestURI();

		if(uri.indexOf("mypageMain.do")!=-1){
			
			//�ֱ� ���� ����(�ֱ� �Ѵ� ����) �ҷ����� ����
			List<String> idList = new ArrayList<String>();

			HttpSession session = req.getSession();

			MemberDTO member = (MemberDTO)session.getAttribute("member");

			idList = dao.getBookedId(member.getUser_id());

			List<MyBookingDTO> recentBookedList = new ArrayList<MyBookingDTO>();

			recentBookedList = dao.getRecentBookedList(idList);
			
			req.setAttribute("recentBookedList", recentBookedList);
			//�ֱ� ���� ����(�ֱ� �Ѵ� ����) �ҷ����� �Ϸ�
			
			//���� �����丮 ī��Ʈ �ҷ����� ����
			int wishMovieCount = dao.getWishMovieCount(member.getUser_id());
			int seenMovieCount = dao.getSeenMovieCount(member.getUser_id());
			int commentCount = dao.getCommentCount(member.getUser_id());
			
			req.setAttribute("wishMovieCount", wishMovieCount);
			req.setAttribute("seenMovieCount", seenMovieCount);
			req.setAttribute("commentCount", commentCount);
			//���� �����丮 ī��Ʈ �ҷ����� �Ϸ�
			
			//��ȣ ��ȭ�� �ҷ�����
			String preferredTheater = dao.getPreferredTheater(member.getUser_id());
			req.setAttribute("preferredTheater", preferredTheater);

			url = "/mypage/mypageMain.jsp";
			forward(req, resp, url);


		}else if(uri.indexOf("myBooking.do")!=-1){
			
			//���� ���� �ҷ����� ����
			List<String> idList = new ArrayList<String>();

			HttpSession session = req.getSession();

			MemberDTO member = (MemberDTO)session.getAttribute("member");

			idList = dao.getBookedId(member.getUser_id());
				
			List<MyBookingDTO> bookingList = new ArrayList<MyBookingDTO>();

			bookingList = dao.getBookingList(idList);
			
			session.setAttribute("bookingList", bookingList);
			//���� ���� �ҷ����� �Ϸ�
			
			
			
			
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

		}



	}



}
