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
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		// TODO Auto-generated method stub
		String msg=request.getParameter("msgTemp");
		System.out.println(request.getParameter("msgTemp"));
		PrintWriter p= response.getWriter();
		
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		long phno = Long.parseLong(request.getParameter("phone"));
		String bdate = request.getParameter("birthdate");
		String email = request.getParameter("mail");
		String pass = request.getParameter("Password");
		String role = request.getParameter("role");
		
		/*created object of Model Userinfo  */
		UserInfo addInfo = new UserInfo();
		String encryptPass=null;
		try {
			 encryptPass=addInfo.Encrypt(pass);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String birthdate = addInfo.FormatDate(bdate);
		addInfo.setFirstName(fname);
		addInfo.setLastName(lname);
		addInfo.setAddress(address);
		addInfo.setState(state);
		addInfo.setPhoneNo(phno);
		addInfo.setBirthdate(birthdate);
		addInfo.setEmail(email);
		addInfo.setPassword(encryptPass);
		addInfo.setRole(role);
		
		/*created object of DAO  */
		if(msg!=null)
		{
		CreateUserDAO userDao = new CreateUserDAO();
		boolean i=userDao.addUser(addInfo);
		
		if(i){
			request.setAttribute("msg","Data Added");
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
			rd.include(request, response);
		}
		}
		else {
			
			/*p.print("<script>" +
					"document.getElementById('msg').style.background='green'" +
					";document.getElementById('msg').innerHTML = 'Admin not added';</script>");
			*/
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
			rd.include(request, response);
		}
		
		
	}

}
