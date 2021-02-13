package com.spring.dto;

public class GroupBoardVO {
	private int gbno            ;
	private int gno             ;
	private String title           ;
	private String id              ;
	private String content         ;
	private String regdate         ;
	private int hit             ;
	private int good;
	private int bad;
	public int getGbno() {
		return gbno;
	}
	public void setGbno(int gbno) {
		this.gbno = gbno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	@Override
	public String toString() {
		return "GroupBoardVO [gbno=" + gbno + ", gno=" + gno + ", title=" + title + ", id=" + id + ", content="
				+ content + ", regdate=" + regdate + ", hit=" + hit + ", good=" + good + ", bad=" + bad + "]";
	}
	public GroupBoardVO(int gbno, int gno, String title, String id, String content, String regdate, int hit, int good,
			int bad) {
		super();
		this.gbno = gbno;
		this.gno = gno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.good = good;
		this.bad = bad;
	}
	public GroupBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
