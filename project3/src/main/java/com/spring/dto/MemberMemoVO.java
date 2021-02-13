package com.spring.dto;

public class MemberMemoVO {
	private int mno;
	private String id;
	private String content;
	private String regdate;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
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
	@Override
	public String toString() {
		return "MemberMemoVO [mno=" + mno + ", id=" + id + ", content=" + content + ", regdate=" + regdate + "]";
	}
	public MemberMemoVO(int mno, String id, String content, String regdate) {
		super();
		this.mno = mno;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	public MemberMemoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
