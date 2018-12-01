package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.AllCustomerDAO;
import com.java.model.UserInfo;

/**
 * Servlet implementation class CustomerUpdateServlet
 */
public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out=response.getWriter();
		System.out.println(request.getParameter("role"));
		String id=request.getParameter("user_id");
		String fname=request.getParameter("firstname");
		String lname=request.getParameter("lastname");
		String dob=request.getParameter("birthdate");
		String email=request.getParameter("emailid");
		long phone=Long.parseLong(request.getParameter("phoneno"));
		String state=request.getParameter("state");
		String pass=request.getParameter("password");
		String ba=request.getParameter("billingaddress");
		
		UserInfo editCustomer=new UserInfo();
		String birthdate = editCustomer.FormatDate(dob);
		editCustomer.setUserid(id);
		editCustomer.setFirstName(fname);
		editCustomer.setLastName(lname);
		editCustomer.setBirthdate(birthdate);
		editCustomer.setEmail(email);
		editCustomer.setPhoneNo(phone);
		editCustomer.setState(state);
		editCustomer.setPassword(pass);
		editCustomer.setAddress(ba);
		
		AllCustomerDAO dao=new AllCustomerDAO();
		boolean isUpdated = dao.UpdateSpecificCustomer(editCustomer);
			if(isUpdated){
				request.setAttribute("msg","Data Updated Successfully");
			}
		ResultSet updatedInfo = dao.getSpecificCustomer(id);
		request.setAttribute("result", updatedInfo);
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

}
