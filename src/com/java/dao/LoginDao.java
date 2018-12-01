package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import com.java.model.LoginBean;
import com.java.model.UserInfo;
import com.java.userUtil.DbUtil;

public class LoginDao {

	public HashMap<String, String> getLoginDetails(UserInfo userInfo) {
		HashMap<String, String> hm = new HashMap<String, String>();
		try {
			Connection con = DbUtil.getConnection();
			String email = userInfo.getEmail();
			String pass = userInfo.getPassword();
			String encryptPass=null;
			try {
				encryptPass=userInfo.Encrypt(pass);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String sql = "select * from user_details where email='" + email
					+ "' and password='" + encryptPass + "'";

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			String checkEmail = null;
			String checkPass = null;
			String role = null;
			String username = null;
			String user_id=null;
			while (rs.next()) {

				checkEmail = rs.getString("email");
				checkPass = rs.getString("password");
				role = rs.getString("role_id");
				username = rs.getString("first_name");
				user_id=rs.getString("user_id");
			}

			if (email.equals(checkEmail) && encryptPass.equals(checkPass)) {
				System.out.println(checkEmail + checkPass + role);
				hm.put("role", role);
				hm.put("verifiedUser", "yes");
				hm.put("username", username);
				hm.put("user_id", user_id);
			} else {

				hm.put("role", null);
				hm.put("verifiedUser", "no");
			}

			con.close();

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

		return hm;
	}

}
