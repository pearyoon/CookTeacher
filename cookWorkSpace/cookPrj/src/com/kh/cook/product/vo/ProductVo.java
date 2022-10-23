package com.kh.cook.product.vo;

public class ProductVo {

	public ProductVo() {
		
	}
	
	public ProductVo(String prodNo, String cateNo, String name, String info, String detail, String price, String weight,
			String stock, String imgPath, String imgPath2, String imgPath3, String imgPath4) {
		super();
		this.prodNo = prodNo;
		this.cateNo = cateNo;
		this.name = name;
		this.info = info;
		this.detail = detail;
		this.price = price;
		this.weight = weight;
		this.stock = stock;
		this.imgPath = imgPath;
		this.imgPath2 = imgPath2;
		this.imgPath3 = imgPath3;
		this.imgPath4 = imgPath4;
	}

	//field
	private String prodNo;
	private String cateNo;
	private String name;
	private String info;
	private String detail;
	private String price;
	private String weight;
	private String stock;
	private String imgPath;
	private String imgPath2;
	private String imgPath3;
	private String imgPath4;
	
	
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	public String getImgPath2() {
		return imgPath2;
	}

	public void setImgPath2(String imgPath2) {
		this.imgPath2 = imgPath2;
	}

	public String getImgPath3() {
		return imgPath3;
	}

	public void setImgPath3(String imgPath3) {
		this.imgPath3 = imgPath3;
	}

	public String getImgPath4() {
		return imgPath4;
	}

	public void setImgPath4(String imgPath4) {
		this.imgPath4 = imgPath4;
	}

	@Override
	public String toString() {
		return "ProductVo [prodNo=" + prodNo + ", cateNo=" + cateNo + ", name=" + name + ", info=" + info + ", detail="
				+ detail + ", price=" + price + ", weight=" + weight + ", stock=" + stock + ", imgPath=" + imgPath
				+ ", imgPath2=" + imgPath2 + ", imgPath3=" + imgPath3 + ", imgPath4=" + imgPath4 + "]";
	}
	
	

	
}
