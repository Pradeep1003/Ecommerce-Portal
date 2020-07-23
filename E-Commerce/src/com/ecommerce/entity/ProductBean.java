package com.ecommerce.entity;

public class ProductBean {
	private int id;
	private String imgUrl;
	private int price;
	private int discounts;
	private String productType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscounts() {
		return discounts;
	}

	public void setDiscounts(int discounts) {
		this.discounts = discounts;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

}
