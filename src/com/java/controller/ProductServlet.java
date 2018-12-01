package com.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.ProductDAO;

/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("product_id"));
		ProductDAO specificProduct = new ProductDAO();
		String productId = request.getParameter("product_id");
		ResultSet productDetails = null;
		if(request.getParameter("Action").equals("Edit")){
			productDetails = specificProduct.getSpecificProduct(productId);
			request.setAttribute("result", productDetails);
			request.getRequestDispatcher("editProduct.jsp").forward(request, response);
		}
		else if(request.getParameter("Action").equals("Delete")){
			boolean isDeleted = specificProduct.deletedProduct(productId);
			if(isDeleted){
				
			}
			productDetails = specificProduct.getProductDetails();
			request.setAttribute("result", productDetails);
			request.getRequestDispatcher("viewProducts.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
