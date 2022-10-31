package com.kh.cook.menu.vo;

public class MenuWriteVo {
	
	private String no;
	private String menuCateNo;
	private String menuName;
	private String menuInfo;
	private String recipe;
	private String cal;
	private String recommend;
	private String menuProd;
	public MenuWriteVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuWriteVo(String no, String menuCateNo, String menuName, String menuInfo, String recipe, String cal,
			String recommend, String menuProd) {
		super();
		this.no = no;
		this.menuCateNo = menuCateNo;
		this.menuName = menuName;
		this.menuInfo = menuInfo;
		this.recipe = recipe;
		this.cal = cal;
		this.recommend = recommend;
		this.menuProd = menuProd;
	}
	@Override
	public String toString() {
		return "MenuWriteVo [no=" + no + ", menuCateNo=" + menuCateNo + ", menuName=" + menuName + ", menuInfo="
				+ menuInfo + ", recipe=" + recipe + ", cal=" + cal + ", recommend=" + recommend + ", menuProd="
				+ menuProd + "]";
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getMenuCateNo() {
		return menuCateNo;
	}
	public void setMenuCateNo(String menuCateNo) {
		this.menuCateNo = menuCateNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	public String getCal() {
		return cal;
	}
	public void setCal(String cal) {
		this.cal = cal;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getMenuProd() {
		return menuProd;
	}
	public void setMenuProd(String menuProd) {
		this.menuProd = menuProd;
	}
	
}
