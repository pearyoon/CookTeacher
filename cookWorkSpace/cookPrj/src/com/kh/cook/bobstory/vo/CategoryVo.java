package com.kh.cook.bobstory.vo;

public class CategoryVo {

	public CategoryVo() {
		super();
	}
	public CategoryVo(String menu_cate_no, String menu_type) {
		super();
		this.menu_cate_no = menu_cate_no;
		this.menu_type = menu_type;
	}
	private String menu_cate_no;
	private String menu_type;
	
	public String getMenu_cate_no() {
		return menu_cate_no;
	}
	public void setMenu_cate_no(String menu_cate_no) {
		this.menu_cate_no = menu_cate_no;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	@Override
	public String toString() {
		return "CategoryVo [menu_cate_no=" + menu_cate_no + ", menu_type=" + menu_type + "]";
	}
	
	
	
}
