package com.movie;

public class MovieDTO {
	
	private String movie_id; //영화 순위or고유넘버
	private String movie_name; //영화 제목
	private int rating; //영화 평점
	private String release_date; //영화 개봉일
	private String type; //상영타입 ex)디지털,3D,디지털(자막)..
	private String director; //영화 감독
	private String actors; //영화 출연배우 
	private String genre; //영화 장르	ex)스릴러
	private int showtimes; // 영화 총상영시간 ex)111분
	private String summary; //영화 줄거리
	
	private String user_id; //사용자 ID (한줄평에 사용)
	private String comment_date; //한줄평 작성 날짜
	private String comment; //한줄평 내용
	private int recommend_num; //한줄평 추천수
	
	
	private String file_name; // 파일세이브명


	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getShowtimes() {
		return showtimes;
	}
	public void setShowtimes(int showtimes) {
		this.showtimes = showtimes;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getRecommend_num() {
		return recommend_num;
	}
	public void setRecommend_num(int recommend_num) {
		this.recommend_num = recommend_num;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	
	
	
	
	
	
	
	
	
}
