package com.java.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.security.util.BigInt;

import com.java.dao.OrderDao;
import com.java.model.OrderBean;

/**
 * Servlet implementation class PaymentServlet
 */
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		String payment_type = request.getParameter("form");
		OrderBean ob = new OrderBean();
		HttpSession hs = request.getSession();
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		ob.setOrder_date(sdf.format(today));
		ob.setUser_id((String)hs.getAttribute("user_id"));
		ob.setTotal_bill(Long.parseLong((String)request.getParameter("amount_payable")));
		c.add(Calendar.DATE, 4);
		ob.setProposed_delivery_date(sdf.format(c.getTime()));
		ob.setPayment_mode_id((String)request.getParameter("payment_mode"));
		ob.setShipping_address((String)request.getParameter("shipping_address"));
		if(payment_type.equals("cod")){
			request.setAttribute("message", "Cash On Delivery. Your Order has  been placed. You will receive by "+sdf.format(c.getTime()));
		}else if (payment_type.equals("nb")) {
			request.setAttribute("message", "Net Banking Transaction Complete. Your Order has  been placed. You will receive by "+sdf.format(c.getTime()));
		}else if (payment_type.equals("cc")) {
			request.setAttribute("message", "Credit Card Transaction Complete. Your Order has  been placed. You will receive by "+sdf.format(c.getTime()));
		}
		ob.setStatus_id("P");
		OrderDao od = new OrderDao();
		od.insertOrder(ob);
		od.insertOrderProduct(ob,(Integer)hs.getAttribute("cart_id"));
		od.deleteCart((Integer)hs.getAttribute("cart_id"));
		hs.removeAttribute("cart_id");
		RequestDispatcher rd = request.getRequestDispatcher("confirmation.jsp");
		rd.include(request, response);
	}

}
