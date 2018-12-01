<%@page import="com.java.dao.CreateUserDAO"%>
<%@page import="sun.org.mozilla.javascript.internal.ast.ForLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.java.model.UserInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.java.dao.ViewProfileDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type='text/css' />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"> 
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/fwslider.css" media="all">
<script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<script> 
var d = new Date();
var year = d.getFullYear();

$(function() {   
	$( "#datepicker" ).datepicker({      
		changeMonth: true,     
		changeYear: true,
		yearRange: '1970:' + year+'',
		maxDate:new Date(),
		dateFormat: 'dd/mm/yy'
		
		});
	});  
</script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
<script src="js/menu_jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View Profile</title>
</head>
<body>
	
	<!--  header -->
		<%@include file="adminheader.jsp"%>
	<!--  header -->
		<div class="container">
		<!-- Below div is for show registration success message which is set in Adminservlet -->
			
			<div id="msg" style="color:red;align:center;float:Right">
				<%
				if(request.getAttribute("msg")!=null)
				{
				%>
								<%=request.getAttribute("msg")%>
				<%
				}
				else
				{
														
				}
				request.setAttribute("msg",null);
				%>
			</div>
			<!-- ================================================== -->
		<div class="main"><br>
		
		<div>

		<% ResultSet rs = (ResultSet)request.getAttribute("result");
			if(rs.next()){
			if(rs.getString("role_id").equals("A")){%>
		<div>
			<a href="admin.jsp">Admin Home Page.</a>
		</div>
			<%}else if(rs.getString("role_id").equals("C")){ %>
		<div>
			<a href="index.jsp">Home Page.</a>
		</div>
			<%}else if(rs.getString("role_id").equals("P")){%>
		<div>
			<a href="partialAdmin.jsp">Partial Admin Home Page.</a>
		</div>	
			<%}	}%>
		<h1 align="center">My Profile</h1><br>
		<%-- <%ResultSet rs = (ResultSet)request.getAttribute("result");%> --%>
		<form action="EditProfileServlet" method = "post">
		<%rs.previous();	
		while(rs.next()){ %>
			<table align = "center" width = "50%" class = "table_admin">
			<tr>
				<td width = "50%">User_id : </td>
				<td width = "50%"><input type = "text" name = "userid" value = "<%=rs.getString("user_id") %>" readonly="readonly""></td>
			</tr>
			<tr>	
				<td width = "50%">Role : </td>
				<td width = "50%"><input type = "text" name = "role" value = "<%=rs.getString("role_id") %>" readonly="readonly""></td>
			</tr>
			<tr>
				<td width = "50%">First Name <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "fname" value = "<%=rs.getString("first_name") %>"></td>
			</tr>
			<tr>
				<td width = "50%">Last Name <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "lname" value = "<%=rs.getString("last_name") %>"></td>
			</tr>
			<%Date d = (Date)rs.getObject("birthdate");
			UserInfo ui = new UserInfo();
			String bdate = ui.FormatDateForJSP(d);
			%>
			<tr>
				<td width = "50%">Birthdate <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "bday" value = "<%=bdate %>" id = "datepicker" readonly="readonly"></td>
			</tr>
			<tr>
				<td width = "50%">Email <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "email" value = "<%=rs.getString("email") %>"></td>
			</tr>
			<tr>
				<td width = "50%">Phone Number <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "pno" value = "<%=rs.getLong("phone") %>"></td>
			</tr>
			<% CreateUserDAO cudao = new CreateUserDAO();
			ResultSet states = cudao.retriveStates();%>
			<tr>
				<td width = "50%">State <span style = "color:red;">*</span> :</td> 
				<td width = "50%"><select name = "state">
				<%while(states.next()) { 
					if(states.getString("state_name").equals(rs.getString("state_name"))){%>
					<option value = "<%=states.getString("state_id") %>" selected="selected"><%=states.getString("state_name") %></option>
					<%}
					else {%>
					<option value = "<%=states.getString("state_id") %>"><%=states.getString("state_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
			</tr>
			<tr>
				<td width = "50%">Password <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "password" name = "pass" value = "<%=rs.getString("password") %>"></td>
			</tr>
			<tr>
				<td width = "50%">Billing Address <span style = "color:red;">*</span> : </td>
				<td width = "50%"><input type = "text" name = "address" value = "<%=rs.getString("billing_address") %>"></td>
			</tr>
			</table><br><br>
			<center><input type = "submit" name = "Save" Value = "SAVE" class="button1"></center>
		</form>
		<% } %>
	</div>
	</div>
</div>	
	
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>