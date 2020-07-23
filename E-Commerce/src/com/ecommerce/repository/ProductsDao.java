package com.ecommerce.repository;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.entity.AdminLoginBean;
import com.ecommerce.utility.DbConnection;

public class ProductsDao {
	public static ResultSet getProducts() throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con.prepareStatement("select * from product");
		ResultSet set = ps.executeQuery();

		return set;
	}

	public static ResultSet getProducts(String productType) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con
				.prepareStatement("select * from product where productType like '%" + productType + "%'");
		ResultSet set = ps.executeQuery();

		return set;
	}

	public static ResultSet getProductTypes() throws SQLException, ClassNotFoundException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con.prepareStatement("select distinct productType from product");
		ResultSet set = ps.executeQuery();

		return set;
	}
}
