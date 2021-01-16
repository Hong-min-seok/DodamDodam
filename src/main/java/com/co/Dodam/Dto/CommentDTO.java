package com.co.Dodam.Dto;

public class CommentDTO {
   private int index;
    private String userid;
    private String nick;
    private String content;
    private String date;
    
    
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
}