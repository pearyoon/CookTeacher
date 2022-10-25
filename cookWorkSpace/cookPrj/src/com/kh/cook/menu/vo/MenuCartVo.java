package com.kh.cook.menu.vo;

public class MenuCartVo {
	private String prodNo;
	private String prodCnt;
	public MenuCartVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuCartVo(String prodNo, String prodCnt) {
		super();
		this.prodNo = prodNo;
		this.prodCnt = prodCnt;
	}
	@Override
	public String toString() {
		return "MenuCartVo [prodNo=" + prodNo + ", prodCnt=" + prodCnt + "]";
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
	
	
}
