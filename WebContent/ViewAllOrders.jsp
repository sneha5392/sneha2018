<%@page import="com.java.model.UserInfo"%>
<%@page import="java.util.Date"%>
<%@page import="com.java.dao.OrdersDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"> 
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
<link rel="stylesheet" href="css/bootstrap.css"></link>
<link rel="stylesheet" href="css/bootstrap.min.css"></link>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	var d = new Date();
	var year = d.getFullYear();

	$(function() {
		$('#datepicker').datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1970:' + year + ''

		});
	});

	$(function() {
		$('#datepicker1').datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1970:' + year + ''

		});
	});
</script>
</head>
<body>
	<!--  header -->
		<%@include file="adminheader.jsp"%>
	<!--  header -->
	<div class="container">
		<div class="main"><br>
		<%String role = request.getParameter("role");
		if(role.equals("Admin")){ %>
		<div>
			<a href = "admin.jsp">Admin Home Page</a>
		</div>
		<%}else if(role.equals("Partial")){%>
		<div>
			<a href = "partialAdmin.jsp">Partial Admin Home Page</a>
		</div>
		<%} %>
	<%
		ResultSet rs = (ResultSet) request.getAttribute("result");
		ResultSet rs1 = null;
		int i = 0;
		int j = 0;
		int trackid = 0;
		int orderid = 0;
		String productid = null;
	%>
	<div>
		<h1 align="center">Order Details</h1><br>
		<table border="1" align="center">
			<tr>
				<th>Expand</th>
				<th>Order Id</th>
				<th>Order Date</th>
				<th>User Id</th>
				<th>Total Amount</th>
				<th>Proposed Delivery Date</th>
				<!-- <th>Actual Shipping Date</th> -->
				<th>Payment Mode</th>
				<!-- <th>Status</th>
			<th>Action</th> -->
			</tr>
			<%
				while (rs.next()) {
			%>

			<tr>
				<td tableid="des<%=i%>" class="main1">+</td>

				<%
					orderid = rs.getInt("Order_id");
				%>
				<td><%=orderid%></td>

				<%
					Date d = (Date) rs.getObject("Order_date");
						UserInfo ui = new UserInfo();
						String finalDate = ui.FormatDateForJSP(d);
				%>
				<td><%=finalDate%></td>
				<td><%=rs.getString("user_id")%></td>
				<td><%=rs.getString("Total_bill")%></td>
				<td><%=rs.getObject("Proposed_delivery_date")%></td>
				<td><%=rs.getString("Payment_mode_id")%></td>
			</tr>
			<tr class="des<%=i%>" style="display: none;">
				<%
					i++;
				%>
				<td></td>
				<td colspan="6">
					<table border="1">
						<tr>
							<th>Expand</th>
							<th>Product Id</th>
							<th>Quantity</th>
						</tr>
						<%
							OrdersDAO odao1 = new OrdersDAO();
								rs1 = odao1.viewOrderDetails(orderid);
								while (rs1.next()) {
						%>
						<tr>
							<td tableid="scnd<%=j%>" class="main2">+</td>
							<%
								productid = rs1.getString("Product_id");
							%>
							<td><%=productid%></td>
							<td><%=rs1.getString("Quantity")%></td>
						</tr>

						<tr class="scnd<%=j%>" style="display: none;">
							<%
								j++;
							%>
							<td></td>
							<td colspan="4">
								<table border="1">
									<tr>
										<th><a href="#SaveModal" role="button" class="btn popup"
											data-toggle="modal" id = "plus"  order_id="<%=orderid%>" product_id="<%=productid%>">+</a>
										</th>
										<th>Status Date</th>
										<th>Status ID</th>
										<!--  model -->

										<div id="SaveModal" class="modal fade"
											tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<form action="OrderHistorySaveServlet?role=<%=role %>"
												method="post">
												<input type="hidden" name = "orderidhdn" id="orderidhdn" value="" >
												<input type="hidden" name = "productidhdn" id="productidhdn" value="" >
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">X</button>
															<h3 id="myModalLabel">Order History</h3>
														</div>

														<div class="modal-body">
															<p>Status Date :</p>
															<input id="datepicker1" type="text" name="status_date" />
															<p>Status :</p>
															<%
																OrdersDAO odao = new OrdersDAO();
																		ResultSet rs3 = odao.getStatusDetails();
															%>
															<select name="status">
																<option value="none">Select Status</option>
																<%
																	while (rs3.next()) {
																%>
																<option value="<%=rs3.getString("Status_id")%>"><%=rs3.getString("Status_name")%></option>
																<%
																	}
																%>
															</select>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">Close</button>
															<button type="submit" class="btn btn-primary"
																id="submitForm">Save</button>
														</div>
													</div>
												</div>
											</form>
										</div>




										<!--  end model -->
									</tr>
									<%
										ResultSet rs2 = odao.getOrderProductHistoryDetails(orderid,
														productid);
												while (rs2.next()) {
									%>
									<tr>
										<%
											trackid = rs2.getInt("Tracking_id");
										%>
										<td><a
											href="OrderHistoryDeleteServlet?trackid=<%=trackid%>&role=<%=role%>">Delete</a>
										</td>
										<td><%=rs2.getString("Status_date")%></td>
										<td><%=rs2.getString("Status_id")%></td>
									</tr>
									<%
										}
									%>

								</table></td>
						</tr>
						<%
							}
						%>
					</table></td>
			</tr>

			<%
				}
			%>
		</table>
	</div>
	</div>
	</div>
	<!--  footer --> 
		<%@include file="footer.jsp"%>
	<!--  footer end-->	

</body>
</html>

<script>
	$(".main1").click(function() {
		var table = $(this).attr('tableid');
		$('.' + table).slideToggle("slow", function() {
		});
	});

	$(".main2").click(function() {
		var table = $(this).attr('tableid');
		$('.' + table).slideToggle("slow", function() {
		});
	});
	$('.popup').click(function() {
		//alert("hi");
		var order_id=$(this).attr('order_id');
		var product_id=$(this).attr('product_id');
		$('#orderidhdn').val(order_id);
		$('#productidhdn').val(product_id);
		//alert($('#orderidhdn').val());
		//alert($('#productidhdn').val());
		$('#SaveModal').modal("show");
	});
</script>