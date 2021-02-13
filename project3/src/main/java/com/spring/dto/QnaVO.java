package com.spring.dto;

import java.sql.Date;
import java.util.List;

public class QnaVO {
	private int bno         ;
	private String title       ;
	private String id          ;
	private String content     ;
	private Date regdate     ;
	private String name;
	private String fileName;
	private List<ReplyVO> replyList;
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
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	@Override
	public String toString() {
		return "QnaVO [bno=" + bno + ", title=" + title + ", id=" + id + ", content=" + content + ", regdate=" + regdate
				+ ", name=" + name + ", fileName=" + fileName + ", replyList=" + replyList + "]";
	}
	public QnaVO(int bno, String title, String id, String content, Date regdate, String name, String fileName,
			List<ReplyVO> replyList) {
		super();
		this.bno = bno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.name = name;
		this.fileName = fileName;
		this.replyList = replyList;
	}
	public QnaVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
