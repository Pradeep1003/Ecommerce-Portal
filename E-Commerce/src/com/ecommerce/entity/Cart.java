package com.ecommerce.entity;

public class Cart {
	int id;
	int productId;
	int customerId;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public void setId(int id) {
		this.id = id;
	}
}
