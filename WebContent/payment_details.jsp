<%
/* HTTP 1.1 */  
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");   
/* HTTP 1.0 */  
response.setHeader("Pragma", "no-cache");   
/* Prevents caching at the proxy server */  
response.setDateHeader("Expires", 0);  
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.java.dao.CartDao"%>
<%@page import="com.java.userUtil.*"%>
<%@page import="java.sql.*,java.io.*,com.java.*" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.bs-example{
		margin: 20px;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('a[data-toggle="tab"]').on('shown', function (e) {
        e.target // active tab
        e.relatedTarget // previous tab
    });
	$("#sectionA").show();
    $("#sectionB").hide();
    $("#sectionC").hide();
    $("#tab1").click(function(e){
        e.preventDefault();
        $("#tab1 a:first").tab('show'); 
        $("#sectionA").show();
        $("#sectionB").hide();
        $("#sectionC").hide();
    });
    $("#tab2").click(function(e){
        e.preventDefault();
        $("#tab2 a:first").tab('show');
        $("#sectionA").hide();
        $("#sectionB").show();
        $("#sectionC").hide();
    });
    $("#tab3").click(function(e){
        e.preventDefault();
        $("#sectionA").hide();
        $("#sectionB").hide();
        $("#sectionC").show();
    });
    $(".inputCard").keydown(function (e) {
    	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A
               (e.keyCode == 65 && e.ctrlKey === true) || 
                // Allow: home, end, left, right
               (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
           }
    	if(e.keyCode<48 || e.keyCode>57){
    		e.preventDefault();
    	}
    });
    $("#nameoncard").keydown(function (e) {
    	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A
               (e.keyCode == 65 && e.ctrlKey === true) || 
                // Allow: home, end, left, right
               (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
           }
    	if((e.keyCode<65 || e.keyCode>90) && (e.keyCode<97 || e.keyCode>122)){
    		e.preventDefault();
    	}
    });
    $("#csvnumber").keydown(function (e) {
    	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A
               (e.keyCode == 65 && e.ctrlKey === true) || 
                // Allow: home, end, left, right
               (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
           }
    	if(e.keyCode<48 || e.keyCode>57){
    		e.preventDefault();
    	}
    });
    $("#acnumber").keydown(function (e) {
    	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A
               (e.keyCode == 65 && e.ctrlKey === true) || 
                // Allow: home, end, left, right
               (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
           }
    	if(e.keyCode<48 || e.keyCode>57){
    		e.preventDefault();
    	}
    });
});
	function checklength(id){
		var textval = $("#"+id).val();
		var tlength=$("#"+id).val().length;
		if(tlength!=4 && tlength!=0){
			$("#creditMessage").text("Please Enter 4 Digit");
			$("#creditMessage").show();
			$("#"+id).focus();
		}else{
			$("#creditMessage").text("");
		}
	}
	function validateNB(){
		if($("#banknb").val()=='0'){
			$("#bankMessagenb").text("Please Select Bank");
			$("#bankMessagenb").show();
			return false;
		}else{
			$("#bankMessagenb").hide();
		}
		if($("#acnumber").val()==''){
			$("#acnumberMessage").text("Please Enter Customer ID");
			$("#acnumberMessage").show();
			return false;
		}else{
			$("#acnumberMessage").hide();
		}
		if($("#acpass").val()==''){
			$("#acpassMessage").text("Please Enter Password");
			$("#acpassMessage").show();
			return false;
		}else{
			alert("here");
			$("#acpassMessage").hide();
			return true;
		}
	}
	function validateCC(){
		if($("#bankcc").val()=='0'){
			$("#bankMessagecc").text("Please Select Bank");
			$("#bankMessagecc").show();
			return false;
		}else{
			$("#bankMessagecc").hide();
		}
		if($("#creditCard1").val()=='' || $("#creditCard2").val()=='' || $("#creditCard3").val()=='' || $("#creditCard4").val()==''){
			$("#creditMessage").text("Please Enter Detail");
			$("#creditMessage").show();
		}else{
			$("#creditMessage").hide();
		}
		if($("#nameoncard").val()==''){
			$("#cardnameMessage").text("Please Enter Card Name");
			$("#cardnameMessage").show();
			return false;
		}else{
			$("#cardnameMessage").hide();
		}
		if($("#expireMM").val()=='0' || $("#expireYY").val()=='0'){
			$("#expdateMessage").text("Please Enter Expiry Date");
			$("#expdateMessage").show();
			return false;
		}else{
			$("#expdateMessage").hide();
		}
		if($("#csvnumber").val()==''){
			$("#csvMessage").text("Please Enter CSV Number");
			$("#csvMessage").show();
			return false;
		}else{
			$("#csvMessage").hide();
		}
	}
