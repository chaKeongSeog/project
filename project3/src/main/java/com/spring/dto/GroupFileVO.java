package com.spring.dto;

public class GroupFileVO {
    private int fno          ;
    private String fileName     ;
    private String originFileName;
    private String fileType     ;
    private String uploadPath   ;
    private String id           ;
    private int gno          ;
    private String regdate      ;
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "GroupFileVO [fno=" + fno + ", fileName=" + fileName + ", originFileName=" + originFileName
				+ ", fileType=" + fileType + ", uploadPath=" + uploadPath + ", id=" + id + ", gno=" + gno + ", regdate="
				+ regdate + "]";
	}
	public GroupFileVO(int fno, String fileName, String originFileName, String fileType, String uploadPath, String id,
			int gno, String regdate) {
		super();
		this.fno = fno;
		this.fileName = fileName;
		this.originFileName = originFileName;
		this.fileType = fileType;
		this.uploadPath = uploadPath;
		this.id = id;
		this.gno = gno;
		this.regdate = regdate;
	}
	public GroupFileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
	
    
    
    
}
