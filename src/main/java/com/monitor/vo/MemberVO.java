package com.monitor.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String myintro;
	private String myimg;
	private String mybackground;
	private String country;
	private Date regdate;
	private Date updatedate;
	private String authCode;
	private int authStatus;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
	private Date myimgdate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
	private Date mybackgrounddate;

	public Date getMybackgrounddate() {
		return mybackgrounddate;
	}
	public void setMybackgrounddate(Date mybackgrounddate) {
		this.mybackgrounddate = mybackgrounddate;
	}
	public Date getMyimgdate() {
		return myimgdate;
	}
	public void setMyimgdate(Date myimgdate) {
		this.myimgdate = myimgdate;
	}
	public int getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(int authStatus) {
		this.authStatus = authStatus;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMyintro() {
		return myintro;
	}
	public void setMyintro(String myintro) {
		this.myintro = myintro;
	}
	public String getMyimg() {
		return myimg;
	}
	public void setMyimg(String myimg) {
		this.myimg = myimg;
	}
	public String getMybackground() {
		return mybackground;
	}
	public void setMybackground(String mybackground) {
		this.mybackground = mybackground;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid="+userid+", userpw="+userpw+", username="+username+", email="+email+", myintro="+myintro+", myimg="+myimg+", mybackground="+mybackground+", country="+country+", regdate="+regdate+", updatedate="+updatedate+", authCode="+authCode+", authStatus="+authStatus+", myimgdate="+myimgdate+", mybackgrounddate="+mybackgrounddate+"]";
	}
}
