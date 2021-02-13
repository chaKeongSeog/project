package com.spring.dto;

public class AttachVO {
	private int ano;
	private int bno;
	private String originFileName;
	private String fileName;
	private String path;
	private String id;
	private String regdate;
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
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
		return "AttachVO [ano=" + ano + ", bno=" + bno + ", originFileName=" + originFileName + ", fileName=" + fileName
				+ ", path=" + path + ", id=" + id + ", regdate=" + regdate + "]";
	}
	public AttachVO(int ano, int bno, String originFileName, String fileName, String path, String id, String regdate) {
		super();
		this.ano = ano;
		this.bno = bno;
		this.originFileName = originFileName;
		this.fileName = fileName;
		this.path = path;
		this.id = id;
		this.regdate = regdate;
	}
	public AttachVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
