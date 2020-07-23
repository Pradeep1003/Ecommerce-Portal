package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.entity.AdminLoginBean;
import com.ecommerce.entity.CustomerBean;
import com.ecommerce.repository.LoginDao;

/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		CustomerBean login = new CustomerBean();
		login.setUsername(username);

		int customerId = 0;
		String originalPwd = null;
		ResultSet result = null;

		try {
			result = LoginDao.customerLogin(login);
			while (result.next()) {
				customerId = result.getInt(1);
				originalPwd = result.getString(2);
			}
			if (originalPwd == null) {
				response.sendRedirect("CustomerLogin.jsp?credentials=false");
			}
			if (originalPwd.contentEquals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("customerId", customerId);
				response.sendRedirect("Products");
			} else {
				response.sendRedirect("CustomerLogin.jsp?credentials=false");
			}
		} catch (Exception e) {
			System.out.println(e);
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
