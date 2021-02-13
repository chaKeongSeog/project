package com.spring.dto;

public class GroupChatListVO {
	private int gcno;
    private int gno;
    private String content;
    private String id;
    private String regdate;
    private String name;
    private String fileName;
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
		return "GroupChatListVO [gcno=" + gcno + ", gno=" + gno + ", content=" + content + ", id=" + id + ", regdate="
				+ regdate + ", name=" + name + ", fileName=" + fileName + "]";
	}
	public GroupChatListVO(int gcno, int gno, String content, String id, String regdate, String name, String fileName) {
		super();
		this.gcno = gcno;
		this.gno = gno;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
		this.name = name;
		this.fileName = fileName;
	}
	public GroupChatListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}
