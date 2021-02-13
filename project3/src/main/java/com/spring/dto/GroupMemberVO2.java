package com.spring.dto;

import java.util.List;

public class GroupMemberVO2 {
	private int  gmno;
	private int  gno;
	private String  id;
	private String fileName;
	private String memberName;
	private int novertifyCount;
	private List<TodoListVO> todoList;
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getNovertifyCount() {
		return novertifyCount;
	}
	public void setNovertifyCount(int novertifyCount) {
		this.novertifyCount = novertifyCount;
	}
	public List<TodoListVO> getTodoList() {
		return todoList;
	}
	public void setTodoList(List<TodoListVO> todoList) {
		this.todoList = todoList;
	}
	@Override
	public String toString() {
		return "GroupMemberVO2 [gmno=" + gmno + ", gno=" + gno + ", id=" + id + ", fileName=" + fileName
				+ ", memberName=" + memberName + ", novertifyCount=" + novertifyCount + ", todoList=" + todoList + "]";
	}
	public GroupMemberVO2(int gmno, int gno, String id, String fileName, String memberName, int novertifyCount,
			List<TodoListVO> todoList) {
		super();
		this.gmno = gmno;
		this.gno = gno;
		this.id = id;
		this.fileName = fileName;
		this.memberName = memberName;
		this.novertifyCount = novertifyCount;
		this.todoList = todoList;
	}
	public GroupMemberVO2() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
