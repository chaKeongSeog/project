package com.spring.dto;

import java.sql.Date;

public class AttachListVO {
	private int ano;
	private int bno;
	private String title;
	private String id;
	private String content;
	private int ref;
	private int ref_step;
	private int ref_level;
	private Date regdate;
	private int hit;
	private String brd_gb;
	private String name;
	private String m_fileName;
	private String path;
	private String a_fileName;
	private String a_regdate;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}
	public int getRef_level() {
		return ref_level;
	}
	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getBrd_gb() {
		return brd_gb;
	}
	public void setBrd_gb(String brd_gb) {
		this.brd_gb = brd_gb;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getM_fileName() {
		return m_fileName;
	}
	public void setM_fileName(String m_fileName) {
		this.m_fileName = m_fileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getA_fileName() {
		return a_fileName;
	}
	public void setA_fileName(String a_fileName) {
		this.a_fileName = a_fileName;
	}
	public String getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(String a_regdate) {
		this.a_regdate = a_regdate;
	}
	@Override
	public String toString() {
		return "AttachListVO [ano=" + ano + ", bno=" + bno + ", title=" + title + ", id=" + id + ", content=" + content
				+ ", ref=" + ref + ", ref_step=" + ref_step + ", ref_level=" + ref_level + ", regdate=" + regdate
				+ ", hit=" + hit + ", brd_gb=" + brd_gb + ", name=" + name + ", m_fileName=" + m_fileName + ", path="
				+ path + ", a_fileName=" + a_fileName + ", a_regdate=" + a_regdate + "]";
	}
	public AttachListVO(int ano, int bno, String title, String id, String content, int ref, int ref_step, int ref_level,
			Date regdate, int hit, String brd_gb, String name, String m_fileName, String path, String a_fileName,
			String a_regdate) {
		super();
		this.ano = ano;
		this.bno = bno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.ref = ref;
		this.ref_step = ref_step;
		this.ref_level = ref_level;
		this.regdate = regdate;
		this.hit = hit;
		this.brd_gb = brd_gb;
		this.name = name;
		this.m_fileName = m_fileName;
		this.path = path;
		this.a_fileName = a_fileName;
		this.a_regdate = a_regdate;
	}
	public AttachListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
