package com.spring.dto;

public class GroupVO {
	private int gno;
    private String id;
    private String name; 
    private String goal; 
    private String code;
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
	@Override
	public String toString() {
		return "GroupVO [gno=" + gno + ", id=" + id + ", name=" + name + ", goal=" + goal + ", code=" + code + "]";
	}
	public GroupVO(int gno, String id, String name, String goal, String code) {
		super();
		this.gno = gno;
		this.id = id;
		this.name = name;
		this.goal = goal;
		this.code = code;
	}
	public GroupVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
    
    
    
    
}
