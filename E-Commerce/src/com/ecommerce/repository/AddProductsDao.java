package com.ecommerce.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.entity.ProductBean;
import com.ecommerce.utility.DbConnection;

public class AddProductsDao {
	public static int addProducts(ProductBean product) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con
				.prepareStatement("insert into product (imgUrl, price, discounts, productType) value(?,?,?,?)");
		ps.setString(1, product.getImgUrl());
		ps.setInt(2, product.getPrice());
		ps.setInt(3, product.getDiscounts());
		ps.setString(4, product.getProductType());
		int status = ps.executeUpdate();
		System.out.println(ps);

		return status;

	}
}
