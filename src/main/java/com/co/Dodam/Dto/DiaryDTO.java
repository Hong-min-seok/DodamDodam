package com.co.Dodam.Dto;

import java.util.ArrayList;

public class DiaryDTO {
	 	private int index;
	 	private String device_id ;
	    private String date;
		private String nick ;
		private String userid;
		private String f_name ;
	    private String f_nick ;
	    private String title ;
	    private String img ;
	    private String content ;
	    private String review ;
	    private int hit ;
	    private ArrayList<String> like;
	    
	    private float temp;
		private int humi;
		private int mois;
		
		
		
	    
		
		public ArrayList<String> getLike() {
			return like;
		}
		public void setLike(ArrayList<String> like) {
			this.like = like;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
	    
		public int getIndex() {
			return index;
		}
		public void setIndex(int index) {
			this.index = index;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getNick() {
			return nick;
		}
		public void setNick(String nick) {
			this.nick = nick;
		}
		public String getF_name() {
			return f_name;
		}
		public void setF_name(String f_name) {
			this.f_name = f_name;
		}
		public String getF_nick() {
			return f_nick;
		}
		public void setF_nick(String f_nick) {
			this.f_nick = f_nick;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getImg() {
			return img;
		}
		public void setImg(String img) {
			this.img = img;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getReview() {
			return review;
		}
		public void setReview(String review) {
			this.review = review;
		}
		
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		
	    public String getDevice_id() {
			return device_id;
		}
		public void setDevice_id(String device_id) {
			this.device_id = device_id;
		}
		public float getTemp() {
			return temp;
		}
		public void setTemp(float temp) {
			this.temp = temp;
		}
		public int getHumi() {
			return humi;
		}
		public void setHumi(int humi) {
			this.humi = humi;
		}
		public int getMois() {
			return mois;
		}
		public void setMois(int mois) {
			this.mois = mois;
		}
		
	    
}
