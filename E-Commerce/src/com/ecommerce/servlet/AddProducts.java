package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.entity.ProductBean;
import com.ecommerce.repository.AddProductsDao;

/**
 * Servlet implementation class AddProducts
 */
@WebServlet("/AddProducts")
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String imgUrl = request.getParameter("imgUrl");
		Integer price = Integer.parseInt(request.getParameter("price"));
		Integer discount = Integer.parseInt(request.getParameter("discount"));
		String productType = request.getParameter("type");
		ProductBean product = new ProductBean();
		product.setImgUrl(imgUrl);
		product.setPrice(price);
		product.setDiscounts(discount);
		product.setProductType(productType);

		try {
			AddProductsDao.addProducts(product);
			response.sendRedirect("getProducts");
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
