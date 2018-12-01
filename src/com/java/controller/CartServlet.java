package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.CartDao;
import com.java.model.CartBean;
import com.java.userUtil.DbUtil;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String[] type=request.getParameterValues("type");
		if(type[0].equals("qty")){
			String[] qty=request.getParameterValues("qty");
			int stock = Integer.parseInt(qty[0]);
			String product_id = request.getParameter("prod_id");
			Connection con;
			long discount_price=0;
			long product_price;
			try {
				con = DbUtil.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select product_price,in_stock,discount from product_details where product_id='"+product_id+"'");
				while(rs.next()){
					if(rs.getInt("in_stock")>=stock){
						discount_price = rs.getInt("product_price")-((rs.getInt("discount")*rs.getInt("product_price"))/100);
						out.print(discount_price*stock);
						out.print(rs.getInt("product_price")*stock);
					}else{
						discount_price=0;
						out.print(discount_price);
					}
				}
			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}else if(type[0].equals("remove")){
			String product_id = request.getParameter("product_id");
			int cart_id = Integer.parseInt(request.getParameter("cart_id"));
			CartBean cb = new CartBean();
			cb.setCart_id(cart_id);
			cb.setProduct_id(product_id);
			CartDao cd = new CartDao();
			cd.removeProduct(cb);
			out.print(cd.getPriceTotal(cb));
		}
	}

}
