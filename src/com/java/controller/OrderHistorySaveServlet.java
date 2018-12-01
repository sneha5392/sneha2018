package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.OrdersDAO;
import com.java.model.UserInfo;

/**
 * Servlet implementation class OrderHistorySaveServlet
 */
public class OrderHistorySaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistorySaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter p = response.getWriter();
		String role = request.getParameter("role");
		int orderid = Integer.parseInt(request.getParameter("orderidhdn"));
		String productid = request.getParameter("productidhdn");
		System.out.println(orderid+" "+productid);
		String date = (String)request.getParameter("status_date");
		String statusid = request.getParameter("status");
		UserInfo ui = new UserInfo();
		String statusdate = ui.FormatDate(date);
		OrdersDAO savedao = new OrdersDAO();
		boolean isSaved = savedao.SaveOrderStatus(orderid, productid, statusdate, statusid);
		if(isSaved){
			//p.print("Data saved successfully");
		}
		else {
			//p.print("Data Not saved");
		}
		ResultSet orderDetails = savedao.getOrderDetails();
		request.setAttribute("result", orderDetails);
		request.getRequestDispatcher("ViewAllOrders.jsp?role="+role).include(request, response);
	}

}
