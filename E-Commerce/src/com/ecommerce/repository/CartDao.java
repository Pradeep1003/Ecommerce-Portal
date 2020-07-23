package com.ecommerce.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.entity.Cart;
import com.ecommerce.utility.DbConnection;

public class CartDao {

	public static int addToCart(Cart cart) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con.prepareStatement("insert into cart (productId, customerId) value(?,?)");
		ps.setInt(1, cart.getProductId());
		ps.setInt(2, cart.getCustomerId());
		int status = ps.executeUpdate();

		return status;
	}

	public static ResultSet getProductsByUserId(Integer customerId)
			throws SQLException, ClassNotFoundException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con.prepareStatement(
				"select * from product where id in (select productId from cart where customerId = " + customerId + ")");
		ResultSet set = ps.executeQuery();
		System.out.println(ps);
		return set;
	}

	public static int removeFromCart(Integer productId) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con.prepareStatement("delete from cart where productId = " + productId);
		int status = ps.executeUpdate();

		return status;
	}

}
