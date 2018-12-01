package com.java.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.model.UserInfo;



public class AllCustomerDAO {

	
	
	public ResultSet getUserDetail(char role){
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql ="SELECT user_id,first_name,last_name,birthdate,email,phone,states.state_name,password,billing_address " +
					"from user_details ,states where user_details.state_id=states.state_id and user_details.role_id='"+role+"'";
			rs = stm.executeQuery(sql);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int getNumberOfUsers(char role){
		int cnt = 0;
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql = "select count(*) from user_details where role_id = '"+role+"'";
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
	
	public ResultSet getSpecificCustomer(String uid)
	{
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql1 ="SELECT user_id,first_name,last_name,birthdate,email,phone,states.state_name,password,billing_address " +
					"from user_details ,states where user_details.state_id=states.state_id and user_id='"+uid+"'";
			rs = stm.executeQuery(sql1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	public boolean UpdateSpecificCustomer(UserInfo userInfo)
	{
		int cnt = 0;
		boolean isUpdated = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql1 ="Update user_details" +
					" set first_name='"+userInfo.getFirstName()+"'," +
					"last_name='"+userInfo.getLastName()+"'," +
					"birthdate='"+userInfo.getBirthdate()+"'," +
					"email='"+userInfo.getEmail()+"'," +
					"phone="+userInfo.getPhoneNo()+"," +
					"state_id='"+userInfo.getState()+"'," +
					"password='"+userInfo.getPassword()+"'," +
					"billing_address='"+userInfo.getAddress()+"' " +
					"where user_id='"+userInfo.getUserid()+"'";
			cnt= stm.executeUpdate(sql1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(cnt>0){
			isUpdated = true;
		}else {
			isUpdated = false;
		}
		return isUpdated;
	}

	
	public boolean DeleteSpecificCustomer(String uid)
	{
		int cnt = 0;
		boolean isDeleted = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			java.sql.Statement stm = con.createStatement();
			String sql1 ="Delete from user_details where user_id='"+uid+"'";
			cnt = stm.executeUpdate(sql1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(cnt>0){
			isDeleted = true;
		}else {
			isDeleted = false;
		}
		return isDeleted;
	}
}
