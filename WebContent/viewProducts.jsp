<%@page import="com.java.dao.ProductDAO"%>
<%@page import="sun.org.mozilla.javascript.internal.ast.ForLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import = "java.sql.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="js/registerValidation.js"></script>
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
	
		<div class="main"><br><br>
		<div>
			<a href = "admin.jsp">Admin Home Page</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href = "addProduct.jsp">Add Product</a>
		</div>
			<%
				ResultSet rs = (ResultSet) request.getAttribute("result");
			%>
			<h1 align="center">Products Details</h1><br>
			<table align=center cellspacing="2px" border="2">
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Price</th>
					<th>Stock</th>
					<th>Discount</th>
					<th>Brand</th>
					<th>Super Category</th>
					<th>Category</th>
					<th>Sub Category</th>
					<th>Vendor</th>
					<th>Action</th>
				</tr>

				<%
					while (rs.next()) {
				%>
				<tr>

					<td><%=rs.getString("Product_id")%></td>
					<td><%=rs.getString("Product_name")%></td>
					<td><%=rs.getString("Product_description")%></td>
					<td><%=rs.getString("Product_price")%></td>
					<td><%=rs.getString("In_stock")%></td>
					<td><%=rs.getLong("Discount")%></td>
					<%ProductDAO dao = new ProductDAO();
						String brandName = dao.getBrandName(rs.getInt("Brand_id"));%>
					<td><%=brandName%></td>
					<%ResultSet categoryDetails = dao.getCategoryDetails(rs.getString("Product_id"));
						String subCategoryName = null;
						String CategoryName = null;
						String superCategoryName = null;
						if(categoryDetails.next()){
						subCategoryName = categoryDetails.getString("SubCategory_name");
						CategoryName = categoryDetails.getString("Category_name");
						superCategoryName = categoryDetails.getString("super_category_name");
						}%>
					<td><%=superCategoryName %></td>
					<td><%=CategoryName%></td>
					<td><%=subCategoryName%></td>
					<% String vendorName = dao.getVendorName(rs.getString("Vendor_id")); %>
					<td><%=vendorName%></td>
					<td><a href="ProductServlet?product_id=<%=rs.getString("Product_id")%>&Action=Edit">Edit</a> / <a href="ProductServlet?product_id=<%=rs.getString("Product_id")%>&Action=Delete">Delete</a>
					</td>
				</tr>
				<%
					}
				%>

			</table>
			<br>

		</div>
	</div>
	<!-- footer -->
		
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>