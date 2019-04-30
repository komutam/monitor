package com.monitor.vo;

import java.util.Date;

public class AccountVO {
	private int abno;
	private String auserid;
	private int gt;
	private Date regdate;
	
	public int getAbno() {
		return abno;
	}
	public void setAbno(int abno) {
		this.abno = abno;
	}
	public String getAuserid() {
		return auserid;
	}
	public void setAuserid(String auserid) {
		this.auserid = auserid;
	}
	public int getGt() {
		return gt;
	}
	public void setGt(int gt) {
		this.gt = gt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "AccountVO [abno="+abno+", auserid="+auserid+", gt="+gt+", regdate="+regdate+"]";
	}
}
