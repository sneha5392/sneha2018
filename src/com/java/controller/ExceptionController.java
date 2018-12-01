package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.java.userUtil.DbUtil;

/**
 * Servlet implementation class ExceptionController
 */

public class ExceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	static Logger log = Logger.getLogger(ExceptionController.class);
    public ExceptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub\
	doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			DbUtil.getConnection();
			
			log.info("Application Initialized");
			response.sendRedirect("index.jsp");
		}catch (Exception e) {
			// TODO: handle exception
			HttpSession session=request.getSession();
			log.error("not valid database");
			session.setAttribute("exception", "not valid dtabase");
			response.sendRedirect("error.jsp");
		}
		
	}

}
