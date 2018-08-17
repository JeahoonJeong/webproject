package com.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MypageDAO {

	private Connection conn;

	public MypageDAO(Connection conn){

		this.conn = conn;
	}
	
	//get booked_id from booked_seats 
	//return List => use for bookedList method;
	public List<String> getBookedId(String user_id){

		List<String> lists = new ArrayList<String>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String booked_id;

		try {

			sql = "select booked_id from booked_seats where user_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()){

				booked_id = rs.getString("booked_id");
				lists.add(booked_id);

			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	//getBookedId = idList
	//RecentBookedList : not cancel, within a month(30days)
	public List<MyBookingDTO> getRecentBookedList(List<String> idList){

		List<MyBookingDTO> lists = new ArrayList<MyBookingDTO>();

		String sql;
		String booked_id;

		try {

			Iterator<String> it = idList.iterator();

			while(it.hasNext()){

				booked_id = it.next();

				PreparedStatement pstmt = null;
				ResultSet rs = null;

				sql = "select booked_id, user_id, reservation_date, to_char(cancel_date,'YYYY-MM-DD HH24:MI') cancel_date,movie_id, file_name, movie_name, age_limit,"
						+ "district, screen_num, row_num, seat_num, to_char(start_time,'YYYY-MM-DD HH24:MI') start_time ,to_char(end_time,'YYYY-MM-DD HH24:MI') end_time"
						+ " from booked_list where booked_id=? and cancel_date is null and start_time>(select sysdate -30 from dual) order by start_time desc";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, booked_id);

				rs = pstmt.executeQuery();

				while(rs.next()){

					MyBookingDTO dto = new MyBookingDTO();

					dto.setBookded_id(rs.getString("booked_id"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReservation_date(rs.getString("reservation_date"));
					dto.setCancel_date(rs.getString("cancel_date"));
					dto.setMovie_id(rs.getString("movie_id"));
					dto.setFile_name(rs.getString("file_name"));
					dto.setMovie_name(rs.getString("movie_name"));
					dto.setAge_limit(rs.getString("age_limit"));
					dto.setDistrict(rs.getString("district"));
					dto.setScreen_num(rs.getString("screen_num"));
					dto.setRow_num(rs.getString("row_num"));
					dto.setSeat_num(rs.getInt("seat_num"));
					dto.setStart_time(rs.getString("start_time"));
					dto.setEnd_time(rs.getString("end_time"));

					lists.add(dto);

				}

				rs.close();
				pstmt.close();

			} 

		}catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}

	//getBookedId = idList
	//now booking list - not cancel / start_time>sysdate
	public List<MyBookingDTO> getBookingList(List<String> idList){

		List<MyBookingDTO> lists = new ArrayList<MyBookingDTO>();

		String sql;
		String booked_id;

		try {

			Iterator<String> it = idList.iterator();

			while(it.hasNext()){

				booked_id = it.next();

				PreparedStatement pstmt = null;
				ResultSet rs = null;

				sql = "select rownum rnum, booked_id, user_id, reservation_date, to_char(cancel_date,'YYYY-MM-DD HH24:MI') cancel_date,movie_id, file_name, movie_name, age_limit,"
						+ "district, screen_num, row_num, seat_num, to_char(start_time,'YYYY-MM-DD HH24:MI') start_time ,to_char(end_time,'HH24:MI') end_time"
						+ " from booked_list where booked_id=? and cancel_date is null and start_time>sysdate order by start_time desc";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, booked_id);

				rs = pstmt.executeQuery();

				while(rs.next()){

					MyBookingDTO dto = new MyBookingDTO();

					dto.setBookded_id(rs.getString("booked_id"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReservation_date(rs.getString("reservation_date"));
					dto.setCancel_date(rs.getString("cancel_date"));
					dto.setMovie_id(rs.getString("movie_id"));
					dto.setFile_name(rs.getString("file_name"));
					dto.setMovie_name(rs.getString("movie_name"));
					dto.setAge_limit(rs.getString("age_limit"));
					dto.setDistrict(rs.getString("district"));
					dto.setScreen_num(rs.getString("screen_num"));
					dto.setRow_num(rs.getString("row_num"));
					dto.setSeat_num(rs.getInt("seat_num"));
					dto.setStart_time(rs.getString("start_time"));
					dto.setEnd_time(rs.getString("end_time"));

					lists.add(dto);

				}

				rs.close();
				pstmt.close();

			} 

		}catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	//getBookedId = idList
	//getSeenMovieList - not cancel, start_time<sysdate
	public List<MyBookingDTO> getSeenMoiveList(List<String> idList){
		
		List<MyBookingDTO> lists = new ArrayList<MyBookingDTO>();

		String sql;
		String booked_id;
		

		try {

			Iterator<String> it = idList.iterator();

			while(it.hasNext()){

				booked_id = it.next();

				PreparedStatement pstmt = null;
				ResultSet rs = null;

				sql = "select booked_id, user_id, reservation_date, to_char(cancel_date,'YYYY-MM-DD HH24:MI') cancel_date, movie_id, file_name, movie_name, age_limit, "
						+ "district, screen_num, row_num, seat_num, to_char(start_time,'YYYY-MM-DD HH24:MI') start_time ,to_char(end_time,'HH24:MI') end_time "
						+ "from booked_list where booked_id=? and cancel_date is null and start_time<sysdate order by start_time desc";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, booked_id);

				rs = pstmt.executeQuery();

				while(rs.next()){

					MyBookingDTO dto = new MyBookingDTO();

					dto.setBookded_id(rs.getString("booked_id"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setReservation_date(rs.getString("reservation_date"));
					dto.setCancel_date(rs.getString("cancel_date"));
					dto.setMovie_id(rs.getString("movie_id"));
					dto.setFile_name(rs.getString("file_name"));
					dto.setMovie_name(rs.getString("movie_name"));
					dto.setAge_limit(rs.getString("age_limit"));
					dto.setDistrict(rs.getString("district"));
					dto.setScreen_num(rs.getString("screen_num"));
					dto.setRow_num(rs.getString("row_num"));
					dto.setSeat_num(rs.getInt("seat_num"));
					dto.setStart_time(rs.getString("start_time"));
					dto.setEnd_time(rs.getString("end_time"));

					lists.add(dto);

				}

				rs.close();
				pstmt.close();

			} 

		}catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
		
	}
	
	//canceled Movie List
		public List<MyBookingDTO> getCanceledBooking(List<String> idList){
			
			List<MyBookingDTO> lists = new ArrayList<MyBookingDTO>();

			String sql;
			String booked_id;
			

			try {

				Iterator<String> it = idList.iterator();

				while(it.hasNext()){

					booked_id = it.next();

					PreparedStatement pstmt = null;
					ResultSet rs = null;

					sql = "select rownum rnum, booked_id, user_id, reservation_date, to_char(cancel_date,'YYYY-MM-DD HH24:MI') cancel_date,movie_id, file_name, movie_name, age_limit,"
							+ "district, screen_num, row_num, seat_num, to_char(start_time,'YYYY-MM-DD HH24:MI') start_time ,to_char(end_time,'HH24:MI') end_time"
							+ " from booked_list where booked_id=? and cancel_date is not null order by start_time desc";

					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, booked_id);

					rs = pstmt.executeQuery();

					while(rs.next()){

						MyBookingDTO dto = new MyBookingDTO();

						dto.setBookded_id(rs.getString("booked_id"));
						dto.setUser_id(rs.getString("user_id"));
						dto.setReservation_date(rs.getString("reservation_date"));
						dto.setCancel_date(rs.getString("cancel_date"));
						dto.setMovie_id(rs.getString("movie_id"));
						dto.setFile_name(rs.getString("file_name"));
						dto.setMovie_name(rs.getString("movie_name"));
						dto.setAge_limit(rs.getString("age_limit"));
						dto.setDistrict(rs.getString("district"));
						dto.setScreen_num(rs.getString("screen_num"));
						dto.setRow_num(rs.getString("row_num"));
						dto.setSeat_num(rs.getInt("seat_num"));
						dto.setStart_time(rs.getString("start_time"));
						dto.setEnd_time(rs.getString("end_time"));

						lists.add(dto);

					}

					rs.close();
					pstmt.close();

				} 

			}catch (Exception e) {
				System.out.println(e.toString());
			}

			return lists;
			
		}


	//占쏙옙占쏙옙占쏙옙占� 占쏙옙화 count
	public int getWishMovieCount(String user_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int count = 0;

		try {

			sql = "select count(*) from wish_list where user_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()){

				count = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	//占쏙옙 占쏙옙화 count
	public int getSeenMovieCount(String user_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int count = 0;

		try {

			sql = "select count(*) from booked_list where user_id=? and cancel_date is null and start_time<sysdate";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()){

				count = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	//占쏙옙占쏙옙占쏙옙 count
	public int getCommentCount(String user_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int count = 0;

		try {

			sql = "select count(*) from comments where user_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()){

				count = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	//占쏙옙호占싹댐옙 占쏙옙화占쏙옙 占쌀뤄옙占쏙옙占쏙옙(city, district占쏙옙 占쌀뤄옙占쏙옙)
	public String getPreferredTheater(String user_id){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String preferredTheater = null;

		try {

			sql = "select city, district from(select user_id, a.theater_id, city, district from preferred_theater a inner join theater b on a.theater_id = b.theater_id) where user_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()){

				String city = rs.getString("city");
				String district = rs.getString("district");
				preferredTheater = city + " " + district;
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return preferredTheater;

	}

	//booked_seats Table update for cancel of reservation

	public int cancelReservation(String booked_id) {	
		PreparedStatement pstmt = null;
		int result = 0;
		String sql;

		try {

			sql = "update booked_seats set cancel_date = sysdate where booked_id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, booked_id);

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}

	//comment
	public List<CommentDTO> getCommentList(String user_id){

		List<CommentDTO> lists = new ArrayList<CommentDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select user_id, a.movie_id, movie_name, age_limit, file_name, rating, contents, to_char(comment_date,'YYYY-MM-DD HH24:MI') comment_date, recommend_num "
					+ "from ccomments a inner join (select e.movie_id, rating, movie_name, age_limit, file_name "
					+ "from (select movie_id, rating from rating where user_id = ?) e "
					+ "inner join (select c.movie_id, movie_name, age_limit, file_name "
					+ "from (select a.movie_id, age_limit, file_name from screen a inner join image_files b on a.movie_id=b.movie_id) c "
					+ "inner join movie d on c.movie_id = d.movie_id) f on e.movie_id=f.movie_id) b on a.movie_id = b.movie_id where user_id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				CommentDTO dto = new CommentDTO();

				dto.setUser_id(rs.getString("user_id"));
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setMovie_name(rs.getString("movie_name"));
				dto.setFile_name(rs.getString("file_name"));
				dto.setRating(rs.getInt("rating"));
				dto.setAge_limit(rs.getString("age_limit"));
				dto.setComment(rs.getString("comment"));
				dto.setComment_date(rs.getString("comment_date"));
				dto.setRecommend_num(rs.getInt("recommend_num"));

				lists.add(dto);

			}

			rs.close();
			pstmt.close();


		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	//wish






}
