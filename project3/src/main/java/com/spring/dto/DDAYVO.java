package com.spring.dto;

public class DDAYVO {
	private int dno;
	private int gno;
	private String content;
	private String id;
	private String grdate;
	private int year;
	private int month;
	private int day;
	private String regdate;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGrdate() {
		return grdate;
	}
	public void setGrdate(String grdate) {
		this.grdate = grdate;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "DDAYVO [dno=" + dno + ", gno=" + gno + ", content=" + content + ", id=" + id + ", grdate=" + grdate
				+ ", year=" + year + ", month=" + month + ", day=" + day + ", regdate=" + regdate + "]";
	}
	public DDAYVO(int dno, int gno, String content, String id, String grdate, int year, int month, int day,
			String regdate) {
		super();
		this.dno = dno;
		this.gno = gno;
		this.content = content;
		this.id = id;
		this.grdate = grdate;
		this.year = year;
		this.month = month;
		this.day = day;
		this.regdate = regdate;
	}
	public DDAYVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
    
}
