package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.userUtil.DbUtil;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String valp[] = request.getParameterValues("listp[]");
		String valc[] = request.getParameterValues("listc[]");
		String category_id=request.getParameter("cat_id");
		StringBuilder brand_id = new StringBuilder();
		String brand_id_string = null;
		
		for(int i=0;i<valp.length;i++){
			brand_id.append(valp[i]).append(",");
		}
		if(!valp[0].equals("0")){
			brand_id.deleteCharAt(brand_id.length()-1);
			brand_id_string = "and b.brand_id in ("+brand_id+")";
		}else{
			brand_id_string = "";
		}
		StringBuilder subcat_id = new StringBuilder();
		String subcat_id_string = null;
		for(int i=0;i<valc.length;i++){
			subcat_id.append(valc[i]).append(",");
		} 
		if(!valc[0].equals("0")){
			subcat_id.deleteCharAt(subcat_id.length()-1);
			subcat_id_string = "and s.subcategory_id in ("+subcat_id+")";
		}else{
			subcat_id_string = "";
		}
		String menu_product_query ="select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images, "+
		"b.brand_name,s.subcategory_name,v.vendor_name "+ 
		"from product_details p inner join brand_details b on p.brand_id=b.brand_id "+ 
		"inner join subcategory_details s on p.subcategory_id=s.subcategory_id "+ 
		"left join vendor_details v on p.vendor_id=v.vendor_id "+
		"where s.subcategory_id in (select subcategory_id from subcategory_details where category_id='"+category_id+"')" +
			" "+brand_id_string+" "+subcat_id_string+" ";
		try {
			Connection con=DbUtil.getConnection();
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(menu_product_query);

			while (rs.next()) {
				out.print("<div class='grid1_of_4' style='text-align: center;'>" );
				out.println("<div class='content_box'>");
				out.println("<a href='product_details.jsp?product_id="+rs.getString("product_id")+"' >");
				out.println("<div class='view view-fifth'>");
				out.println("<img src='"+request.getContextPath()+"/images/"+rs.getString("images")+"' class='img-responsive' alt='"+rs.getString("images")+"' style='width: 150px;height: 200px;'/>");
				out.println("</div>");
				out.println("</a>");
				out.println("</div>");
				out.println("<h4>");
				out.println("<a href='product_details.jsp?product_id="+ rs.getString("product_id")+"'>"); 
				out.println(rs.getString("product_name"));
				out.println("</a>");
				out.println("</h4>");
				out.println("<p>");
				out.println(rs.getString("product_description"));
				out.println("</p>");
				out.println(rs.getInt("product_price"));
				out.print("</div>");
				

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
