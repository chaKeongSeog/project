package com.spring.dto;

public class GroupAttachVO {
	private int gano;
	private int gbno;
	private int gno;
	private String originfileName;
	private String fileName;
	private String path;
	private String id;
	private String regdate;
	public int getGano() {
		return gano;
	}
	public void setGano(int gano) {
		this.gano = gano;
	}
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
	public String getOriginfileName() {
		return originfileName;
	}
	public void setOriginfileName(String originfileName) {
		this.originfileName = originfileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
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
	@Override
	public String toString() {
		return "GroupAttachVO [gano=" + gano + ", gbno=" + gbno + ", gno=" + gno + ", originfileName=" + originfileName
				+ ", fileName=" + fileName + ", path=" + path + ", id=" + id + ", regdate=" + regdate + "]";
	}
	public GroupAttachVO(int gano, int gbno, int gno, String originfileName, String fileName, String path, String id,
			String regdate) {
		super();
		this.gano = gano;
		this.gbno = gbno;
		this.gno = gno;
		this.originfileName = originfileName;
		this.fileName = fileName;
		this.path = path;
		this.id = id;
		this.regdate = regdate;
	}
	public GroupAttachVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
