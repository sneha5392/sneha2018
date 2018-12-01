<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	CartDao cdo = new CartDao();
	HttpSession hso = request.getSession();
	String user_id1 = (String)hso.getAttribute("user_id");
	int cart_id = cdo.getCartId(user_id1);
	HttpSession hs1 = request.getSession();
	hs1.setAttribute("cart_id",cart_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary JavaScript plugins) -->
<script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="js/menu_jquery.js"></script>
<script type="text/javascript">
function validate_quantity(id) {
	var type = "qty";
	var value = $("#text_qty").val();
	<%-- var prod_id = '<%=product_id%>'; --%>
	if(isNaN(value)){
		document.getElementById("text_qty_msg").innerHTML="Only Numeric Values Allowed";
		$("#text_qty").css("background-color","yellow"); 
		$("#text_qty_msg").focus();
	}else{
		if(value<=0){
			document.getElementById("text_qty_msg").innerHTML="Product Quantity not allowed";
			$("#text_qty").css("background-color","yellow");
		}else{
			document.getElementById("text_qty_msg").innerHTML="";
			$("#text_qty").css("background-color","#ffffff");
			$.ajax( {
				url:'CartServlet',
                type:'POST',
                data: {
                	type:type,
                	qty:value,
                	prod_id:prod_id
                },
                success: function(res) {
            		if(res>0){
            			alert(res);
            		}
                }
         	});
		}
	}
}
function removeProduct(id){
	var type = "remove";
	var cart_id = "<%=cart_id%>";
	$.ajax( {
		url:'CartServlet',
        type:'POST',
        data: {
        	type:type,
        	product_id:id,
        	cart_id:cart_id
        },
        success: function(res) {
    		$("#div_"+id).hide();
    		$("#sub_price").text(res);
    		$("#total_price").text(res);
        }
 	});
}
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
<!-- header -->
<%@include file="header.jsp"%>
<!-- content -->
<div class="container">
	<div class="main">
	<%
	String product_query ="select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images, "+
	"b.brand_name,s.subcategory_name,v.vendor_name "+ 
	"from product_details p inner join brand_details b on p.brand_id=b.brand_id "+ 
	"inner join subcategory_details s on p.subcategory_id=s.subcategory_id "+ 
	"left join vendor_details v on p.vendor_id=v.vendor_id "+
	"where p.product_id in (select product_id from usercart_details where cart_id="+cart_id+")";
	ResultSet rs_product = stmt.executeQuery(product_query);
	int total_price=0;
	while(rs_product.next()){
	%>
		<div class="shoping_bag1" id="div_<%=rs_product.getString("product_id")%>">
			<div class="shoping_left">
				<div class="shoping1_of_1">
					<img src="<%= request.getContextPath() %>/images/<%= rs_product.getString("images") %>" class="img-responsive" alt="<%= rs_product.getString("product_name") %>" />
				</div>
				<div class="shoping1_of_2">
					<h4>
						<a href="#"><%=rs_product.getString("product_name") %></a>
					</h4>
					<span> 
						code :&nbsp;<%=rs_product.getString("product_id") %> | 
						Quantity :&nbsp;<b><input id="text_qty" type="text" value="1" style="width: 5%;text-align: center;" onblur="validate_quantity(this.id);" disabled="disabled"></b>
						&nbsp;<span id="text_qty_msg" style="color: red;"></span>
					</span>
					<ul class="s_icons">
						<li><a id="<%=rs_product.getString("product_id")%>" href="#" onclick="removeProduct(this.id);"><img src="images/s_icon3.png" alt=""></a></li>
					</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="shoping_right">
					<p>Price&nbsp;&nbsp;<span id="product_price_span"><%=rs_product.getInt("product_price") %></span>
					</p>
				</div>	
			<div class="clearfix"></div>
		</div>
		<% total_price+=rs_product.getInt("product_price");%>
	<%} %>
		<div class="shoping_bag1">
		<div class="shoping_left">
			<h2>VAT and Delivery Charges</h2>
		</div>
		<div class="shoping_right">
			<p>sub total &nbsp;<span id="sub_price"> Rs. <%=total_price%></span></p>
			<p>vat collected &nbsp;<span id="vat"> Rs. 91</span></p>
			<p>delivery &nbsp;<a href="#">free</a>&nbsp;<span id="delivery_charges"> Rs. 0</span></p>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="shoping_bag2">
		<div class="shoping_left">
			<a class="btn1" href="place_order.jsp?cart_id?<%=cart_id%>">place order</a>
		</div>
		<div class="shoping_right">
			<p class="tot">total &nbsp;<span id="total_price"> Rs.<%=total_price%></span></p>
		</div>
		<div class="clearfix"></div>
	</div>
	
	</div>
</div>
<!-- footer -->
<%@include file="footer.jsp"%>
</body>
</html>