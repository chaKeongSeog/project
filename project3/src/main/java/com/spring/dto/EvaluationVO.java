package com.spring.dto;

public class EvaluationVO {
	private int eno             ;
	private String id              ;
	private int ref             ;
	private int ref_step         ;
	private int ref_level        ;
	private String lecturename     ;
	private String professorname   ;
	private String year            ;
	private String month           ;
	private String divide          ;
	private String title           ;
	private String content         ;
	private String totalscore      ;
	private String likecount       ;
	private String brd_gb          ;
	private String regdate;
	private String name;
	private String fileName;
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getLecturename() {
		return lecturename;
	}
	public void setLecturename(String lecturename) {
		this.lecturename = lecturename;
	}
	public String getProfessorname() {
		return professorname;
	}
	public void setProfessorname(String professorname) {
		this.professorname = professorname;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDivide() {
		return divide;
	}
	public void setDivide(String divide) {
		this.divide = divide;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(String totalscore) {
		this.totalscore = totalscore;
	}
	public String getLikecount() {
		return likecount;
	}
	public void setLikecount(String likecount) {
		this.likecount = likecount;
	}
	public String getBrd_gb() {
		return brd_gb;
	}
	public void setBrd_gb(String brd_gb) {
		this.brd_gb = brd_gb;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
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
	@Override
	public String toString() {
		return "EvaluationVO [eno=" + eno + ", id=" + id + ", ref=" + ref + ", ref_step=" + ref_step + ", ref_level="
				+ ref_level + ", lecturename=" + lecturename + ", professorname=" + professorname + ", year=" + year
				+ ", month=" + month + ", divide=" + divide + ", title=" + title + ", content=" + content
				+ ", totalscore=" + totalscore + ", likecount=" + likecount + ", brd_gb=" + brd_gb + ", regdate="
				+ regdate + ", name=" + name + ", fileName=" + fileName + "]";
	}
	public EvaluationVO(int eno, String id, int ref, int ref_step, int ref_level, String lecturename,
			String professorname, String year, String month, String divide, String title, String content,
			String totalscore, String likecount, String brd_gb, String regdate, String name, String fileName) {
		super();
		this.eno = eno;
		this.id = id;
		this.ref = ref;
		this.ref_step = ref_step;
		this.ref_level = ref_level;
		this.lecturename = lecturename;
		this.professorname = professorname;
		this.year = year;
		this.month = month;
		this.divide = divide;
		this.title = title;
		this.content = content;
		this.totalscore = totalscore;
		this.likecount = likecount;
		this.brd_gb = brd_gb;
		this.regdate = regdate;
		this.name = name;
		this.fileName = fileName;
	}
	public EvaluationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
