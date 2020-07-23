package com.ecommerce.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ecommerce.entity.AdminLoginBean;
import com.ecommerce.entity.CustomerBean;
import com.ecommerce.utility.DbConnection;

public class LoginDao {
	static String password = null;

	public static String login(AdminLoginBean login) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con
				.prepareStatement("select password from admin where username = '" + login.getUsername() + "'");
		ResultSet set = ps.executeQuery();

		while (set.next()) {
			password = set.getString(1);
		}

		return password;
	}

	public static ResultSet customerLogin(CustomerBean login) throws ClassNotFoundException, SQLException, IOException {
		Connection con = DbConnection.connect();
		PreparedStatement ps = con
				.prepareStatement("select id, password from customer where username = '" + login.getUsername() + "'");
		ResultSet set = ps.executeQuery();

		return set;
	}

}
