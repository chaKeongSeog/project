package com.spring.dto;

public class MemoVO {
	private int mno;
	private int gno;
	private String content;
	private String id;
	private String regdate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemoVO [mno=" + mno + ", gno=" + gno + ", content=" + content + ", id=" + id + ", regdate=" + regdate
				+ "]";
	}
	public MemoVO(int mno, int gno, String content, String id, String regdate) {
		super();
		this.mno = mno;
		this.gno = gno;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
	}
	public MemoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
