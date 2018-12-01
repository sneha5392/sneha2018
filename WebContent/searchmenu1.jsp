<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<script type="text/javascript">
      function doit() {
                        var p=[];
                        var category_id= document.getElementById("category_name").value;
                        $('input.checkb').each( function() {
                        	
                                if($(this).is(':checked')) {
                                	//alert("hello");
                                        p.push($(this).attr('value'));
                                }
                                
                        } );
                       // alert("p :"+p);
                        
                        if(p.length==0)
                        	{
                        	  $('input.checkb').each( function() {
                                  /* if(!$(this).attr('checked')) {
                                          p.push($(this).attr('value'));
                                  } */
                                  
                                  if(!$(this).is(':checked')) {
                                  	//alert("hello");
                                          p.push($(this).attr('value'));
                                  }
                        		  });
                        	
                        	}
                    	
                        
                        if(p.length!=0)
                        	{
		                        $.ajax( {
		                               url:'SearchServlet',
		                                type:'POST',
		                                data: {list:p,
		                                	cat_id:category_id},
		                                success: function(res) {
		                                //	$('#ajaxproduct').listview('refresh');
		                              document.getElementById("ajaxproduct").innerHTML=res;
		                         //  alert(res);
		                                }
		                        });
                        	}
                    
                        }
                
 </script>

<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
<script src="js/menu_jquery.js"></script>



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
	String category_id=request.getParameter("cat_id");
%>
<%@include file="header.jsp"%>
<!-- content -->
	<div class="container">
		<div class="women_main">
			<!-- start sidebar -->
			<div class="col-md-3">
				<div class="w_sidebar">
					<h3>filter by</h3>
					<section class="sky-form">
						<h4>catogories</h4>
						<div class="row1 scroll-pane">
							<div class="col col-4">
							<input type="hidden" value="<%=category_id%>" id="category_name" >
							<%
							//get product other subcategories
							 String product_categories_query ="select subcategory_id,subcategory_name from subcategory_details " +
							"where category_id='"+category_id+"'";
							ResultSet rs_categories = stmt.executeQuery(product_categories_query);
							while(rs_categories.next()){
							%>
								<label class="checkbox">
									
									<input type="checkbox" name="check_categories" value="<%=rs_categories.getString("subcategory_id") %>">
									<i></i><%=rs_categories.getString("subcategory_name") %>
								</label> 
							<%} %>
							</div>
						</div>
					</section>
					<section class="sky-form">
						<h4>brand</h4>
						<div class="row1 scroll-pane">
							<div class="col col-4">
							<%
							//get product brands
							String product_brands_query ="select brand_id,brand_name from brand_details " +
							"where super_category_id=(select super_category_id from category_details where category_id = '"+category_id+"')";
							ResultSet rs_brands = stmt.executeQuery(product_brands_query);
							while(rs_brands.next()){
							%>
								<label class="checkbox">
									<input type="checkbox" class="checkb" name="check_brands" value="<%=rs_brands.getString("brand_id") %>" onclick="doit(); " >
									<i></i><%=rs_brands.getString("brand_name") %>
								</label>
							<%} %>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- start content -->
			<div class="col-md-9 w_content" id="ajaxproduct">
				<!-- <div class="women">
				<a href="#"><h4>Enthecwear - <span>4449 itemms</span></h4></a>
					<ul class="w_nav">
						<li>Sort :</li>
						<li><a class="active" href="#">popular</a>
						</li> |
						<li><a href="#">new </a>
						</li> |
						<li><a href="#">discount</a>
						</li> |
						<li><a href="#">price: Low High </a>
						</li>
						<div class="clear"></div>
					</ul>
					<div class="clearfix"></div>
				</div> -->
				<%
				String menu_product_query ="select p.product_id,p.product_name,p.product_description,p.product_price,p.in_stock,p.images, "+
					"b.brand_name,s.subcategory_name,v.vendor_name "+ 
					"from product_details p inner join brand_details b on p.brand_id=b.brand_id "+ 
					"inner join subcategory_details s on p.subcategory_id=s.subcategory_id "+ 
					"left join vendor_details v on p.vendor_id=v.vendor_id "+
					"where s.subcategory_id in (select subcategory_id from subcategory_details where category_id='"+category_id+"')";
					ResultSet rs_menu = stmt.executeQuery(menu_product_query);
					while(rs_menu.next()){
				%>
				<div class="grid1_of_4" style="text-align: center;" >
					<div class="content_box">
						<a href="product_details.jsp?product_id=<%= rs_menu.getString("product_id") %>">
							<div class="view view-fifth">
								<img src="images/w3.jpg" class="img-responsive" alt="" />
							</div>
						</a>
					</div>
					<h4>
						<a href="product_details.jsp?product_id=<%= rs_menu.getString("product_id") %>"> <%=rs_menu.getString("product_name") %></a>
					</h4>
					<p><%=rs_menu.getString("product_description") %></p>
					<%=rs_menu.getInt("product_price") %>
				</div>
				<%} %>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>