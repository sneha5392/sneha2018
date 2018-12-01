<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary JavaScript plugins) -->
<script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="js/menu_jquery.js"></script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
			jQuery(document).ready(function($){

				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
				});

			});
		</script>
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$('.scroll-pane').jScrollPane();
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
ServletContext tcontext = getServletContext();
String title= tcontext.getServletContextName();
%>
<title>
<%=title%>
</title>
</head>
<body>
<%
	//get product id
	String product_id=request.getParameter("product_id");
%>
<!-- header -->
<%@include file="header.jsp"%>
<!-- content -->
<div class="container">
	<div class="women_main">
		<!-- start content -->
		<div class="row single">
			<div class="col-md-9">
				<%
					String product_query ="select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images, "+
					"b.brand_name,s.subcategory_name,v.vendor_name "+ 
					"from product_details p inner join brand_details b on p.brand_id=b.brand_id "+ 
					"inner join subcategory_details s on p.subcategory_id=s.subcategory_id "+ 
					"left join vendor_details v on p.vendor_id=v.vendor_id "+
					"where p.product_id='"+product_id+"'";
					ResultSet rs_product = stmt.executeQuery(product_query);
					while(rs_product.next()){
				%>
				<div class="single_left">
					<div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_source_image" src="<%= request.getContextPath() %>/images/<%= rs_product.getString("images") %>" class="img-responsive" title="" />
								</a>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="desc1 span_3_of_2">
					<h3><%=rs_product.getString("product_name") %></h3>
					<p>Rs.<%=rs_product.getInt("product_price") %></p>
					
					<div class="btn_form">
						<a class="buy_class" href="AddtoCartServlet?product_id=<%=rs_product.getString("product_id")%>" onclick="check_session(this);">buy</a>
						<input type="hidden" id="buy_hidden" value="1">
						<span id="buy_msg" style="display: none;">&nbsp;Please Login To Continue</span>
					</div>
			   	 </div>
				</div>
				<div class="single-bottom1">
					<h6>Details</h6>
					<p class="prod-desc"><%=rs_product.getString("product_description") %></p>
				</div>
				<div class="clearfix"></div>
				
				<%} %>
				<div class="single-bottom2">
					<h6>Related Products</h6>
					<%
					String related_product_query ="select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images, "+
					"b.brand_name,s.subcategory_id,s.subcategory_name,v.vendor_name "+ 
					"from product_details p inner join brand_details b on p.brand_id=b.brand_id "+ 
					"inner join subcategory_details s on p.subcategory_id=s.subcategory_id "+ 
					"left join vendor_details v on p.vendor_id=v.vendor_id "+
					"where s.subcategory_id = ( select subcategory_id from product_details where product_id= '"+product_id+"' ) and "+
					"p.product_id not in ('"+product_id+"') limit 4";
					ResultSet rs_related_product = stmt.executeQuery(related_product_query);
					while(rs_related_product.next()){
					%>
						<div class="product">
						   <div class="product-desc">
								<div class="product-img">
		                           <img src="<%= request.getContextPath() %>/images/<%= rs_related_product.getString("images") %>" class="img-responsive " alt="" style="width: 100px;height: 150px;"/>
		                       </div>
		                       <div class="prod1-desc">
		                           <h5><a class="product_link" href="product_details.jsp?product_id=<%=rs_related_product.getString("product_id")%>"><%=rs_related_product.getString("product_name") %></a></h5>
		                           <p class="product_descr"><%=rs_related_product.getString("product_description") %></p>									
							   </div>
							  <div class="clearfix"></div>
					      </div>
						  <div class="product_price">
								<span class="price-access">Rs.<%=rs_related_product.getInt("product_price") %></span>
								<!-- <button class="button1"><span>Add to cart</span></button> --><br/>
								<a class="button1" href="AddtoCartServlet?product_id=<%=rs_related_product.getString("product_id")%>"><span>Add to cart</span></a>
								<span class="addcart_msg" style="display: none;font-size: 12px;">&nbsp;Please Login To Add</span>
		                  </div>
						 <div class="clearfix"></div>
				     </div>
				    <%} %>
		   	  </div>
			</div>
				<div class="col-md-3">
					
				</div>
				<div class="clearfix"></div>
			</div>
		<!-- end content -->
	</div>
</div>
<%@include file="footer.jsp"%>
<%if(session.getAttribute("username")==null){%>
	<script type="text/javascript">
		function check_session() {
			if($("#buy_hidden").val()=="0")
			$("#buy_msg").show();
		}
		$(".buy_class").removeAttr("href");
		$("#buy_hidden").val("0");
		$(".button1").attr("disabled","disabled");
		$(".addcart_msg").show();
	</script>
<%}%>
</body>
</html>