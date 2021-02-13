package com.spring.dto;

public class MemberListVO {
	private String id;         ;
	private String pwd         ;
	private String name        ;
	private String email       ;
	private String tel         ;
	private String regdate     ;
	private String authority   ;
	private String fileName    ;
	private String kind        ;
	private int room           ;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	@Override
	public String toString() {
		return "MemberListVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", tel=" + tel
				+ ", regdate=" + regdate + ", authority=" + authority + ", fileName=" + fileName + ", kind=" + kind
				+ ", room=" + room + "]";
	}
	public MemberListVO(String id, String pwd, String name, String email, String tel, String regdate, String authority,
			String fileName, String kind, int room) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.regdate = regdate;
		this.authority = authority;
		this.fileName = fileName;
		this.kind = kind;
		this.room = room;
	}
	public MemberListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	     
}
