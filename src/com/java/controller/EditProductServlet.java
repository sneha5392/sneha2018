package com.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.dao.ProductDAO;
import com.java.model.ProductInfo;

/**
 * Servlet implementation class EditProductServlet
 */
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
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
		System.out.println(request.getParameter("Action"));
		String productId = request.getParameter("Product_id");
		String productName = request.getParameter("Product_name");
		String productDesc = request.getParameter("Product_description");
		String price = request.getParameter("Product_price");
		String stock = request.getParameter("In_stock");
		String discount = request.getParameter("Discount");
		String brandId = request.getParameter("Brand");
		String subCategoryId = request.getParameter("SubCategory");
		String vendorId = request.getParameter("Vendor_id");
		
		ProductInfo setProductInfo = new ProductInfo();
		setProductInfo.setProductId(productId);
		setProductInfo.setProductName(productName);
		setProductInfo.setProductDesc(productDesc);
		setProductInfo.setPrice(price);
		setProductInfo.setStock(stock);
		setProductInfo.setDiscount(discount);
		setProductInfo.setBrandId(brandId);
		setProductInfo.setSubCategoryId(subCategoryId);
		setProductInfo.setVendorId(vendorId);
		
		ProductDAO updateProduct = new ProductDAO();
		if(request.getParameter("Action").equals("Edit")){
			boolean updated = updateProduct.updateProduct(setProductInfo);
			if(updated){
				
			}
			ResultSet updatedProduct = updateProduct.getSpecificProduct(productId);
			request.setAttribute("result", updatedProduct);
			request.getRequestDispatcher("editProduct.jsp").forward(request, response);
		}
		else if(request.getParameter("Action").equals("Add")){
			System.out.println("hello");
			boolean added = updateProduct.insertProduct(setProductInfo);
			if(added){
				System.out.println("Data Added");
			}
			else {
				System.out.println("Data NOT Added");
			}
			ResultSet updatedProduct = updateProduct.getProductDetails();
			request.setAttribute("result", updatedProduct);
			request.getRequestDispatcher("viewProducts.jsp").forward(request, response);
		}
	}

}
