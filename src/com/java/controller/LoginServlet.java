package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import sun.org.mozilla.javascript.internal.json.JsonParser;

import com.java.dao.LoginDao;
import com.java.model.LoginBean;
import com.java.model.UserInfo;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		s.invalidate();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		JSONObject jobject = new JSONObject();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
			/*create object of bean		*/
		//LoginBean lb = new LoginBean();
		UserInfo userInfo= new UserInfo();
		userInfo.setEmail(email);
		userInfo.setPassword(password);

		/*create object of Dao		*/
		LoginDao ld = new LoginDao();
		HashMap<String, String> hm = ld.getLoginDetails(userInfo);
		// String res=null;
		if (hm.get("verifiedUser").equals("yes")) {
			HttpSession s = request.getSession();
			s.setAttribute("username",hm.get("username"));
			s.setAttribute("user_id",hm.get("user_id"));
			s.setAttribute("role",hm.get("role"));
			if (hm.get("role").equals("A")) {
				try {
					jobject.put("role", "A");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// response. j(jobject);
				out.print(jobject);
			} else if (hm.get("role").equals("C")) {
				try {
					jobject.put("role", "C");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.print(jobject);
			}
			else if (hm.get("role").equals("P")) {
				try {
					jobject.put("role", "P");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.print(jobject);
			}
		} else {
			/*
			 * PrintWriter out=response.getWriter(); out.print("<script>");
			 * out.print(
			 * "document.getElementById('errorBox').innerHTML = 'Account doesnt exist'"
			 * ); out.print("<script>");
			 */
			try {
				jobject.put("role", "other");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(jobject);

		}
	}

}
