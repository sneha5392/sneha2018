package com.java.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.userUtil.DbUtil;

public class OrdersDAO {
	public ResultSet getOrderDetails() {
		ResultSet orderDetails = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from order_details";
			orderDetails = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderDetails;
	}
	
	public int getNumberOfOrders(){
		int cnt = 0;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql = "select count(*) from order_details";
			rs = stm.executeQuery(sql);
			while(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ResultSet getStatusDetails() {
		ResultSet statusDetails = null;
		try {
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT * from status_details";
			statusDetails = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statusDetails;
	}
	

	public boolean SaveOrderStatus(int orderid, String productid, String statusdate, String statusid){
		boolean isSaved = false;
		int cnt = 0 ;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql ="insert into order_product_history(Order_id,Product_id,Status_date,Status_id) values" +
					"("+orderid+", " +
					"'"+productid+"', " +
					"'"+statusdate+"', " +
					"'"+statusid+"')";
			String sql1 = "update order_details set Status_id = '"+statusid+"'" +
					"where Order_id = '"+orderid+"'";
			cnt = stm.executeUpdate(sql);
			stm.executeUpdate(sql1);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(cnt>0)
			isSaved = true;
		else
			isSaved = false;
		return isSaved;
	}
	
	public ResultSet viewOrderDetails(int orderId){
		ResultSet productDetails = null;
		try{
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="Select order_details.Order_id," +
					"Product_id,Quantity " +
					"from order_details,order_product_details " +
					"where order_details.Order_id = order_product_details.Order_id " +
					"and order_product_details.Order_id = '"+orderId+"'";
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
	
	public ResultSet getOrderProductHistoryDetails(int orderId, String productid){
		ResultSet history = null;
		try{
			Connection con=DbUtil.getConnection();
			
			java.sql.Statement stm = con.createStatement();
			String sql ="Select Tracking_id, order_product_history.Status_id, Status_name,Status_date " +
					"from order_product_history, status_details " +
					"where order_product_history.Status_id = status_details.Status_id " +
					"and Order_id = '"+orderId+"' " +
					"and Product_id = '"+productid+"'";
			history = stm.executeQuery(sql);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return history;
	}
	
	public boolean deleteHistoryForProduct(int trackid){
		int cnt = 0;
		boolean deleted = false;
		try{
			Connection con=DbUtil.getConnection();
			java.sql.Statement stm = con.createStatement();
			String sql ="Delete from order_product_history where Tracking_id = '"+trackid+"'";
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
		else {
			deleted = false;
		}
		return deleted;
	}
}
