package com.spring.dto;

public class DDitMemberVO {
	private String dno          ;
	private String name         ;
	private String addr1        ;
	private String addr2        ;
	private String tel          ;
	private String room         ;
	private String id           ;
	private String regdate      ;
	private String fileName;
	private String kind;
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
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
	@Override
	public String toString() {
		return "DDitMemberVO [dno=" + dno + ", name=" + name + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel
				+ ", room=" + room + ", id=" + id + ", regdate=" + regdate + ", fileName=" + fileName + ", kind=" + kind
				+ "]";
	}
	public DDitMemberVO(String dno, String name, String addr1, String addr2, String tel, String room, String id,
			String regdate, String fileName, String kind) {
		super();
		this.dno = dno;
		this.name = name;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.tel = tel;
		this.room = room;
		this.id = id;
		this.regdate = regdate;
		this.fileName = fileName;
		this.kind = kind;
	}
	public DDitMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}                               
