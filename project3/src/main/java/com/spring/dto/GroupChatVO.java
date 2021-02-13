package com.spring.dto;

public class GroupChatVO {
	private int gcno;
    private int gno;
    private String content;
    private String id;
    private String regdate;
	public int getGcno() {
		return gcno;
	}
	public void setGcno(int gcno) {
		this.gcno = gcno;
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
		return "GroupChatVO [gcno=" + gcno + ", gno=" + gno + ", content=" + content + ", id=" + id + ", regdate="
				+ regdate + "]";
	}
	public GroupChatVO(int gcno, int gno, String content, String id, String regdate) {
		super();
		this.gcno = gcno;
		this.gno = gno;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
	}
	public GroupChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
    
}
