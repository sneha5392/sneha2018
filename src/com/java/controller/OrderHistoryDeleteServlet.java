package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.OrdersDAO;

/**
 * Servlet implementation class OrderHistoryDeleteServlet
 */
public class OrderHistoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int trackid = Integer.parseInt(request.getParameter("trackid"));
		String role = request.getParameter("role");
		//System.out.println(request.getAttribute("trackid"));
		PrintWriter p = response.getWriter();
		OrdersDAO deleteHistory = new OrdersDAO();
		boolean isDeleted = deleteHistory.deleteHistoryForProduct(trackid);
		if(isDeleted){
			//p.print("Data deleted successfully");
		}
		else {
			//p.print("Data not deleted");
		}
		ResultSet orderDetails = deleteHistory.getOrderDetails();
		request.setAttribute("result", orderDetails);
		request.getRequestDispatcher("ViewAllOrders.jsp?role="+role).include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
