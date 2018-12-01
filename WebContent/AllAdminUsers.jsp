<%@page import="sun.org.mozilla.javascript.internal.ast.ForLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import = "java.sql.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="js/registerValidation.js"></script>
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
<link href="css/bootstrap.css" rel="stylesheet" type='text/css' />
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
<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
<script src="js/menu_jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<!--  header -->
<%@include file="adminheader.jsp"%>
<!--  header -->
<div class="container"><br>
	<div>
			<a href = "admin.jsp">Admin Home Page.</a>
	</div>
		<div class="main">
			<div>
				<%
					ResultSet rs = (ResultSet) request.getAttribute("result");
				%>
				<h1 align="center">All Admin Users</h1>
				<table align=center cellspacing="2px" border="2">
					<tr>
						<th>Userid</th>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Birth Date</th>
						<th>Emailid</th>
						<th>Phone No</th>
						<th>State Name</th>
						<th>Password</th>
						<th>Billing Address</th>
						<th>Action</th>
					</tr>

					<%
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("user_id")%></td>
						<td><%=rs.getString("first_name")%></td>
						<td><%=rs.getString("last_name")%></td>
						<%
							Date d = (Date) rs.getObject("birthdate");
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String s = sdf.format(d);
						%>
						<td><%=s%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getLong("phone")%></td>
						<td><%=rs.getString("state_name")%></td>
						<td><%=rs.getString("password")%></td>
						<td><%=rs.getString("billing_address")%></td>
						<td><a href="EditCustomerServlet?user_id=<%=rs.getString("user_id") %>&role=Admin">Edit</a> / <a href="CustomerDeleteServlet?user_id=<%=rs.getString("user_id")%>&role=Admin">Delete</a>
						</td>
					</tr>
					<%
						}
					%>

				</table>
				<br>
			</div>
		</div>
	</div>
	<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>