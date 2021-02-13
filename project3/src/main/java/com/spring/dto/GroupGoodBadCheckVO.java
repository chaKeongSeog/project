package com.spring.dto;

public class GroupGoodBadCheckVO {
	private int glno       ;
	private String id         ;
	private int gbno       ;
	private String regdate    ;
	public int getGlno() {
		return glno;
	}
	public void setGlno(int glno) {
		this.glno = glno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGbno() {
		return gbno;
	}
	public void setGbno(int gbno) {
		this.gbno = gbno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "GroupLikeCheckVO [glno=" + glno + ", id=" + id + ", gbno=" + gbno + ", regdate=" + regdate + "]";
	}
	public GroupGoodBadCheckVO(int glno, String id, int gbno, String regdate) {
		super();
		this.glno = glno;
		this.id = id;
		this.gbno = gbno;
		this.regdate = regdate;
	}
	public GroupGoodBadCheckVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
