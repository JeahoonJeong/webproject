package com.movie;

public class MovieDTO {
	
	private int num; //��ȭ ����or�����ѹ�
	private String title; //��ȭ ����
	private int star; //��ȭ ����
	private String relDate; //��ȭ ������
	private String type; //��Ÿ�� ex)������,3D,������(�ڸ�)..
	private String direct; //��ȭ ����
	private String actor; //��ȭ �⿬��� 
	private String genre; //��ȭ �帣	ex)������
	private int runtime; // ��ȭ �ѻ󿵽ð� ex)111��
	private String story; //��ȭ �ٰŸ�
	
	private String userId; //����� ID (������ ���)
	private String date; //������ �ۼ� ��¥
	private String content; //������ ����
	private int getThumb; //������ ��õ��
	
	
	private String saveFileName; // ���ϼ��̺��


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
