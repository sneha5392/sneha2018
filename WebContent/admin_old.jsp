<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.java.dao.ViewAllDetailsDao"%>
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
		<div class="main">
			<div>
			<form action="AdminCreateNewUser.jsp" method="post">

				<button type="submit" value="newadmin">Create New Admin</button>

			</form>
			</div>
			
			<!-- Below div is for show registration success message which is set in Adminservlet -->
			
			<div id="msg" style="color:red;align:center;float:left"><%
				if(request.getAttribute("msg")!=null)
								{
			%>
								<%=request.getAttribute("msg")%>
								<%
									}
													else
													{
														
													}
								%>
			</div>
			<!-- ================================================== -->
			<%
				ViewAllDetailsDao acdao= new ViewAllDetailsDao();
			%>
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
			</div>
			
		</div>
	</div>
	
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>