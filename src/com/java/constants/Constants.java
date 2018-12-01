package com.java.constants;

/**
 * This is class contains the constants declaration for all success scenarios
 * 
 * @author t-Renjith
 * 
 */
public final class Constants {

	private Constants() {
		new Constants();
	}

	public static final String DEFAULT_PASSWORD = "password";
	public static final String DEFAULT_ROLE = "EMPLOYEE";
	public static final String CLOSED = "Closed";
	public static final String OPEN = "Open";
	public static final String DELEMP = "Delete operation can not be performed for this BU as there are Employees mapped to this BU. Please reassign the Employees before performing the operation.";
	/**
	 * The label properties file name
	 */
	public static final String UITEXT = "UIText";
	/**
	 * The SQL query for getting the user details for user validation
	 * 
	 */
	public static final String EXCEPTION = "Application has encountered a fatal error.Please check with the Adminstrator or try again later";
	
	
	
	
	public static final String SQLEXCEPTION_ERROR="Error in sql query...";
	public static final String IOEXCEPTION_ERROR="Error in File I/O";
	public static final String EXCEPTION_ERROR="Exception Occured..";
	public static final String CONNECTION_CLOSE_ERROR="Error in closing connection..";
	public static final String INSERT_ERROR="Error in Inserting data...";
	public static final String CLASS_NOTFOUND=" Class Not Found.....";
	public static final String INCORRECT="Incorrect username and password....!!!";
	public static final String NULL_POINTER_EXCEPTION="Field can not be empty...";
	public static final String GENERIC_EXCEPTION="Error occured because of : ";
	public static final String SESSION_EXCEPTION="Error in session creation..";
	public static final String PARSE_EXCEPTION="Error in parsing";
	
}
