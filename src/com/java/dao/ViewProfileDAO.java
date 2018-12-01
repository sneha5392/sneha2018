package com.java.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.java.model.UserInfo;


public class ViewProfileDAO {
	public ResultSet GetProfileInfo(String userid){
		ResultSet ProfileInfo = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			Statement st = con.createStatement();
			String sql = "SELECT user_id,first_name,last_name,birthdate,email,phone,states.state_name,password,billing_address,role_id " +
			"from user_details ,states where user_details.state_id=states.state_id and user_id='"+userid+"'";
			ProfileInfo = st.executeQuery(sql);	
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ProfileInfo;
	}
	
	public boolean SaveProfileInfo(UserInfo userinfo){
		boolean isSaved = false ; 
		int cnt = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
			Statement st = con.createStatement();
			String sql = "Update user_details " +
					"set first_name = '"+userinfo.getFirstName()+"'," +
					"last_name = '"+userinfo.getLastName()+"'," +
					"birthdate = '"+userinfo.getBirthdate()+"'," +
					"email = '"+userinfo.getEmail()+"'," +
					"phone = '"+userinfo.getPhoneNo()+"'," +
					"birthdate = '"+userinfo.getBirthdate()+"'," +
					"state_id = '"+userinfo.getState()+"'," +
					"role_id = '"+userinfo.getRole()+"'," +
					"password = '"+userinfo.getPassword()+"'," +
					"billing_address = '"+userinfo.getAddress()+"'" +
					"where user_id = '"+userinfo.getUserid()+"'";
			cnt = st.executeUpdate(sql);	
			if(cnt>0){
				isSaved = true;
			}
			else {
				isSaved = false;
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSaved;
	}
}
