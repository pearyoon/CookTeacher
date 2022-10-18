package com.kh.cook.menu.vo;

public class MenuVo {
	
	private String recipe;
	private String menuProd;
	private String cal;
	private String recommend;
	private String menuCateNo;
	private String no;
	private String menuName;
	private String menuInfo;
	private String imgPath;
	public MenuVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MenuVo(String recipe, String menuProd, String cal, String recommend, String menuCateNo, String no,
			String menuName, String menuInfo, String imgPath) {
		super();
		this.recipe = recipe;
		this.menuProd = menuProd;
		this.cal = cal;
		this.recommend = recommend;
		this.menuCateNo = menuCateNo;
		this.no = no;
		this.menuName = menuName;
		this.menuInfo = menuInfo;
		this.imgPath = imgPath;
	}
	@Override
	public String toString() {
		return "MenuVo [recipe=" + recipe + ", menuProd=" + menuProd + ", cal=" + cal + ", recommend=" + recommend
				+ ", menuCateNo=" + menuCateNo + ", no=" + no + ", menuName=" + menuName + ", menuInfo=" + menuInfo
				+ ", imgPath=" + imgPath + "]";
	}
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	public String getMenuProd() {
		return menuProd;
	}
	public void setMenuProd(String menuProd) {
		this.menuProd = menuProd;
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
	public String getMenuCateNo() {
		return menuCateNo;
	}
	public void setMenuCateNo(String menuCateNo) {
		this.menuCateNo = menuCateNo;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
	
}
