package com.java.dao;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;


import com.java.model.UserInfo;
import com.java.userUtil.DbUtil;
import com.mysql.jdbc.CallableStatement;

public class CreateUserDAO {
	
	public Statement startConnection(){
		Statement state=null;
	    try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
	    	/*ConnectionImpl ci = new ConnectionImpl();
	    	Connection conn = ci.getConnection();*/
	    	state=conn.createStatement();
	    }catch(SQLException sq){
	    	sq.printStackTrace();
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return state;
	}
	
	public ResultSet retriveStates(){
		Statement stmt = startConnection();
		int i = 0;
		//ArrayList<String> temp = new ArrayList<String>();
	    String query="select * from states";
	    ResultSet rs = null;
	    try {
	    	rs = stmt.executeQuery(query);
	    	/*while(rs.next())
	    	{
	    		//System.out.println(rs.getString("state_name"));
	    		temp.add(rs.getString("state_name"));
	    		i++;
	    	}*/
	    	//stmt.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;
	}
	
	public ResultSet retriveRole(){
		Statement stmt = startConnection();
		int i = 0;
		//ArrayList<String> temp = new ArrayList<String>();
	    String query="select * from roles";
	    ResultSet rs = null;
	    try {
	    	rs = stmt.executeQuery(query);
	    	/*while(rs.next())
	    	{
	    		//System.out.println(rs.getString("state_name"));
	    		temp.add(rs.getString("role_name"));
	    		i++;
	    	}*/
	    	//stmt.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return rs;
	}
	
	public String runProcedure(String role){
		String userId = null; 
		try{
		    	Class.forName("com.mysql.jdbc.Driver");
		    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/emart","root","root");
		    	java.sql.CallableStatement cstmt = conn.prepareCall("{?=call generate_user_id(?)}");
		    	cstmt.setString(2, role);
		    	cstmt.registerOutParameter(1, Types.VARCHAR);
		    	cstmt.execute();
		    	userId = cstmt.getString(1);
		    	
		    }catch(SQLException sq){
		    	sq.printStackTrace();
		    }catch (ClassNotFoundException c) {
		    	c.printStackTrace();
		    }
		    return userId;
	}
	
	public boolean insertIntoTableUser(UserInfo addInfo){
		Statement stmt = startConnection();
		String query;
		String lastid = runProcedure(addInfo.getRole());
		try {
	    	
	    	query = "insert into user_details" +
	    			"(user_id,first_name,last_name,birthdate,email,phone,state_id,role_id,password,billing_address) values " +
	    			"('"+lastid+"','"+addInfo.getFirstName()+"','"+addInfo.getLastName()+"','"+addInfo.getBirthdate()+"','"+addInfo.getEmail()+"','"+addInfo.getPhoneNo()+"','"+addInfo.getState()+"','"+addInfo.getRole()+"','"+addInfo.getPassword()+"','"+addInfo.getAddress()+"')";
	    	int cnt = stmt.executeUpdate(query);
	    	stmt.close();
	    	if(cnt>0){
	    		return true;
	    	}
	    	else {
	    		return false;
	    	}	
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    return false;
	}
public boolean addUser(UserInfo addInfo){
		
		int cnt=0;
		try {
			String query;
			
			String lastid = runProcedure(addInfo.getRole());
			
			Connection con=DbUtil.getConnection();
			Statement stmt=con.createStatement();
			

	    	query = "insert into user_details" +
	    			"(user_id,first_name,last_name,birthdate,email,phone,state_id,role_id,password,billing_address) values " +
	    			"('"+lastid+"','"+addInfo.getFirstName()+"','"+addInfo.getLastName()+"','"+addInfo.getBirthdate()+"','"+addInfo.getEmail()+"','"+addInfo.getPhoneNo()+"','"+addInfo.getState()+"','"+addInfo.getRole()+"','"+addInfo.getPassword()+"','"+addInfo.getAddress()+"')";
	    	 
	    	cnt = stmt.executeUpdate(query);
	    	stmt.close();
			
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	    	if(cnt>0){
	    		return true;
	    	}
	    	else {
	    		return false;
	    	}
	}

	
}
