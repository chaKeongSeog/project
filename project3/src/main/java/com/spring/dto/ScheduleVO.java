package com.spring.dto;

public class ScheduleVO {
	private int sno;
	private String title;
	private String startDate;
	private String endDate;
	private String id;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
		return "ScheduleVO [sno=" + sno + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", id=" + id + "]";
	}
	public ScheduleVO(int sno, String title, String startDate, String endDate, String id) {
		super();
		this.sno = sno;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.id = id;
	}
	public ScheduleVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
