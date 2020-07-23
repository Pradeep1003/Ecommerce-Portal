package com.ecommerce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.entity.AdminLoginBean;
import com.ecommerce.repository.LoginDao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLogin() {
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
		AdminLoginBean login = new AdminLoginBean();
		login.setUsername(username);

		String originalPwd = null;

		try {
			originalPwd = LoginDao.login(login);

			if (originalPwd == null) {
				response.sendRedirect("AdminLogin.jsp?credentials=false");
			}
			if (originalPwd.contentEquals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("adminUsername", username);
				response.sendRedirect("getProducts");
			} else {
				response.sendRedirect("AdminLogin.jsp?credentials=false");
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

	}

}
