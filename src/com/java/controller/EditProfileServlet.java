package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.ViewProfileDAO;
import com.java.model.UserInfo;

/**
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
		String uid = request.getParameter("userid");
		String fname = request.getParameter("fname"); 
		String lname = request.getParameter("lname");
		String bday = request.getParameter("bday");
		String email = request.getParameter("email");
		long pno = Long.parseLong(request.getParameter("pno"));
		String state = request.getParameter("state");
		String pass = request.getParameter("pass");
		String address = request.getParameter("address");
		String role_id = request.getParameter("role");
		
		UserInfo addInfo = new UserInfo();
		String birthdate = addInfo.FormatDate(bday);
		addInfo.setUserid(uid);
		addInfo.setFirstName(fname);
		addInfo.setLastName(lname);
		addInfo.setAddress(address);
		addInfo.setState(state);
		addInfo.setPhoneNo(pno);
		addInfo.setBirthdate(birthdate);
		addInfo.setEmail(email);
		addInfo.setPassword(pass);
		addInfo.setRole(role_id);
		
		//PrintWriter p = response.getWriter();
		ViewProfileDAO saveProfile = new ViewProfileDAO();
		boolean isSaved = saveProfile.SaveProfileInfo(addInfo);
		ResultSet saveInfo = saveProfile.GetProfileInfo(uid);
		request.setAttribute("result", saveInfo);
		if(isSaved){
			//p.print("Data Saved successfully.");
			request.setAttribute("msg", "Data Saved successfully.");
		}
		else {
			//p.print("Data not saved.");
		}
		request.getRequestDispatcher("ViewMyProfile.jsp").include(request, response);
	}

}
