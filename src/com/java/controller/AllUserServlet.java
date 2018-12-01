package com.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.AllCustomerDAO;

/**
 * Servlet implementation class AllCustomerServlet
 */
public class AllUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			System.out.println(request.getParameter("role"));
			AllCustomerDAO dao = new AllCustomerDAO();
			ResultSet rs = null;
			if(request.getParameter("role").equals("Customer")){
				rs=dao.getUserDetail('C');
				request.setAttribute("result", rs);
				request.getRequestDispatcher("AllCustomers.jsp").forward(request, response);
			}
			else if(request.getParameter("role").equals("Admin")){
				rs=dao.getUserDetail('A');
				request.setAttribute("result", rs);
				request.getRequestDispatcher("AllAdminUsers.jsp").forward(request, response);
			}
			else if(request.getParameter("role").equals("Vendor")){
				rs=dao.getUserDetail('V');
				request.setAttribute("result", rs);
				request.getRequestDispatcher("AllVendors.jsp").forward(request, response);
			}
			else if(request.getParameter("role").equals("Partial")){
				rs=dao.getUserDetail('P');
				request.setAttribute("result", rs);
				request.getRequestDispatcher("AllPartialAdmin.jsp").forward(request, response);
			}
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
	}

}
