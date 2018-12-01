<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.java.dao.ProductDAO"%>
<%@page import="com.java.dao.OrdersDAO"%>
<%@page import="com.java.dao.AllCustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
		<div class="main"><br/><br/><br/>
			<h1 align = "center">Hello Admin</h1><br/>
			<%
				AllCustomerDAO acdao = new AllCustomerDAO();
			%>
			<div>
				<table border = "1" align = "center" width = "30%">
					<tr>
						<th></th>
						<th><center>COUNT</center></th>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "AllUserServlet?role=Customer"><center>View Customers</center></a>
						</td>
						<td width = 30%>
							<p align = "center"><%=acdao.getNumberOfUsers('C') %></p>
						</td>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "AllUserServlet?role=Admin"><center>View All Admin Users</center></a>
						</td>
						<td width = 30%>
							<p align = "center"><%=acdao.getNumberOfUsers('A') %></p>
						</td>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "AllUserServlet?role=Vendor"><center>View All Vendors</center></a>
						</td>
						<td width = 30%>
							<p align = "center"><%=acdao.getNumberOfUsers('V') %></p>
						</td>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "AllUserServlet?role=Partial"><center>View All Partial Admins</center></a>
						</td>
						<td width = 30%>
							<p align = "center"><%=acdao.getNumberOfUsers('P') %></p>
						</td>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "ViewAllOrdersServlet?role=Admin"><center>View All Orders</center></a>
						</td>
						<td width = 30%>
							<%OrdersDAO dao = new OrdersDAO(); %>
							<p align = "center"><%=dao.getNumberOfOrders() %></p>
						</td>
					</tr>
					<tr>
						<td width = 70%>
							<a href = "ViewProductServlet"><center>View All Products</center></a>
						</td>
						<td width = 30%>
							<%ProductDAO pdao = new ProductDAO(); %>
							<p align = "center"><%=pdao.NumberOfProducts() %></p>
						</td>
					</tr>
				</table>
			</div><br/><br/><br/>
			
			<%--
			<div > 
			<form action="AllCustomerServlet" method="post">

				<button type="submit" value="viewCustomer">View Customers (<%=acdao.getNumberOfCustomers() %>)</button>

			</form>
			</div>
			<div >
			
			<form action="AllAdminServlet" method="post">

				<button type="submit" value="viewAdmin">View All Admin Users(<%=acdao.getNumberOfAdminUsers()%>)</button>

			</form>
			</div>
			
			<div>
			<form action="AllVendorServlet" method="post">

				<button type="submit" value="viewAdmin">View All vendors(<%=acdao.getNumberOfVendors()%>)</button>

			</form>
			</div> --%>
			
			<div>
			<form action="AdminCreateNewUser.jsp" method="post">

				<center><button type="submit" value="newadmin">Create New Admin</button></center>

			</form>
			</div> 
			
		</div>
	</div>
	
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>