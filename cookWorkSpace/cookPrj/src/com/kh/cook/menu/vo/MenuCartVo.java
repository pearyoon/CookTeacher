package com.kh.cook.menu.vo;

public class MenuCartVo {
	private String prodNo;
	private String prodCnt;
	private String no;
	public MenuCartVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuCartVo(String prodNo, String prodCnt, String no) {
		super();
		this.prodNo = prodNo;
		this.prodCnt = prodCnt;
		this.no = no;
	}
	@Override
	public String toString() {
		return "MenuCartVo [prodNo=" + prodNo + ", prodCnt=" + prodCnt + ", no=" + no + "]";
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdCnt() {
		return prodCnt;
	}
	public void setProdCnt(String prodCnt) {
		this.prodCnt = prodCnt;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	
	
}
