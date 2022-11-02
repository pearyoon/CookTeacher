package com.kh.cook.notice.vo;

public class NoticeVo {
	
	public NoticeVo() {
		
	}
	
	
	public NoticeVo(String no, String writer, String title, String content, String enroll_date, String deleteYn,
			String modifyDate) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.modifyDate = modifyDate;
	}
	private String no;
	private String writer;
	private String title;
	private String content;
	private String enrollDate;
	private String deleteYn;
	private String modifyDate;
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


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	@Override
	public String toString() {
		return "NoticeVo [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", enroll_date=" + enrollDate + ", deleteYn=" + deleteYn + ", modifyDate=" + modifyDate + "]";
	}
	
	
}
