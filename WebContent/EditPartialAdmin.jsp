<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.util.*,java.text.*,java.sql.*,com.java.model.UserInfo,com.java.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<script type="text/javascript">
function validateFormOnSubmit(theForm) {
var reason = "";

  reason += validateUsername(theForm.firstname);
  reason += validateLastname(theForm.lastname);
  
  reason += validateAddress(theForm.billingaddress);
  //reason += validateState(theForm.state);
  reason += validatePhone(theForm.phoneno);
  reason += validateBirthDate(theForm.birthdate);
  //alert("hello1");
  //reason += validateRole(theForm.checkRole);
  reason += validateMail(theForm.emailid);
  reason += validatePassword(theForm.password);
  
  
  
  
 // reason += validateEmpty(theForm.from);
    // alert(reason); 
  if (reason != "") {
    //alert("Some fields need correction:\n" + reason);
    document.getElementById("errBox1").innerHTML=reason;
    return false;
  }else{
  //alert("All fields are filled correctly");
  return true;
  }
}
function validateEmpty(fld) {
    var error = "";
 
    if (fld.value.length == 0) {
        fld.style.background = 'Yellow'; 
        error = "Required fields are empty.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;  
}
function validateUsername(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z]*$/; // allow letters
   
   //alert(illegalChars.test(fld.value));
    
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter UserName.<br />";
    } else if ((fld.value.length < 2) || (fld.value.length > 15)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Username is invalid.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Username contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validateLastname(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z]*$/; // allow letters
 
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter LastName.<br />";
    } else if ((fld.value.length < 2) || (fld.value.length > 15)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Lastname is invalid.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Lastname contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validateAddress(fld) {
    var error = "";
    var illegalChars = /^[a-zA-Z0-9-_  ]+$/; // allow letters, numbers, and underscores
 
    if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter Address.<br />";
    } else if ((fld.value.length < 5) || (fld.value.length > 30)) {
        fld.style.background = 'Yellow'; 
        error = "Length of Address is invalid.<br />";
    } else if (!illegalChars.test(fld.value)) {
        fld.style.background = 'Yellow'; 
        error = "Address contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validatePassword(fld) {
    var error = "";
    var illegalChars = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/; // at least one number, one lowercase and one uppercase letter
    // at least six characters

 
    if (fld.value == "") {
        fld.style.background = 'Yellow';
        error = "Enter Password.<br />";
    } /* else if ((fld.value.length < 7) || (fld.value.length > 15)) {
        error = "The password length should be more than 7. <br />";
        fld.style.background = 'Yellow';
    } */ else if (!illegalChars.test(fld.value)) {
        error = "Password should contain atleast one number, one lowercase, one uppercase and min length should be six.<br />";
        fld.style.background = 'Yellow';
    } /* else if (!((fld.value.search(/(a-z)+/)) && (fld.value.search(/(0-9)+/)))) {
        error = "The password must contain at least one number.<br />";
        fld.style.background = 'Yellow';
    } */ else {
        fld.style.background = 'White';
    }
   return error;
}  
function trim(s)
{
  return s.replace(/^\s+|\s+$/, '');
}
function validateMail(fld) {
    var error="";
   // alert("hello");
    var tfld = trim(fld.value);                        // value of field with whitespace trimmed off
    //var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
   // var emailFilter=/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
   var emailFilter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
    if (fld.value == "") {
        fld.style.background = 'Yellow';
        error = "Enter email address.<br />";
    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
        fld.style.background = 'Yellow';
        error = "Enter valid email address.<br />";
    } else if (fld.value.match(illegalChars)) {
        fld.style.background = 'Yellow';
        error = "Email address contains illegal characters.<br />";
    } else {
        fld.style.background = 'White';
    }
    return error;
}
function validateBirthDate(fld) {
    var error = "";
 
    if (fld.value.length == 0) {
        fld.style.background = 'Yellow'; 
        error = "Enter birth date.<br />";
    }else if (fld.value == "") {
        fld.style.background = 'Yellow'; 
        error = "Enter birth date.<br />";
    }  else {
        fld.style.background = 'White';
    }
    return error;  
}
  
function validatePhone(fld) {
    var error = "";
    //var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');    
    var phoneFilter = /^[0-9]+$/ ;
   // alert(phoneFilter.test(fld.value));
   if (fld.value == "") {
        error = "Enter phone number.<br />";
        fld.style.background = 'Yellow';
    } 
   	else if (!phoneFilter.test(fld.value)) {              
       fld.style.background = 'Yellow';
       error = "Phone number should contain only digits.<br />";
   }/*else if (isNaN(parseInt(stripped))) {
        error = "The phone number contains illegal characters.<br />";
        fld.style.background = 'Yellow';
    }*/ else if (!(fld.value.length == 10)) {
        error = "Phone number should be of length 10.<br />";
        fld.style.background = 'Yellow';
    }
    else {
        fld.style.background = 'White';
    }
    return error;
}
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
				<a href = "AllUserServlet?role=Partial">Back</a>
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
	<h1 align = "center"> Partial Admin Details</h1><br><br>
	<%
 		ResultSet rs=(ResultSet)request.getAttribute("result");
		while(rs.next()){
	%>
	<form action="CustomerUpdateServlet?role=Partial" method="post" onsubmit="return validateFormOnSubmit(this);">
	<table align = "center" width = 50% class = "table_admin">
	<span id="errBox1" style="color:red"></span>
	<tr>
		<td width = 50%>User Id : </td>
		<td width = 50%><input type="text" name="user_id" value="<%=rs.getString("user_id")%>" readonly="readonly"></td>
	</tr>
	<tr>
		<td width = 50%>First Name : </td>
		<td width = 50%><input type="text" name="firstname" value="<%=rs.getString("first_name")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Last Name : </td>
		<td width = 50%><input type="text" name="lastname" value="<%=rs.getString("last_name")%>"></td>
	</tr>
		<%Date d = (Date)rs.getObject("birthdate");
			UserInfo ui = new UserInfo();
			String bdate = ui.FormatDateForJSP(d);
		%>
	<tr>
		<td width = 50%>Birth Date:</td>
		<td width = 50%><input type="text" name="birthdate" value="<%=bdate%>" id = "datepicker" readonly="readonly"></td>
	</tr>
	<tr>
		<td width = 50%>Emailid:</td>
		<td width = 50%><input type="text" name="emailid" value="<%=rs.getString("email")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Phone No:</td>
		<td width = 50%><input type="text" name="phoneno" value="<%=rs.getLong("phone")%>"></td>
	</tr>
		<% CreateUserDAO cudao = new CreateUserDAO();
			ResultSet states = cudao.retriveStates();%>
	<tr>
		<td width = 50%>State : </td>
		<td width = 50%><select name = "state">
				<%while(states.next()) { 
					if(states.getString("state_name").equals(rs.getString("state_name"))){%>
					<option value = "<%=states.getString("state_id") %>" selected="selected"><%=states.getString("state_name") %></option>
					<%}
					else {%>
					<option value = "<%=states.getString("state_id") %>"><%=states.getString("state_name") %></option>
					<%} %>				
				<%} %>
			</select></td>
	</tr>
	<tr>
		<td width = 50%>Password:</td>
		<td width = 50%><input type="text" name="password" value="<%=rs.getString("password")%>"></td>
	</tr>
	<tr>
		<td width = 50%>Billing Address:</td>
		<td width = 50%><input type="text" name="billingaddress" value="<%=rs.getString("billing_address")%>"></td>
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