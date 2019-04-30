package com.monitor.vo;

import java.util.Date;

public class FriendVO {
	private int fbno;
	private String userid;
	private String following;
	private Date regdate;
	
	public int getFbno() {
		return fbno;
	}
	public void setFbno(int fbno) {
		this.fbno = fbno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String toString() {
		return "FriendVO [fbno="+fbno+", userid="+userid+", following="+following+", regdate="+regdate+"]";
	}
}
