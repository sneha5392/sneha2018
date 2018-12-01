<%@page import="java.sql.Connection"%>
<%@page import="com.java.userUtil.*"%>
<%@page import="java.sql.*,java.io.*,com.java.*"%>
<%@page import="sun.org.mozilla.javascript.internal.ast.ForLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link rel="stylesheet" href="css/index.css" /> -->
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	ServletContext tcontext = getServletContext();
	String title = tcontext.getServletContextName();
%>
<title><%=title%></title>
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>


	<!-- content -->
	<div class="container">
		<div class="main">
			<div class="row content_top">
				<div class="col-md-9 content_left">
					<!-- start slider -->
					<div id="fwslider">
						<div class="slider_container">
							<div class="slide">
								<!-- Slide image -->
								<img src="images/slider1.jpg" class="img-responsive" alt="" />
								<!-- /Slide image -->
							</div>
							<!-- /Duplicate to create more slides -->
							<div class="slide">
								<img src="images/slider2.jpg" class="img-responsive" alt="" />
							</div>
							<div class="slide">
								<img src="images/slider3.jpg" class="img-responsive" alt="" />
							</div>
							<!--/slide -->
						</div>
						<div class="timers"></div>
						<div class="slidePrev">
							<span></span>
						</div>
						<div class="slideNext">
							<span></span>
						</div>
					</div>
					<!-- end  slider -->
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- start content -->
			<div class="content">
				<div class="content_text">
					<h4>Our Products</h4>
				</div>
				<!-- grids_of_3 -->
				<div class="row grids">
					<%
						//Query for index page products
						String index_product_query = "select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images,b.brand_name,s.subcategory_name,v.vendor_name from product_details p inner join brand_details b on p.brand_id=b.brand_id inner join subcategory_details s on p.subcategory_id=s.subcategory_id left join vendor_details v on p.vendor_id=v.vendor_id limit 15";
						ResultSet rs_index = stmt.executeQuery(index_product_query);
						while (rs_index.next()) {
					%>
					<div class="col-md-3 grid1">
						<a
							href="product_details.jsp?product_id=<%=rs_index.getString("product_id")%>">
							<img
							src="<%=request.getContextPath()%>/images/<%=rs_index.getString("images")%>"
							class="img-responsive"
							alt="<%=rs_index.getString("product_name")%>"
							style="width: 270px; height: 300px;" />
							<div class="look">
								<h4><%=rs_index.getString("product_name")%></h4>
								<p><%=rs_index.getString("product_description")%></p>
								<p>
									Rs.<%=rs_index.getString("product_price")%></p>
							</div> </a>
					</div>
					<%
						}
					%>
				</div>
				<!-- end grids_of_3 -->
			</div>
			<!-- end content -->
		</div>
	</div>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>