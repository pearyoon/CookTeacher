package com.kh.cook.menu.vo;

public class MenuCateVo {
	
	private String menuCateNo;
	private String menuType;
	public MenuCateVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuCateVo(String menuCateNo, String menuType) {
		super();
		this.menuCateNo = menuCateNo;
		this.menuType = menuType;
	}
	@Override
	public String toString() {
		return "MenuCateVo [menuCateNo=" + menuCateNo + ", menuType=" + menuType + "]";
	}
	public String getMenuCateNo() {
		return menuCateNo;
	}
	public void setMenuCateNo(String menuCateNo) {
		this.menuCateNo = menuCateNo;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	
	
	
}
