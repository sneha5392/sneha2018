package com.java.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.java.model.ProductInfo;
import com.java.userUtil.DbUtil;

public class ProductDAO {
	public ResultSet getProductDetails(){
		ResultSet productDetails = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from product_details";
			productDetails = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productDetails;
	}
	
		public ResultSet getSpecificProduct(String productId){
			ResultSet productDetails = null;
			try {
				Connection con=DbUtil.getConnection();
				java.sql.Statement stm = con.createStatement();
				String sql ="SELECT * from product_details where Product_id = '"+productId+"'";
				productDetails = stm.executeQuery(sql);
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return productDetails;
		}
	
	public String getBrandName(int brandId){
		ResultSet brandNameRS = null;
		String brandName = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT Brand_name from brand_details where Brand_id = '"+brandId+"'";
			brandNameRS = stm.executeQuery(sql);
			if(brandNameRS.next()){
				brandName = brandNameRS.getString(1);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brandName;
	}
	
	public ResultSet getCategoryDetails(String productId){
		ResultSet categoryDetails = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="select Product_id,SubCategory_name, Category_name, super_category_name " +
					"from product_details, category_details, subcategory_details, super_category " +
					"where product_details.subcategory_id = subcategory_details.Subcategory_id " +
					"and subcategory_details.Category_id = category_details.Category_id " +
					"and category_details.super_category_id = super_category.super_category_id " +
					"and Product_id = '"+productId+"'";
			categoryDetails = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryDetails;
	}
	
	public String getVendorName(String userID){
		ResultSet vendorNameRS = null;
		String vendorName = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT first_name from user_details where user_id = '"+userID+"'";
			vendorNameRS = stm.executeQuery(sql);
			if(vendorNameRS.next()){
				vendorName = vendorNameRS.getString(1);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vendorName;
	}
	
	public int NumberOfProducts(){
		ResultSet count = null;
		int cnt = 0;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT count(*) from product_details";
			count = stm.executeQuery(sql);
			if(count.next()){
				cnt = count.getInt(1);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ResultSet getBrands(){
		ResultSet brands = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from brand_details";
			brands = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return brands;
	}
	
	public ResultSet getCategories(){
		ResultSet categories = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from category_details";
			categories = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categories;
	}
	
	public ResultSet getSubCategories(){
		ResultSet subCategories = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from subcategory_details";
			subCategories = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subCategories;
	}
	
	public ResultSet getSuperCategories(){
		ResultSet superCategories = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from super_category";
			superCategories = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return superCategories;
	}
	
	public boolean updateProduct(ProductInfo productInfo){
		int cnt = 0;
		boolean updated = false;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="Update product_details " +
					"set Product_name = '"+productInfo.getProductName()+"', " +
					"Product_description = '"+productInfo.getProductDesc()+"', " +
					"Product_price = "+productInfo.getPrice()+", " +
					"In_stock = "+productInfo.getStock()+", " +
					"Discount = "+productInfo.getDiscount()+", " +
					"Brand_id = "+productInfo.getBrandId()+", " +
					"subcategory_id = "+productInfo.getSubCategoryId()+", " +
					"Vendor_id = '"+productInfo.getVendorId()+"' " +
					"where Product_id = '"+productInfo.getProductId()+"'";
			cnt = stm.executeUpdate(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cnt>0){
			updated = true;
		}
		return updated;
	}
	
	public boolean deletedProduct(String productId){
		int cnt = 0;
		boolean deleted = false;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="delete from product_details where Product_id = '"+productId+"'";		
			cnt = stm.executeUpdate(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cnt>0){
			deleted = true;
		}
		return deleted;
	}
	
	public String runProcedure(){
		String productId = null; 
		try{
				Connection conn=DbUtil.getConnection();
		    	java.sql.CallableStatement cstmt = conn.prepareCall("{?=call generate_product_id()}");
		    	cstmt.registerOutParameter(1, Types.VARCHAR);
		    	cstmt.execute();
		    	productId = cstmt.getString(1);
		    }catch(SQLException sq){
		    	sq.printStackTrace();
		    }catch (ClassNotFoundException c) {
		    	c.printStackTrace();
		    } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    return productId;
	}
	
	public boolean insertProduct(ProductInfo productInfo){
		int cnt = 0;
		boolean inserted = false;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="insert into Product_details " +
					"(Product_id, Product_name, Product_description, Product_price, In_stock, Discount, Brand_id, subcategory_id, Vendor_id) " +
					"values ('"+runProcedure()+"', '"+productInfo.getProductName()+"', '"+productInfo.getProductDesc()+"', "+productInfo.getPrice()+", "+productInfo.getStock()+", "+productInfo.getDiscount()+", "+productInfo.getBrandId()+", "+productInfo.getSubCategoryId()+", " +
					"'"+productInfo.getVendorId()+"')";
			cnt = stm.executeUpdate(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cnt>0){
			inserted = true;
		}
		return inserted;
	}
}
