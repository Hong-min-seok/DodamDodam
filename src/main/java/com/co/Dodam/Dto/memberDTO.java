package com.co.Dodam.Dto;

public class memberDTO {
	
	public String userid;
	public String pw;
	public String nick;
	public String email;
	public member_deviceDTO[] device;
	
	
	public member_deviceDTO[] getDevice() {
		return device;
	}
	public void setDevice(member_deviceDTO[] device) {
		this.device = device;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
