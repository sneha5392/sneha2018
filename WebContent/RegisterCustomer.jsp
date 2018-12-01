<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "com.java.dao.*,java.sql.*"%>
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
<script type="text/javascript">


function validateFormOnSubmit(theForm) {
var reason = "";

  reason += validateUsername(theForm.fname);
  reason += validateLastname(theForm.lname);
  reason += validateAddress(theForm.address);
  reason += validateState(theForm.checkState);
  reason += validatePhone(theForm.phone);
  reason += validateBirthDate(theForm.birthdate);
  //reason += validateRole(theForm.checkRole);
  reason += validateMail(theForm.mail);
  reason += validatePassword(theForm.Password);
  reason += validateCheckPass(theForm.repass,theForm.pass);
  //alert("hello1");
  
  
  
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
function validateState(fld) {
	var error = "";
	var e = document.getElementById("checkState");
	var strUser = e.options[e.selectedIndex].value;

  //  var strUser1 = e.options[e.selectedIndex].text;
    if(strUser==-1)
    {
    	fld.style.background = 'Yellow';
    	error = "Select State<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}
function validateRole(fld) {
	var error = "";
	var e = document.getElementById("checkRole");
	var strUser = e.options[e.selectedIndex].value;

  //  var strUser1 = e.options[e.selectedIndex].text;
    if(strUser==-1)
    {
    	fld.style.background = 'Yellow';
    	error = "Select role<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}

function validateCheckPass(fld,fld1) {
	var error = "";
	
	if (fld.value == "") {
        error = "Enter re password.<br />";
        fld.style.background = 'Yellow';
    }
	else if(fld.value!=fld1.value)
    {
    	fld.style.background = 'Yellow';
    	error = "Password and Re Password does not match.<br />";
       // alert("Please select a user");    
    }
    else {
        fld.style.background = 'White';
    }
	return error;
}


</script>


<title>User Registration</title>
</head>
<body>
<!-- header -->
	<%@include file="header.jsp"%>


	<!-- content -->
	<div class="container">
		<div class="main">
			<h2 class="title" align=center>User Registration</h2>
			<form name="form" action="RegisterCustomerServlet" method="post" onsubmit="return validateFormOnSubmit(this);" >
				<table align="center" cellpadding="10" cellspacing="50">
					<tr>
						<td colspan="2" style="padding-bottom: 10px;">
							<p class="anyfont">First Name <span style = "color:red;">*</span> :</p>
						</td>
						<td colspan="2">
							<p class="anyfont">Last Name <span style = "color:red;">*</span> :</p>
						</td>
					</tr>

					<tr>
					<span id="errBox1" style="color:red"></span>
						<td colspan="2" style="padding-bottom: 10px;"><input
							type="text" class="textbox" name="fname" id="fname" value="" />
						</td>
						<td colspan="2" style="padding-bottom: 10px;"><input
							type="text" class="textbox" name="lname" id="lname" value="" />
						</td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">Address <span style = "color:red;">*</span> :</p>
						</td>
						<td colspan="3" style="padding-bottom: 10px;"><textarea
								rows="5" cols="34" name="address" id="address"></textarea>
						</td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">State <span style = "color:red;">*</span> :</p>
						</td>
						<td colspan="3"><select name="state" class="othertextbox" id="checkState">
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
						</select></td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">Phone No <span style = "color:red;">*</span> :</p>
						<td colspan="3"><input class="othertextbox" type="text"
							name="phone" id="phone"/>
						</td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">Birth Date <span style = "color:red;">*</span> :</p>
						<td colspan="3"><input type="text" name="birthdate"
							id="datepicker" readonly="readonly">
						</td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">Email Id <span style = "color:red;">*</span> :</p>
						<td colspan="3"><input class="othertextbox" type="text"
							name="mail" value="" id="mail" />
						</td>
					</tr>
					<tr>
					<td>
					<td  colspan="3"><span id="checkEmail" style="color:red"></span></td>
					</tr>
					<tr>
						<td>
							<p class="anyfont">Password <span style = "color:red;">*</span> :</p>
						<td colspan="3"><input class="othertextbox" type="password"
							name="Password" id="pass" />
						</td>
					</tr>

					<tr>
						<td>
							<p class="anyfont">Retype Password <span style = "color:red;">*</span> :</p>
						<td colspan="3"><input class="othertextbox" type="password"
							name="retypePassword" id="repass" /></td>
					</tr>



					<tr>
						<td colspan="4">
						<input class="button1" type="submit"	value="SUBMIT" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>