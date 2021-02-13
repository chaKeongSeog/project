package com.spring.dto;

import java.sql.Date;

public class ReplyVO {
	private int rno        ;
	private int bno        ;
	private String id         ;
	private String content    ;
	private String brd_gb;
	private int ref;
	private int ref_step;
	private int ref_level;
	private Date regdate    ;
	private String name;
	private String fileName;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getBrd_gb() {
		return brd_gb;
	}
	public void setBrd_gb(String brd_gb) {
		this.brd_gb = brd_gb;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}
	public int getRef_level() {
		return ref_level;
	}
	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", id=" + id + ", content=" + content + ", brd_gb=" + brd_gb
				+ ", ref=" + ref + ", ref_step=" + ref_step + ", ref_level=" + ref_level + ", regdate=" + regdate
				+ ", name=" + name + ", fileName=" + fileName + "]";
	}
	public ReplyVO(int rno, int bno, String id, String content, String brd_gb, int ref, int ref_step, int ref_level,
			Date regdate, String name, String fileName) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.id = id;
		this.content = content;
		this.brd_gb = brd_gb;
		this.ref = ref;
		this.ref_step = ref_step;
		this.ref_level = ref_level;
		this.regdate = regdate;
		this.name = name;
		this.fileName = fileName;
	}
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	
	
	
}	
