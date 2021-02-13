package com.spring.dto;

import java.util.List;

public class GroupBoardListVO {
	private int gbno;
	private int gno;
	private String title;
	private String id;
	private String content;
	private String regdate;
	private int hit;
	private int good;
	private int bad;
	private String name;
	private String fileName;
	private List<GroupAttachVO> groupAttachVOList;
	
	public int getGbno() {
		return gbno;
	}
	public void setGbno(int gbno) {
		this.gbno = gbno;
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
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
	public List<GroupAttachVO> getGroupAttachVOList() {
		return groupAttachVOList;
	}
	public void setGroupAttachVOList(List<GroupAttachVO> groupAttachVOList) {
		this.groupAttachVOList = groupAttachVOList;
	}
	@Override
	public String toString() {
		return "GroupBoardListVO [gbno=" + gbno + ", gno=" + gno + ", title=" + title + ", id=" + id + ", content="
				+ content + ", regdate=" + regdate + ", hit=" + hit + ", good=" + good + ", bad=" + bad + ", name="
				+ name + ", fileName=" + fileName + "]";
	}
	
}
