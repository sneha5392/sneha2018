package com.java.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.java.constants.SuccessConstants;

/**
 * Servlet implementation class LoggerInitializer
 */
public class LoggerInitializer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/** The Constant serialVersionUID. */
	
	
	/** The Constant LOG. */
	private static final Logger LOG = Logger
			.getLogger(LoggerInitializer.class);

	/**
	 * ServletConfig - servlet config object.
	 *
	 * @param config the config
	 * @throws ServletException the servlet exception
	 */
	public void init(final ServletConfig config)
			throws ServletException {
		final String realPath = config.getServletContext()
				.getRealPath("/");
		final String log4jFile = realPath
				+ SuccessConstants.LOG4J_FILE;
		PropertyConfigurator.configure(log4jFile);
		

	}
}
