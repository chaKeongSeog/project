package com.spring.dto;

import java.sql.Date;

public class BoardListVO {
	private int bno         ;
	private String title       ;
	private String id          ;
	private String content     ;
	private int ref             ;
	private int ref_step         ;
	private int ref_level        ;
	private Date regdate     ;
	private int hit         ;
	private String brd_gb      ;
	private String name;
	private String fileName;
	private int attachCount;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getBrd_gb() {
		return brd_gb;
	}
	public void setBrd_gb(String brd_gb) {
		this.brd_gb = brd_gb;
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
	public int getAttachCount() {
		return attachCount;
	}
	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}
	@Override
	public String toString() {
		return "BoardListVO [bno=" + bno + ", title=" + title + ", id=" + id + ", content=" + content + ", ref=" + ref
				+ ", ref_step=" + ref_step + ", ref_level=" + ref_level + ", regdate=" + regdate + ", hit=" + hit
				+ ", brd_gb=" + brd_gb + ", name=" + name + ", fileName=" + fileName + ", attachCount=" + attachCount
				+ "]";
	}
	public BoardListVO(int bno, String title, String id, String content, int ref, int ref_step, int ref_level,
			Date regdate, int hit, String brd_gb, String name, String fileName, int attachCount) {
		super();
		this.bno = bno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.ref = ref;
		this.ref_step = ref_step;
		this.ref_level = ref_level;
		this.regdate = regdate;
		this.hit = hit;
		this.brd_gb = brd_gb;
		this.name = name;
		this.fileName = fileName;
		this.attachCount = attachCount;
	}
	public BoardListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
