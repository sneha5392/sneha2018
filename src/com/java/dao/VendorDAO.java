package com.java.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VendorDAO {
	public ResultSet getVendorDetail(){
	ResultSet rs=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
		java.sql.Statement stm = con.createStatement();
		String sql ="SELECT user_id,first_name,last_name,birthdate,email,phone,states.state_name,password,billing_address " +
				"from user_details ,states where user_details.state_id=states.state_id and user_details.role_id='V'";
		rs = stm.executeQuery(sql);
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException ei) {
		ei.printStackTrace();
	}
	return rs;
	}
	
	
	public int getNumberOfVendors(){
		int cnt = 0;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql = "select count(*) from user_details where role_id = 'V'";
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
}


