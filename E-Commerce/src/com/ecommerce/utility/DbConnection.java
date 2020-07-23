package com.ecommerce.utility;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	String driver;
	String url;
	String username;
	String password;

	public static Connection connect() throws SQLException, ClassNotFoundException, IOException {

		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/ecommerce?characterEncoding=latin1&useConfigs=maxPerformance", "root",
					"password");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;

	}

}
