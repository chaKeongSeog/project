package com.spring.dto;

public class GroupOutListVO {
	private int gono     ;
	private int gno      ;
	private String id       ;
	private String regdate  ;
	public int getGono() {
		return gono;
	}
	public void setGono(int gono) {
		this.gono = gono;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "GroupOutListVO [gono=" + gono + ", gno=" + gno + ", id=" + id + ", regdate=" + regdate + "]";
	}
	public GroupOutListVO(int gono, int gno, String id, String regdate) {
		super();
		this.gono = gono;
		this.gno = gno;
		this.id = id;
		this.regdate = regdate;
	}
	public GroupOutListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
