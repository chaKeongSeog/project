package com.spring.dto;

import java.util.List;

public class GroupVOList {
	private int gno;
    private String id;
    private String name; 
    private String goal; 
    private String code;
    private String memberName;
    private String fileName;
    
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "GroupVO2 [gno=" + gno + ", id=" + id + ", name=" + name + ", goal=" + goal + ", code=" + code
				+ ", memberName=" + memberName + ", fileName=" + fileName + "]";
	}
	public GroupVOList(int gno, String id, String name, String goal, String code, String memberName, String fileName) {
		super();
		this.gno = gno;
		this.id = id;
		this.name = name;
		this.goal = goal;
		this.code = code;
		this.memberName = memberName;
		this.fileName = fileName;
	}
	public GroupVOList() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}
