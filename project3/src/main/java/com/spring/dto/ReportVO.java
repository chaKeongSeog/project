package com.spring.dto;

import java.sql.Date;

public class ReportVO {
	private int rpno       ;
	private String title      ;
	private String content    ;
	private Date regdate    ;
	private String id         ;
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ReportVO [rpno=" + rpno + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", id="
				+ id + "]";
	}
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportVO(int rpno, String title, String content, Date regdate, String id) {
		super();
		this.rpno = rpno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.id = id;
	}
	
	
}                             
