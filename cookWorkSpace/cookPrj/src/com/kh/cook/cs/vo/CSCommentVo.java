package com.kh.cook.cs.vo;

public class CSCommentVo {
	
	private String cmtNo;
	private String QpostNo;
	private String writerNo;
	private String cmtContent;
	private String cmtDate;
	private String deleteYN;
	
	public String getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(String cmtNo) {
		this.cmtNo = cmtNo;
	}
	public String getQpostNo() {
		return QpostNo;
	}
	public void setQpostNo(String qpostNo) {
		QpostNo = qpostNo;
	}
	public String getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(String cmtDate) {
		this.cmtDate = cmtDate;
	}
	public String getDeleteYN() {
		return deleteYN;
	}
	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	@Override
	public String toString() {
		return "CSCommentVo [cmtNo=" + cmtNo + ", QpostNo=" + QpostNo + ", writerNo=" + writerNo + ", cmtContent="
				+ cmtContent + ", cmtDate=" + cmtDate + ", deleteYN=" + deleteYN + ", editDate=" + editDate + "]";
	}
	public CSCommentVo(String cmtNo, String qpostNo, String writerNo, String cmtContent, String cmtDate,
			String deleteYN, String editDate) {
		super();
		this.cmtNo = cmtNo;
		QpostNo = qpostNo;
		this.writerNo = writerNo;
		this.cmtContent = cmtContent;
		this.cmtDate = cmtDate;
		this.deleteYN = deleteYN;
		this.editDate = editDate;
	}
	public CSCommentVo() {
		super();
	}

	
}
