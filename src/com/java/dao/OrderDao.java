package com.java.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.java.model.OrderBean;
import com.java.userUtil.DbUtil;

public class OrderDao {
	public int insertOrder(OrderBean ob) {
		int query_return = 0;
		Connection con;
		try {
			con = DbUtil.getConnection();
			Statement st = con.createStatement();
			String insert_query = "insert into order_details (order_date,user_id,total_bill,proposed_delivery_date,payment_mode_id,status_id,shipping_address) values('"
					+ ob.getOrder_date()
					+ "','"
					+ ob.getUser_id()
					+ "',"
					+ ob.getTotal_bill()
					+ ",'"
					+ ob.getProposed_delivery_date()
					+ "','"
					+ ob.getPayment_mode_id()
					+ "','"
					+ ob.getStatus_id()
					+ "','" + ob.getShipping_address() + "')";
			query_return = st.executeUpdate(insert_query);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			query_return =0;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			query_return =0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			query_return =0;
		}
		return query_return;
	}

	public int insertOrderProduct(OrderBean ob, int cart_id) {
		Connection con;
		int return_value = 0;
		try {
			con = DbUtil.getConnection();
			Statement st = con.createStatement();
			ResultSet rs_order_id = st
					.executeQuery("select max(order_id) as max_number from order_details");
			int order_id = 0;
			while (rs_order_id.next()) {
				order_id = rs_order_id.getInt("max_number");
			}
			ResultSet rs_product_ids = st
					.executeQuery("select product_id from usercart_details where cart_id="
							+ cart_id + " ");
			String insert_query = "insert into order_product_details(order_id,product_id,quantity) values";
			while (rs_product_ids.next()) {
				insert_query += "('" + order_id + "','"
						+ rs_product_ids.getString("product_id") + "',1),";
			}
			StringBuffer insert_order_product = new StringBuffer(insert_query);
			insert_order_product.deleteCharAt(insert_order_product.length()-1);
			System.out.println(insert_order_product);
			st.executeUpdate(insert_order_product.toString());
			
			String insert_transaction = "insert into transaction_details(user_id,order_id,transaction_amount,transaction_date) values('"
				+ ob.getUser_id() + "',"+order_id+","+ob.getTotal_bill()+",'"+ob.getOrder_date()+"')";
			st.executeUpdate(insert_transaction);
			return_value=1;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return_value=0;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return_value=0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return_value=0;
		}
		return return_value;
	}
	public void deleteCart(int cart_id){
		Connection con;
		try {
			con = DbUtil.getConnection();
			Statement st = con.createStatement();
			st.executeUpdate("delete from usercart_details where cart_id="+cart_id+" ");
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
}
