package com.kh.cook.report.vo;

public class ReportVo {

	
	

	public ReportVo() {
		super();
	}
	public ReportVo(String no, String type, String writer, String hit, String reportTime, String status) {
		super();
		this.no = no;
		this.type = type;
		this.writer = writer;
		this.hit = hit;
		this.reportTime = reportTime;
		this.status = status;
	}

	private String no;
	private String type;
	private String writer;
	private String hit;
	private String reportTime;
	private String status;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReportTime() {
		return reportTime;
	}
	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "ReportVo [no=" + no + ", type=" + type + ", writer=" + writer + ", hit=" + hit + ", reportTime="
				+ reportTime + ", status=" + status + "]";
	}
	
	
	
	
}
