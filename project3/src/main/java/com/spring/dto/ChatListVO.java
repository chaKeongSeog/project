package com.spring.dto;

public class ChatListVO {
	   private int cno;
	   private String fromID;
	   private String toID;
	   private String content;
	   private String  regdate;
	   private String fileName;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "ChatListVO [cno=" + cno + ", fromID=" + fromID + ", toID=" + toID + ", content=" + content
				+ ", regdate=" + regdate + ", fileName=" + fileName + "]";
	}
	public ChatListVO(int cno, String fromID, String toID, String content, String regdate, String fileName) {
		super();
		this.cno = cno;
		this.fromID = fromID;
		this.toID = toID;
		this.content = content;
		this.regdate = regdate;
		this.fileName = fileName;
	}
	public ChatListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	   
	   
}
