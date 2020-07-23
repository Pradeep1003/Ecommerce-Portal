package com.ecommerce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.repository.ProductsDao;

/**
 * Servlet implementation class getProducts
 */
@WebServlet("/getProducts")
public class getProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ResultSet products = ProductsDao.getProducts();
			ArrayList Rows = new ArrayList();

			while (products.next()) {
				ArrayList row = new ArrayList();
				for (int i = 1; i <= 5; i++) {
					row.add(products.getString(i));
				}
				Rows.add(row);
			}

			PrintWriter out = response.getWriter();
			out.println(Rows.size());
			request.setAttribute("productList", Rows);

			ResultSet productTypes = ProductsDao.getProductTypes();
			ArrayList productType = new ArrayList();
			while (productTypes.next()) {
				productType.add(productTypes.getString(1));
			}

			request.setAttribute("productTypes", productType);

			request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
