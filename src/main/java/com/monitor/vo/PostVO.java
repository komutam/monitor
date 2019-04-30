package com.monitor.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PostVO {
	private int pbno;
	private String puserid;
	private String tag;
	private String content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy/MM/dd")
	private Date regdate;
	private int viewcnt;
	private int replycnt;
	private int good;
	private int remoni;
	
	private String files;
	private int mediatype;
	
	public int getMediatype() {
		return mediatype;
	}
	public void setMediatype(int mediatype) {
		this.mediatype = mediatype;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public int getPbno() {
		return pbno;
	}
	public void setPbno(int pbno) {
		this.pbno = pbno;
	}
	public String getPuserid() {
		return puserid;
	}
	public void setPuserid(String puserid) {
		this.puserid = puserid;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getRemoni() {
		return remoni;
	}
	public void setRemoni(int remoni) {
		this.remoni = remoni;
	}
	
	@Override
	public String toString() {
		return "PostVO [pbno="+pbno+", puserid="+puserid+", tag="+tag+", content="+content+", regdate="+regdate+", viewcnt="+viewcnt+", replycnt="+replycnt+", good="+good+", remoni="+remoni+", files="+files+", mediatype="+mediatype+"]";
	}
}
