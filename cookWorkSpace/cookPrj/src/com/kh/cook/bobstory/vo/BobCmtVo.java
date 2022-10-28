package com.kh.cook.bobstory.vo;

public class BobCmtVo {

	
	public BobCmtVo() {
		super();
	}
	public BobCmtVo(String cmtNo, String postNo, String writer, String cmt, String enrollDate, String modifyDate,
			String deleteYn, String reportYn) {
		super();
		this.cmtNo = cmtNo;
		this.postNo = postNo;
		this.writer = writer;
		this.cmt = cmt;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.deleteYn = deleteYn;
		this.reportYn = reportYn;
	}
	private String cmtNo;
	private String postNo;
	private String writer;
	private String cmt;
	private String enrollDate;
	private String modifyDate;
	private String deleteYn;
	private String reportYn;
	
	public String getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(String cmtNo) {
		this.cmtNo = cmtNo;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getReportYn() {
		return reportYn;
	}
	public void setReportYn(String reportYn) {
		this.reportYn = reportYn;
	}
	
	@Override
	public String toString() {
		return "BobCmtVo [cmtNo=" + cmtNo + ", postNo=" + postNo + ", writer=" + writer + ", cmt=" + cmt
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", deleteYn=" + deleteYn + ", reportYn="
				+ reportYn + "]";
	}
	
	

	
}
