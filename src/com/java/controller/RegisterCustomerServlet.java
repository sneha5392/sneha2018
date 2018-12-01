package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.CreateUserDAO;
import com.java.model.UserInfo;

/**
 * Servlet implementation class RegisterCustomerServlet
 */
public class RegisterCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCustomerServlet() {
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
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		Long phno = Long.parseLong(request.getParameter("phone"));
		String bdate = request.getParameter("birthdate");
		//System.out.println(bdate);
		/*String bmonth = request.getParameter("birthday_month");
		int bday = Integer.parseInt(request.getParameter("birthday_day"));
		int byear = Integer.parseInt(request.getParameter("birthday_year"));*/
		String email = request.getParameter("mail");
		String pass = request.getParameter("Password");
		//String role = request.getParameter("role");
		
		UserInfo addCustInfo = new UserInfo();
		
		String encryptPass=null;
		
		try {
			encryptPass=addCustInfo.Encrypt(pass);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String birthdate = addCustInfo.FormatDate(bdate);
		addCustInfo.setFirstName(fname);
		addCustInfo.setLastName(lname);
		addCustInfo.setAddress(address);
		addCustInfo.setState(state);
		addCustInfo.setPhoneNo(phno);
		addCustInfo.setBirthdate(birthdate);
		addCustInfo.setEmail(email);
		addCustInfo.setPassword(encryptPass);
		addCustInfo.setRole("C");
		CreateUserDAO userDao = new CreateUserDAO();
		PrintWriter p = response.getWriter();
		//System.out.println(userDao.runProcedure("A"));
		boolean i = userDao.insertIntoTableUser(addCustInfo);
		if(i){
			p.print("Data added successfully");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else {
			p.print("Data NOT added successfully");
			RequestDispatcher rd = request.getRequestDispatcher("RegisterCustomer.jsp");
			rd.include(request, response);
		}
	}

}
