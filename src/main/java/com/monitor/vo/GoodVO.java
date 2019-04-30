package com.monitor.vo;

import java.util.Date;

public class GoodVO {
	private int gbno;
	private int pbno;
	private String guserid;
	private Date regdate;
	
	public int getGbno() {
		return gbno;
	}
	public void setGbno(int gbno) {
		this.gbno = gbno;
	}
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public String getGuserid() {
		return guserid;
	}
	public void setGuserid(String guserid) {
		this.guserid = guserid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String toString() {
		return "GoodVO [gbno="+gbno+", pbno="+pbno+", guserid="+guserid+", regdate="+regdate+"]";
	}
}
