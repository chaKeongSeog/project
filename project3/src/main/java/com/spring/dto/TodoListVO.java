package com.spring.dto;

public class TodoListVO {
	private int gtno;
	private int gmno;
	private int gno;
	private String title;
	private String content;
	private String id;
	private String vertify;
	private String regdate;
	public int getGtno() {
		return gtno;
	}
	public void setGtno(int gtno) {
		this.gtno = gtno;
	}
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVertify() {
		return vertify;
	}
	public void setVertify(String vertify) {
		this.vertify = vertify;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "TodoListVO [gtno=" + gtno + ", gmno=" + gmno + ", gno=" + gno + ", title=" + title + ", content="
				+ content + ", id=" + id + ", vertify=" + vertify + ", regdate=" + regdate + "]";
	}
	public TodoListVO(int gtno, int gmno, int gno, String title, String content, String id, String vertify,
			String regdate) {
		super();
		this.gtno = gtno;
		this.gmno = gmno;
		this.gno = gno;
		this.title = title;
		this.content = content;
		this.id = id;
		this.vertify = vertify;
		this.regdate = regdate;
	}
	public TodoListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
