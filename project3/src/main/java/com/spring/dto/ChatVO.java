package com.spring.dto;

import java.sql.Date;


public class ChatVO {
    private int cno;
    private String fromID;
    private String toID;
    private String content;
    private String  regdate;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
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
		return "ChatVO [cno=" + cno + ", fromID=" + fromID + ", toID=" + toID + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	public ChatVO(int cno, String fromID, String toID, String content, String regdate) {
		super();
		this.cno = cno;
		this.fromID = fromID;
		this.toID = toID;
		this.content = content;
		this.regdate = regdate;
	}
	public ChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
	   
	   
	   
	   
}
