package com.booking;

import java.io.IOException;
import java.sql.Connection;
import java.util.Calendar;
import java.util.List;

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
	protected void forward(HttpServletRequest req, HttpServletResponse resp,
			String url) throws ServletException, IOException {

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

		if (uri.indexOf("booking.do") != -1) {
			Calendar cal = Calendar.getInstance();

			// 오늘날짜
			int nowYear = cal.get(Calendar.YEAR);
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 현재 요일
			int nowHour = cal.get(Calendar.HOUR_OF_DAY); // 현재 시간
			//클라이언트에서 넘어온 데이터
			String nowHour2 = req.getParameter("nowHour");
			String nowDay2 = req.getParameter("nowDay");

			int hour = nowHour;
			int day = nowDay;

			if (nowHour2 != null) {
				hour = Integer.parseInt(nowHour2);
			}

			if (nowDay2 != null) {
				day = Integer.parseInt(nowDay2);
			}

			// 클라이언트에서 넘어온 데이터
			String strYear = req.getParameter("year");
			String strMonth = req.getParameter("month");

			String strDate = req.getParameter("seletedDate");
			if (strDate != null) {
				String[] strTemp = strDate.split("일");
				String seletedDate2 = strTemp[0];
				System.out.println(seletedDate2);
			}

			// 표시할 달력의 년과 월
			int year = nowYear;
			int month = nowMonth;

			if (strYear != null) {
				year = Integer.parseInt(strYear); // 클라이언트가 선택한 연도
			}

			if (strMonth != null) {
				month = Integer.parseInt(strMonth); // 클라이언트가 선택한 월
			}

			// 세션에 올리기

			req.setAttribute("nowYear", year);
			req.setAttribute("nowMonth", month);
			req.setAttribute("nowDay", nowDay);
			req.setAttribute("hour", hour);
			req.setAttribute("day", day);

			url = "/booking/booking.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("calendar.do") != -1) {
			url = "/booking/calendar.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("seatSelect.do") != -1) {
			String value1 = req.getParameter("value1"); // 성인
			String value2 = req.getParameter("value2"); // 청소년
			String value3 = req.getParameter("value3"); // 어린이
			String value4 = req.getParameter("value4"); // 우대
			int price = 0;

			if (value1 != null) {
				price = (Integer.parseInt(value1) * 10000)
						+ (Integer.parseInt(value2) * 8000)
						+ (Integer.parseInt(value3) * 4000)
						+ (Integer.parseInt(value4) * 5000);
			}

			req.setAttribute("value1", value1);
			req.setAttribute("value2", value2);
			req.setAttribute("value3", value3);
			req.setAttribute("value4", value4);

			req.setAttribute("priceMessage", price); // 선택인원에 따른 값 반환

			url = "/booking/seatSelect.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("theaterSelect.do") != -1) {
			
//			String nowHour2 = req.getParameter("nowHour");
//			String nowDay2 = req.getParameter("nowDay");
//			String strDate = req.getParameter("seletedDate");
//			int hour = 0 ;
//			int day = 0;
//			if (strDate != null) {
//				String[] strTemp = strDate.split("일");
//				String seletedDate2 = strTemp[0];
//				System.out.println(seletedDate2);
//			}
//			if (nowHour2 != null) {
//				hour = Integer.parseInt(nowHour2);
//			}
//
//			if (nowDay2 != null) {
//				day = Integer.parseInt(nowDay2);
//			}
//			
//			
//			req.setAttribute("hour", hour);
//			req.setAttribute("day", day);
			
			List<TheaterDTO> lists = dao.getReadData(); // 영화관 리스트 가져오기 
			
			req.setAttribute("lists", lists);
			
			
			url = "/booking/theaterSelect.jsp";
			forward(req, resp, url);

		}

	}

}
