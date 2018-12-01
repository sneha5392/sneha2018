<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sun.org.mozilla.javascript.internal.ast.ForLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import = "java.sql.*,com.java.dao.*"
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"> 
<link href="css/bootstrap.css" rel="stylesheet" type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/fwslider.css" media="all">
<script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="js/megamenu.js"></script>
 
 
 <!-- Validation script -->
 <script type="text/javascript" src="js/registerValidation.js"></script>
  <script> 
var d = new Date();
var year = d.getFullYear();

$(function() {   
	$( "#datepicker" ).datepicker({      
		changeMonth: true,     
		changeYear: true,
		yearRange: '1970:' + year+'',
		maxDate:new Date(),
		dateFormat: 'dd/mm/yy'
		
		});
	});  
</script>
 
 
 <!-- =========================================================== -->
 
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();

		

			 $("#mail").blur(function() { 
				//alert( "Handler for .blur() called." );
				
				var a=$('#mail').val();
				if(a.length==0){
					$('#mail').focus();
				}
				else
					{
					//alert("helo");
					$.ajax({
						type :'POST',
						url : 'EmailValidateServlet',
						dataType : "json",
						data : {
							email : $('#mail').val()
							
						},

						success : function(data) {
							
							var result=data;
							//alert(JSON.stringify(data));
							if(result.email=="false")
								{
								document.getElementById("checkEmail").innerHTML="already exist";
								$("#mail").val("");
								$('#mail').focus();
								
								}
							else{
								document.getElementById("checkEmail").innerHTML="";
							}
						}
					});
					}
				
				
				
				});  
			
			
		});

	</script>


<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
<script src="js/menu_jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>

</head>
<body>
	
	<%@include file="adminheader.jsp"%>
	
	<!-- header -->
	<div class="container">
		<div class="main"><br>
		<div>
			<a href = "admin.jsp">Admin Home Page</a>
		</div>
	<h2 class="title" align=center>User Registration</h2><br>
				<form name="Addadminform" action="AdminServlet" onsubmit="return validateFormOnSubmit(this);" method="post">
				<input type="hidden" value="" id="msgTemp" name="msgTemp" />
					<table align="center" width = 50% class = "table_admin">
						<tr>
							<td colspan="2" style="padding-bottom:10px;">
								<p class="anyfont">First Name <span style = "color:red;">*</span> :</p></td>
								
							<td colspan="2">
								<p class="anyfont">Last Name <span style = "color:red;">*</span> :</p></td>
								
						</tr>

						<tr>
							<span id="errBox1" style="color:red"></span>
							<td colspan="2" style="padding-bottom:10px;">
								
								<!-- <input type="text" class="textbox" name="fname" id="fname"
								value="" onblur="validateUsername(this.value);"/> -->
								<input type="text" class="textbox" name="fname" id="fname"
								value="" />
								</td>
								
							<td colspan="2" style="padding-bottom:10px;"> 
								<input type="text" class="textbox"
								name="lname" value=""/></td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">Address <span style = "color:red;">*</span> :</p></td>
							<td colspan="3" style="padding-bottom:10px;">
								 <textarea rows="5" cols="34" name="address"></textarea></td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">State <span style = "color:red;">*</span> :</p></td>
							<td colspan="3">
							<select name="state" class = "othertextbox" id="checkState" name="checkState">
									<option value="-1" selected>Select State</option>
									<%
										CreateUserDAO udao = new CreateUserDAO();
										ResultSet rs = udao.retriveStates();
										while(rs.next()){
											String sid = rs.getString("state_id");
											String sname = rs.getString("state_name");
									%>
									 <option value="<%= sid %>"><%=sname%></option> 
									<%
										}
									%>
							</select>
							</td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">Phone No <span style = "color:red;">*</span> :</p>
							<td colspan="3"><input class="othertextbox" type="text"
								name="phone" /></td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">Birth Date <span style = "color:red;">*</span> :</p>
							<td colspan = "3"><input type = "text" name = "birthdate" id = "datepicker" readonly="readonly"></td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">Email Id <span style = "color:red;">*</span> :</p>
							<td colspan="3"><input class="othertextbox" type="text"
								name="mail" value=""  id="mail" /></td>
						</tr>
					<tr>
					<td>
					<td  colspan="3"><span id="checkEmail" style="color:red"></span></td>
					</tr>
						<tr>
							<td>
								<p class="anyfont">Password <span style = "color:red;">*</span> :</p>
							<td colspan="3"><input class="othertextbox" type="password"
								name="Password" id="pass"/></td>
						</tr>

						<tr>
							<td>
								<p class="anyfont">Retype Password <span style = "color:red;">*</span> :</p>
							<td colspan="3"><input class="othertextbox" type="password"
								name="retypePassword" id="repass"/>
							</td>
						</tr>
						
						<tr>
							<td><p class="anyfont">Role <span style = "color:red;">*</span> :</p></td>
							<td colspan="3">
							<select name = "role" class="othertextbox" id="checkRole" name="checkRole">
								<option value="-1" selected>Select Role</option>
									<%
										CreateUserDAO udao1 = new CreateUserDAO();
										ResultSet r = udao1.retriveRole();
										while(r.next()){
											String rid = r.getString("role_id");
											String rname = r.getString("role_name");
									%>
									 <option value="<%= rid %>"><%=rname%></option> 
									<%
										}
									%>
							</select>
							</td>
						</tr>
						</table>
						<center><input class="button1" type="submit" value="Register" /></center>
				</form>
		</div>
		</div>
	
		<!--  footer --> 
		<%@include file="footer.jsp"%>
		<!--  footer end-->	
</body>
</html>