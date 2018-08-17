package com.theater;

public class TheaterDTO {

	private String movie_id;
	private String theater_id;
	private String screen_id;
	private String city; // 서울
	private String district; // 상암
	private String movie_name; // 공작
	private String scree_num; // 4관
	private String start_time; // 14:00
	private String end_time; // 16:27
	private int seatedSeat; // 163
	private int seatNumber; // 217
	private String type; // 디지털
	private int age_limit; // 12세
 
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getScree_num() {
		return scree_num;
	}

	public void setScree_num(String scree_num) {
		this.scree_num = scree_num;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSeatedSeat() {
		return seatedSeat;
	}

	public void setSeatedSeat(int seatedSeat) {
		this.seatedSeat = seatedSeat;
	}

	public int getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(int seatNumber) {
		this.seatNumber = seatNumber;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public int getAge_limit() {
		return age_limit;
	}

	public void setAge_limit(int age_limit) {
		this.age_limit = age_limit;
	}

	public String getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}

	public String getScreen_id() {
		return screen_id;
	}

	public void setScreen_id(String screen_id) {
		this.screen_id = screen_id;
	}

}
