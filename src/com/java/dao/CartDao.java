package com.java.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.java.model.CartBean;
import com.java.userUtil.DbUtil;

public class CartDao {
	public boolean CheckProduct(int cart_id,String product_id){
		int flag=0;
		try {
			Connection con = DbUtil.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select product_id from usercart_details where cart_id="+cart_id+" ");
			while(rs.next()){
				if(rs.getString("product_id").equals(product_id)){
					flag=1;
					break;
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag==1){
			return false;
		}
		else{
			return true;
		}
	}
	public int getCartId(String user){
		int cart_id=0;
		try {
			Connection con = DbUtil.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select id from user_details where user_id='"+user+"' ");
			while(rs.next()){
				cart_id = rs.getInt("id");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cart_id;
	}
	public void addtocart(CartBean acb){
		try {
			Connection con = DbUtil.getConnection();
			Statement st = con.createStatement();
			int cart_id = acb.getCart_id();
			String product_id = acb.getProduct_id();
			String query = "insert into usercart_details(cart_id,product_id) values("+cart_id+",'"+product_id+"')";
			st.executeUpdate(query);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int removeProduct(CartBean cb){
		int ret=0;
		try {
			Connection con = DbUtil.getConnection();
			Statement st = con.createStatement();
			int cart_id = cb.getCart_id();
			String product_id = cb.getProduct_id();
			
			String query = "delete from usercart_details where cart_id="+cart_id+" and product_id='"+product_id+"' ";
			ret = st.executeUpdate(query);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	public long getPriceTotal(CartBean cb){
		long total=0;
		try {
			Connection con = DbUtil.getConnection();
			Statement st = con.createStatement();
			int cart_id = cb.getCart_id();
			String product_id = cb.getProduct_id();
			
			String query = "select sum(p.product_price) as total_price from product_details p where product_id in "+
			"(select product_id from usercart_details where cart_id="+cb.getCart_id()+")";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
				total = rs.getLong("total_price");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
}
