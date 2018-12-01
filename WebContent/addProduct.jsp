<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.*,java.text.*,java.sql.*,com.java.model.UserInfo,com.java.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="js/registerValidation.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">  
<script src="//code.jquery.com/jquery-1.10.2.js"></script>  
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script>  $(function() {    $( "#datepicker" ).datepicker({      changeMonth: true,      changeYear: true    });  });  </script>
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
<!-- Below div is for show registration success message which is set in Adminservlet -->
			<div>
				<a href = "ViewProductServlet">Back</a>
			</div>
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
<div class="main">
	<h1 align = "center">Add Product</h1><br><br>
	<form action="EditProductServlet?Action=Add" method="post">
	<table align = "center" width = 50% cellspacing="30" class = "table_admin">
	<tr>
		<td width = 50%>Product Name : </td>
		<td width = 50%><input type="text" name="Product_name" value=""></td>
	</tr>
	<tr>
		<td width = 50%>Product Description : </td>
		<td width = 50%><input type="text" name="Product_description" value=""></td>
	</tr>
	<tr>
		<td width = 50%>Price :</td>
		<td width = 50%><input type="text" name="Product_price" value=""></td>
	</tr>
	<tr>
		<td width = 50%>Stock :</td>
		<td width = 50%><input type="text" name="In_stock" value=""></td>
	</tr>
	<tr>
		<td width = 50%>Discount :</td>
		<td width = 50%><input type="text" name="Discount" value=""></td>
	</tr>
	<tr>
		<%ProductDAO pdao = new ProductDAO();
			ResultSet brands = pdao.getBrands();%>
		<td width = 50%>Brand : </td>
		<td width = 50%><select name = "Brand">
			<option value = "none" selected="selected">Select Brand</option>
				<%while(brands.next()) { %>
					<option value = "<%=brands.getString("Brand_id") %>"><%=brands.getString("Brand_name") %></option>				
				<%} %>
			</select></td>
	</tr>
	<tr>
		<td width = 50%>Sub Category :</td>
		<td width = 50%><select name = "SubCategory">
			<option value = "none" selected="selected">Select SubCategory</option>
			<%ResultSet subCategories = pdao.getSubCategories();
				while(subCategories.next()){%>
					<option value = "<%=subCategories.getString("Subcategory_id") %>"><%=subCategories.getString("Subcategory_name") %></option>			
				<%} %>
			</select></td>
	</tr>
	<tr>
		<td width = 50%>Vendor : </td>
		<td width = 50%><select name = "Vendor_id">
			<option value = "none" selected="selected">Select Vendor</option>
				<%
				VendorDAO vdao = new VendorDAO();
				ResultSet vendors = vdao.getVendorDetail();
				while(vendors.next()) { %>
					<option value = "<%=vendors.getString("user_id") %>"><%=vendors.getString("first_name") %></option>				
				<%} %>
			</select></td>
	</tr>
	</table>
		<center><input type="submit" value="Save" class="button1"></center><br>
	</form>
</div>
	</div>
	
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>