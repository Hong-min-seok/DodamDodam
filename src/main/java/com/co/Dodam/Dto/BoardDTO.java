package com.co.Dodam.Dto;

import java.util.ArrayList;

public class BoardDTO {
   
    private int index;
    private String userid;
    private String nick;
    private String title;
    private String content;
    private String date;
    private String photo;
    private int hit;
    private ArrayList<String> like;
    private ArrayList<CommentDTO> comment;
    
   public int getIndex() {
      return index;
   }
   public void setIndex(int index) {
      this.index = index;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   public String getNick() {
      return nick;
   }
   public void setNick(String nick) {
      this.nick = nick;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getDate() {
      return date;
   }
   public void setDate(String date) {
      this.date = date;
   }
   public String getPhoto() {
      return photo;
   }
   public void setPhoto(String photo) {
      this.photo = photo;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public ArrayList<String> getLike() {
      return like;
   }
   public void setLike(ArrayList<String> like) {
      this.like = like;
   }
   public ArrayList<CommentDTO> getComment() {
      return comment;
   }
   public void setComment(ArrayList<CommentDTO> comment) {
      this.comment = comment;
   }
   

}