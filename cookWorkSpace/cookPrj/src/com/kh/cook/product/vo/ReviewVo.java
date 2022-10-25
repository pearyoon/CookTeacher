package com.kh.cook.product.vo;

public class ReviewVo {
	

	public ReviewVo() {
		
	}
	
	public ReviewVo(String reviewNo, String no, String prodNo, String enrollDate, String modifyDate, String deleteYn,
			String content, String name, String nick) {
		super();
		this.reviewNo = reviewNo;
		this.no = no;
		this.prodNo = prodNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.deleteYn = deleteYn;
		this.content = content;
		this.name = name;
		this.nick = nick;
	}
	
	//field
	private String reviewNo;
	private String no;
	private String prodNo;
	private String enrollDate;
	private String modifyDate;
	private String deleteYn;
	private String content;
	private String name;
	private String nick;
	
	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	@Override
	public String toString() {
		return "ReviewVo [reviewNo=" + reviewNo + ", no=" + no + ", prodNo=" + prodNo + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", deleteYn=" + deleteYn + ", content=" + content + ", name=" + name
				+ ", nick=" + nick + "]";
	}
	
	
	


	

}
