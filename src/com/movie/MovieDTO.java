package com.movie;

public class MovieDTO {
	
	private int num; //영화 순위or고유넘버
	private String title; //영화 제목
	private int star; //영화 평점
	private String relDate; //영화 개봉일
	private String type; //상영타입 ex)디지털,3D,디지털(자막)..
	private String direct; //영화 감독
	private String actor; //영화 출연배우 
	private String genre; //영화 장르	ex)스릴러
	private int runtime; // 영화 총상영시간 ex)111분
	private String story; //영화 줄거리
	
	private String userId; //사용자 ID (한줄평에 사용)
	private String date; //한줄평 작성 날짜
	private String content; //한줄평 내용
	private int getThumb; //한줄평 추천수
	
	
	private String saveFileName; // 파일세이브명


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getRelDate() {
		return relDate;
	}
	public void setRelDate(String relDate) {
		this.relDate = relDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDirect() {
		return direct;
	}
	public void setDirect(String direct) {
		this.direct = direct;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGetThumb() {
		return getThumb;
	}
	public void setGetThumb(int getThumb) {
		this.getThumb = getThumb;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	
	
	
	
}
