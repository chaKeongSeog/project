package com.spring.dto;

public class GroupScheduleVO {
	private int sno          ;
	private int gno          ;
	private String title        ;
	private String startDate    ;
	private String endDate      ;
	private String id           ;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "GroupScheduleVO [sno=" + sno + ", gno=" + gno + ", title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", id=" + id + "]";
	}
	public GroupScheduleVO(int sno, int gno, String title, String startDate, String endDate, String id) {
		super();
		this.sno = sno;
		this.gno = gno;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.id = id;
	}
	public GroupScheduleVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
