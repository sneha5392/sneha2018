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
	<h1 align = "center">Product Details</h1><br><br>
	<%
 		ResultSet rs=(ResultSet)request.getAttribute("result");
		while(rs.next()){
	%>
	<form action="EditProductServlet?Action=Edit" method="post">
	<table align = "center" width = 50% cellspacing="30" class = "table_admin">
	<tr>
		<td width = 50%>Product ID : </td>
		<td width = 50%><input type="text" name="Product_id" value="<%=rs.getString("Product_id")%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td width = 50%>Product Name : </td>
		<td width = 50%><input type="text" name="Product_name" value="<%=rs.getString("Product_name")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Product Description : </td>
		<td width = 50%><input type="text" name="Product_description" value="<%=rs.getString("Product_description")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Price :</td>
		<td width = 50%><input type="text" name="Product_price" value="<%=rs.getString("Product_price")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Stock :</td>
		<td width = 50%><input type="text" name="In_stock" value="<%=rs.getString("In_stock")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Discount :</td>
		<td width = 50%><input type="text" name="Discount" value="<%=rs.getLong("Discount")%>"></td>
	</tr>
	<tr>
		<%ProductDAO pdao = new ProductDAO();
			ResultSet brands = pdao.getBrands();
			String brandName = pdao.getBrandName(rs.getInt("Brand_id"));%>
		<td width = 50%>Brand : </td>
		<td width = 50%><select name = "Brand">
				<%while(brands.next()) { 
					if(brands.getString("Brand_name").equals(brandName)){%>
					<option value = "<%=brands.getString("Brand_id") %>" selected="selected"><%=brands.getString("Brand_name") %></option>
					<%}
					else {%>
					<option value = "<%=brands.getString("Brand_id") %>"><%=brands.getString("Brand_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr>
	<%ResultSet categoryDetails = pdao.getCategoryDetails(rs.getString("Product_id"));
		String subCategoryName = null;
		/* String CategoryName = null;
		String superCategoryName = null; */
		if(categoryDetails.next()){
			subCategoryName = categoryDetails.getString("SubCategory_name");
			/* CategoryName = categoryDetails.getString("Category_name");
			superCategoryName = categoryDetails.getString("super_category_name");	 */		
		}
		//ResultSet categories = pdao.getCategories();
		ResultSet subCategories = pdao.getSubCategories();
		//ResultSet superCategories = pdao.getSuperCategories();%>
	<%-- <tr>
		<td width = 50%>Super Category :</td>
		<td width = 50%><select name = "SuperCategory">
				<%while(superCategories.next()) { 
					if(superCategories.getString("super_category_name").equals(superCategoryName)){%>
					<option value = "<%=superCategories.getString("super_category_id")%>" selected="selected"><%=superCategories.getString("super_category_name") %></option>
					<%}
					else {%>
					<option value = "<%=superCategories.getString("super_category_id") %>"><%=superCategories.getString("super_category_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr>
	<tr>
		<td width = 50%>Category :</td>
		<td width = 50%><select name = "Category">
				<%while(categories.next()) { 
					if(categories.getString("Category_name").equals(CategoryName)){%>
					<option value = "<%=categories.getString("Category_id")%>" selected="selected"><%=categories.getString("Category_name") %></option>
					<%}
					else {%>
					<option value = "<%=categories.getString("Category_id") %>"><%=categories.getString("Category_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr> --%>
	<tr>
		<td width = 50%>Sub Category :</td>
		<td width = 50%><select name = "SubCategory">
				<%while(subCategories.next()) { 
					if(subCategories.getString("Subcategory_name").equals(subCategoryName)){%>
					<option value = "<%=subCategories.getString("Subcategory_id")%>" selected="selected"><%=subCategories.getString("Subcategory_name") %></option>
					<%}
					else {%>
					<option value = "<%=subCategories.getString("Subcategory_id") %>"><%=subCategories.getString("Subcategory_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr>
	<tr>
		<%
			VendorDAO vdao = new VendorDAO();
			ResultSet vendors = vdao.getVendorDetail();
			String vendorName = pdao.getVendorName(rs.getString("Vendor_id"));%>
			<td width = 50%>Vendor : </td>
			<td width = 50%><select name = "Vendor_id">
				<%while(vendors.next()) { 
					if(vendors.getString("first_name").equals(vendorName)){%>
					<option value = "<%=vendors.getString("user_id")%>" selected="selected"><%=vendors.getString("first_name") %></option>
					<%}
					else {%>
					<option value = "<%=vendors.getString("user_id") %>"><%=vendors.getString("first_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr>
	</table>
		<center><input type="submit" value="Save" class="button1"></center><br>
	</form>
<%} %> 
</div>
	</div>
	
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	
</body>
</html>