</script>
<style type="text/css">
.inputCard{
	width: 40px;
}
</style>
<%
ServletContext tcontext = getServletContext();
String title= tcontext.getServletContextName();
%>
<title>
<%=title%>
</title>
</head>
<body  onload="javascript:window.history.forward(1);">
<!-- header -->
<div class="top_bg">
	<div class="container">
		<div class="header_top">
			<div class="top_left">
				<h2>Be Smart Shop Smart</h2>
			</div>
			<div class="top_right">
				<ul>
					<li><a href="">Contact</a>
					</li>
					<b>|</b>
					<%if(session.getAttribute("username")==null){ %>
					<li class="login">
						<div id="loginContainer">
							<a href="#" id="loginButton"><span>Login</span> </a>
							<div id="loginBox">
								<form id="loginForm" url="LoginServlet" method="post"
									name="loginForm">
									<span id="errBox" style="color: red;text-align: center;"></span>
									<fieldset id="body">
										<fieldset>
											<label for="email">Email Address</label> <input type="text"
												name="email" id="email">
										</fieldset>
										<fieldset>
											<label for="password">Password</label> <input type="password"
												name="password" id="password">
										</fieldset>
										<input type="button" id="login" value="Sign in"
											onclick="return validateEmail();"> <!-- <label for="checkbox"><input
											type="checkbox" id="checkbox"> <i>Remember me</i> </label>-->
									</fieldset>
									<span><a href="#">Forgot your password?</a> </span>
								</form>
							</div>
						</div>
					</li>
					
					<!-- if logged in -->
					<%}else{ %>
					<li><a href="">Hello <%=session.getAttribute("username")%></a></li>
					<b>|</b>
					<li><a href="LoginServlet">Logout</a></li>
					<%} %>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- content -->
<div class="container">
	<div class="main">
	<div class="col-md-12 w_content">
	<h3>Address</h3>
	<div class="grid1_of_4"style="text-align: center;" >
		<div class="content_box">
			<div class="view view-fifth" align="center">
				<p style="word-wrap: break-word;font-size: 17px;"><wbr> <%=request.getParameter("selected_address") %></p>
			</div>
		</div>
	</div>
	</div>
	<%
		HttpSession hs = request.getSession();
		String user_id = (String)hs.getAttribute("user_id");
		Connection con = DbUtil.getConnection();
		Statement stmt = con.createStatement();
		String query = "select sum(p.product_price) as total_price from product_details p where p.product_id in " +
		"(select product_id from usercart_details where cart_id="+session.getAttribute("cart_id")+")";
		ResultSet rs_product = stmt.executeQuery(query);
		long total_price=0;
		while(rs_product.next()){
			total_price = rs_product.getLong("total_price");
		}
	%>
	<h3>Payment Details</h3>
