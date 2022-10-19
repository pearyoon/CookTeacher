package com.kh.cook.product.vo;

public class ProductVo {

	//생성자
	public ProductVo() {
		
	}
	
	public ProductVo(String prodNo, String cateNo, String name, String info, String price, String weight, String stock,
			String imgPath) {
		super();
		this.prodNo = prodNo;
		this.cateNo = cateNo;
		this.name = name;
		this.info = info;
		this.price = price;
		this.weight = weight;
		this.stock = stock;
		this.imgPath = imgPath;
	}
	
	//field
	private String prodNo;
	private String cateNo;
	private String name;
	private String info;
	private String price;
	private String weight;
	private String stock;
	private String imgPath;
	
	//getter, setter
	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public String getCateNo() {
		return cateNo;
	}

	public void setCateNo(String cateNo) {
		this.cateNo = cateNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	//toString
	@Override
	public String toString() {
		return "ProductVo [prodNo=" + prodNo + ", cateNo=" + cateNo + ", name=" + name + ", info=" + info + ", price="
				+ price + ", weight=" + weight + ", stock=" + stock + ", imgPath=" + imgPath + "]";
	}
	
	
	
}
