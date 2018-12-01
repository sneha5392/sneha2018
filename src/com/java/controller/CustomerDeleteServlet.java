package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.AllCustomerDAO;

/**
 * Servlet implementation class CustomerDeleteServlet
 */
public class CustomerDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter p = response.getWriter();
		String userid=request.getParameter("user_id");
		AllCustomerDAO dao=new AllCustomerDAO();
		boolean isDeleted=dao.DeleteSpecificCustomer(userid);
		/*if(isDeleted){
			p.print("Data Deleted");
		}else {
			p.print("Data not deleted");
		}*/
		
		if(request.getParameter("role").equals("Vendor")){
			ResultSet rs = dao.getUserDetail('V');
			request.setAttribute("result", rs);
			request.getRequestDispatcher("AllVendors.jsp").include(request, response);
		}
		else if (request.getParameter("role").equals("Customer")){
			ResultSet rs = dao.getUserDetail('C');
			request.setAttribute("result", rs);
			request.getRequestDispatcher("AllCustomers.jsp").include(request, response);
		}
		else if (request.getParameter("role").equals("Admin")){
			ResultSet rs = dao.getUserDetail('A');
			request.setAttribute("result", rs);
			request.getRequestDispatcher("AllAdminUsers.jsp").include(request, response);
		}
		else if (request.getParameter("role").equals("Partial")){
			ResultSet rs = dao.getUserDetail('P');
			request.setAttribute("result", rs);
			request.getRequestDispatcher("AllPartialAdmin.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
