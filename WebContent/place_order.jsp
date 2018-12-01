<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.java.dao.CartDao"%>
<%@page import="com.java.userUtil.*"%>
<%@page import="java.sql.*,java.io.*,com.java.*" %>
<%ServletContext context = getServletContext(); %>
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
	function check(){
		var userid = document.getElementById("email");
		var passid = document.getElementById("password");
		if(userid.value.length==0 || passid.value.length==0){
			document.getElementById("errBox").innerHTML="<label>Please Enter Details !!</label>";
			return false;
		}else{
			validateEmail(userid);
		}
	}
	function validateEmail() {
		var fld = document.getElementById("email");
	    var tfld = trim(fld.value);                        // value of field with whitespace trimmed off
	    var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
	    var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/;
	    if (fld.value == "") {
	        fld.style.background = 'Yellow';
	        document.getElementById("errBox").innerHTML="<label>You didn't enter an email address !!</label>";
	        error = "error1";
	    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
	        fld.style.background = 'Yellow';
	        document.getElementById("errBox").innerHTML="<label>Please enter a valid email address !!</label>";
	        error = "error2";
	    } else if (fld.value.match(illegalChars)) {
	        fld.style.background = 'Yellow';
	        document.getElementById("errBox").innerHTML="<label>The email address contains illegal characters !!</label>";
	        error = "error3";
	    } else {
	        Submit();
	    }
	}
	function trim(s)
	{
		return s.replace(/^\s+|\s+$/, '');
	}
	function Submit() {
		
		var form = $('#loginForm');
		$.ajax({
			type : form.attr('method'),
			url : form.attr('url'),
			dataType : "json",
			data : {
				email : $('#email').val(),
				password : $('#password').val()
			},

			success : function(data) {
				
				//alert(JSON.stringify(data));
				var result = data;
				var location=window.location.href;
				if (result.role == "A") {
					//alert(result.role);
					newURL=location.substring(0,location.lastIndexOf("/") + 1)+"admin.jsp";
					window.location.href=newURL;
				} else if (result.role == "C") {
					window.location.reload();
				} else {
					document.getElementById("errBox").innerHTML="<label>Invalid Email or Password !!</label>";
				}
			}
		});
		return false;
	}
	function setAddress(id){
		$("#selected_address").val(id);
		$("#selected_one").val(id);
	}
	function addNewAddress(){
		$("#selected_address").val($("#selected_one").val());
		return true;
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
<div class="container" style="min-height: 550px;">
	<div class="main">
	<h3>Address Details</h3>
	<div class="col-md-9 w_content">
	<%
		String address=null;
		HttpSession hs = request.getSession();
		String user_id = (String)hs.getAttribute("user_id");
		String product_query ="(select billing_address from user_details where user_id='"+user_id+"') "+
			"union (select shipping_address from order_details where user_id='"+user_id+"');";
		Connection connection = DbUtil.getConnection();
		Statement stmt = connection.createStatement();
		ResultSet rs_address = stmt.executeQuery(product_query);
		int counter=0;
		while(rs_address.next()){
			counter++;
	%>
		<div class="grid1_of_4"style="text-align: center;" >
			<div class="content_box">
				<a href="#">
					<div class="view view-fifth" align="center">
					Address <%=counter %>
					</div>
				</a>
			</div>
			<p style="word-wrap: break-word;"><wbr> <%=rs_address.getString("billing_address") %></p>
			<h4><a id="<%=rs_address.getString("billing_address") %>" href="#" onclick="setAddress(this.id);">Select Address</a></h4>
		</div>
		<%} %>
		
		
	</div>
	<div class="col-md-9 w_content">
		<div class="grid1_of_4"style="text-align: center;" >
		<form action="payment_details.jsp" method="post">
			<table>
				<tr>
					<td>New Address:</td>
					<td><textarea id="selected_one" rows="5" cols="50" name="customer_address"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" id="selected_address" name="selected_address" value=""></td>
				</tr>
				<tr>
					<td></td>
					<td><!-- <a class="button1" href="#" onclick="addNewAddress();"><span>Add Address</span></a> -->
					<button id="submit_address" type="submit" class="button1" onclick="return addNewAddress();"><span>Add Address</span></button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	</div>
</div>
<div class="footer">
	<div class="container">
		<div class="copy">
			<p class="link">&copy; All rights reserved</p>
		</div>
	</div>
</div>
</body>
</html>