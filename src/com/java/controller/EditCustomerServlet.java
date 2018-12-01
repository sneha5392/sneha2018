package com.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.AllCustomerDAO;

/**
 * Servlet implementation class EditCustomerServlet
 */
public class EditCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{  
			String userid=request.getParameter("user_id");
			AllCustomerDAO dao=new AllCustomerDAO();
			ResultSet rs=dao.getSpecificCustomer(userid);
			request.setAttribute("result", rs);
			if(request.getParameter("role").equals("Vendor")){
				request.getRequestDispatcher("editVendor.jsp").include(request, response);
			}
			else if (request.getParameter("role").equals("Customer")){
				request.getRequestDispatcher("editCustomer.jsp").include(request, response);
			}
			else if (request.getParameter("role").equals("Admin")){
				request.getRequestDispatcher("editAdmin.jsp").include(request, response);
			}
			else if (request.getParameter("role").equals("Partial")){
				request.getRequestDispatcher("EditPartialAdmin.jsp").include(request, response);
			}
		}
		catch (Exception e) {
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
