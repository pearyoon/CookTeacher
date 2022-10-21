package com.kh.cook.bobstory.vo;

public class BobstoryVo {

	public BobstoryVo() {
		super();
	}
	public BobstoryVo(String no, String writer, String category, String title, String content, String enrollDate,
			String deleteYn, String cLike, String modifyDate, String viewCount, String reportYn) {
		super();
		this.no = no;
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.cLike = cLike;
		this.modifyDate = modifyDate;
		this.viewCount = viewCount;
		this.reportYn = reportYn;
	}
	private String no;
	private String writer;
	private String category;
	private String title;
	private String content;
	private String enrollDate;
	private String deleteYn;
	private String cLike;
	private String modifyDate;
	private String viewCount;
	private String reportYn;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getcLike() {
		return cLike;
	}
	public void setcLike(String cLike) {
		this.cLike = cLike;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getViewCount() {
		return viewCount;
	}
	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}
	public String getReportYn() {
		return reportYn;
	}
	public void setReportYn(String reportYn) {
		this.reportYn = reportYn;
	}
	@Override
	public String toString() {
		return "BobstoryVo [no=" + no + ", writer=" + writer + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", enrollDate=" + enrollDate + ", deleteYn=" + deleteYn + ", cLike=" + cLike
				+ ", modifyDate=" + modifyDate + ", viewCount=" + viewCount + ", reportYn=" + reportYn + "]";
	}
	
	
}
