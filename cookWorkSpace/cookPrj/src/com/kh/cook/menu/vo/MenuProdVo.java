package com.kh.cook.menu.vo;

public class MenuProdVo {
	private String prodNo;
	private String no;
	public MenuProdVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuProdVo(String prodNo, String no) {
		super();
		this.prodNo = prodNo;
		this.no = no;
	}
	@Override
	public String toString() {
		return "MenuProdVo [prodNo=" + prodNo + ", no=" + no + "]";
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	
	
}