<div class="bs-example">
    <ul class="nav nav-tabs">
        <li class="active"><a id="tab1" href="sectionA">Cash On Delivery</a></li>
        <li><a id="tab2" href="sectionB">Net Banking</a></li>
        <li><a id="tab3" href="#">Debit/Credit Card</a></li>
    </ul>
    <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
        <form action="PaymentServlet?form=cod" method="post">
            <h4>Cash On Delivery</h4>
            <p>Total Payable Amount <%=total_price%></p>
            <input type="hidden" value="<%=total_price%>" name="amount_payable">
            <input type="hidden" value="<%=request.getParameter("selected_address") %>" name="shipping_address">
            <input type="hidden" value="COD" name="payment_mode">
            <p>Product will be delivered to above address</p>
            <button class="button1">Continue</button>
		</form>
        </div>
        <div id="sectionB" class="tab-pane fade in active">
        <form action="PaymentServlet?form=nb" method="post">
            <h4>Net Banking</h4>
            <p>Total Payable Amount <%=total_price%></p>
            <input type="hidden" value="<%=total_price%>" name="amount_payable">
            <input type="hidden" value="<%=request.getParameter("selected_address") %>" name="shipping_address">
            <input type="hidden" value="NB" name="payment_mode">
            <table>
            	<tr>
            		<td>Bank Name:</td>
            		<td>
            		<select name='banknb' id='banknb'>
											<option value='0'>Bank</option>
											<option value='1'>ICICI</option>
											<option value='2'>HDFC</option>
											<option value='3'>KOTAK MAHINDRA</option>
											<option value='4'>CITY BANK</option>
											<option value='5'>YES BANK</option>
											<option value='6'>BOI</option>
									</select></td>
					<td><span id="bankMessagenb" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>Customer ID:</td>
            		<td><input type="text" name="acnumber" id="acnumber" /></td>
            		<td><span id="acnumberMessage" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>Password:</td>
            		<td><input type="password" name="acpass" id="acpass" /></td>
            		<td><span id="acpassMessage" style="display: none;color: red;"></span></td>
            	</tr>
            </table>
            <br/>
            <p>Product will be delivered to above address</p>
            <button class="button1" type="submit" onclick="return validateNB();">Continue</button>
		</form>
        </div>
        <div id="sectionC" class="tab-pane fade in active">
        <form action="PaymentServlet?form=cc" method="post">
            <h4>Debit/Credit Card</h4>
            <p>Total Payable Amount <%=total_price%></p>
            <input type="hidden" value="<%=total_price%>" name="amount_payable">
            <input type="hidden" value="<%=request.getParameter("selected_address") %>" name="shipping_address">
            <input type="hidden" value="CC" name="payment_mode">
            <table>
            	<tr>
            		<td>Bank Name:</td>
            		<td>
            		<select name='bankcc' id='bankcc'>
											<option value='0'>Bank</option>
											<option value='01'>ICICI</option>
											<option value='02'>HDFC</option>
											<option value='03'>KOTAK MAHINDRA</option>
											<option value='04'>CITY BANK</option>
											<option value='05'>YES BANK</option>
											<option value='06'>BOI</option>
									</select></td>
					<td><span id="bankMessagecc" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>Credit Card Number :</td>
            		<td><input class="inputCard" maxlength="4" type="text" name="creditCard1" id="creditCard1" onblur="checklength(this.id);"/>-
						<input class="inputCard" maxlength="4" type="text" name="creditCard2" id="creditCard2" onblur="checklength(this.id);"/>-
						<input class="inputCard" maxlength="4" type="text" name="creditCard3" id="creditCard3" onblur="checklength(this.id);"/>-
						<input class="inputCard" maxlength="4" type="text" name="creditCard4" id="creditCard4" onblur="checklength(this.id);"/>
						</td>
					<td><span id="creditMessage" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>Name on Card</td>
            		<td><input type="text" name="cardname" id="nameoncard"> </td>
            		<td><span id="cardnameMessage" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>Expiry Date:</td>
            		<td>
            			<select name='expireMM' id='expireMM'>
											<option value='0'>Month</option>
											<option value='01'>Janaury</option>
											<option value='02'>February</option>
											<option value='03'>March</option>
											<option value='04'>April</option>
											<option value='05'>May</option>
											<option value='06'>June</option>
											<option value='07'>July</option>
											<option value='08'>August</option>
											<option value='09'>September</option>
											<option value='10'>October</option>
											<option value='11'>November</option>
											<option value='12'>December</option>
									</select> <select name='expireYY' id='expireYY'>
											<option value='0'>Year</option>
											<option value='10'>2014</option>
											<option value='11'>2015</option>
											<option value='12'>2016</option>
											<option value='12'>2017</option>
											<option value='12'>2018</option>
											<option value='12'>2019</option>
											<option value='12'>2020</option>
											<option value='12'>2021</option>
											<option value='12'>2022</option>
											<option value='12'>2023</option>
											<option value='12'>2024</option>
									</select></td>
						<td><span id="expdateMessage" style="display: none;color: red;"></span></td>
            	</tr>
            	<tr>
            		<td>CSV Number</td>
            		<td><input class="csvnumber" maxlength="3" type="password" name="csvnumber" id="csvnumber" style="width: 30px;"/></td>
            		<td><span id="csvMessage" style="display: none;color: red;"></span></td>
            	</tr>
            </table>
            <br/>
            <p>Product will be delivered to above address</p>
            <button class="button1" type="submit" onclick="return validateCC();">Continue</button>
		</form>
        </div>
    </div>
</div>
</div>
</div>
<!-- footer -->
<%@include file="footer.jsp"%>
</body>
</html>