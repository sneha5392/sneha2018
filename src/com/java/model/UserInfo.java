package com.java.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserInfo {
	private String userid;
	private String firstName; 
	private String lastName;
	private String address;
	private String state;
	private long phoneNo;
	private String birthdate;
	private String email;
	private String password;
	private String role;
	
	public UserInfo(){
		
	}

	
	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public long getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(long phoneNo) {
		this.phoneNo = phoneNo;
	}


	public String getBirthdate() {
		return birthdate;
	}


	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String FormatDate(String date){
		String stringDate = null;
		Date toDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try {
	        toDate = sdf.parse(date);
	        System.out.println(toDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }finally {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	        stringDate = sdf1.format(toDate);
	        return stringDate;
	    }
	}
	
	public String FormatDateForJSP(Date date) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s = sdf.format(date);
		Date todate = sdf.parse(s);
	    SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
	    String finalDate = sdf1.format(todate);
	    return finalDate;
	}
	
	public String Encrypt(String password) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("MD5");
		// Add password bytes to digest
		md.update(password.getBytes());
		// Get the hash's bytes
		byte[] bytes = md.digest();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < bytes.length; i++) {
			sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16)
					.substring(1));
		}
		String generatedPassword = sb.toString();
		return generatedPassword;

	}
}
