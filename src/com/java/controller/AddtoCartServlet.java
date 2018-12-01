package com.java.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.dao.CartDao;
import com.java.model.CartBean;

/**
 * Servlet implementation class AddtoCartServlet
 */
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_id = request.getParameter("product_id");
		HttpSession hs = request.getSession();
		String user = (String)hs.getAttribute("user_id");
		CartDao acd = new CartDao();
		int cart_id=acd.getCartId(user);
		CartBean acb = new CartBean();
		if(acd.CheckProduct(cart_id, product_id)){
			acb.setCart_id(cart_id);
			acb.setProduct_id(product_id);
			acd.addtocart(acb);
			request.setAttribute("cart_id", cart_id);
			request.getRequestDispatcher("buy_product.jsp").include(request, response);
		}else{
			request.setAttribute("cart_id", cart_id);
			request.getRequestDispatcher("buy_product.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
