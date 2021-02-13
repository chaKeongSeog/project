package com.spring.dto;

public class GroupMemberVO {
	private int  gmno;
	private int  gno;
	private String  id;
	public int getGmno() {
		return gmno;
	}
	public void setGmno(int gmno) {
		this.gmno = gmno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "GroupMemberVO [gmno=" + gmno + ", gno=" + gno + ", id=" + id + "]";
	}
	public GroupMemberVO(int gmno, int gno, String id) {
		super();
		this.gmno = gmno;
		this.gno = gno;
		this.id = id;
	}
	public GroupMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
