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
<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
<script src="js/menu_jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>

</head>

<body bgcolor="#E6E6FA">
<!--  header -->
<%@include file="adminheader.jsp"%>
<!--  header -->
<div class="container">
	<div class="main">
<h1 align="Center" >Contact Us</h1>




<div align="center">
   <h2 align="center">Address:</h3>
   Emart, <br>
   Near Cognizant Technology Solutions, <br>
   CDC, <br>
   Hinjewadi Phase 1, <br>
   Pune 444444 <br>
   Maharashtra. <br>
 </div> 
 <div align="center">
   <h2 align="center">Phone No:</h3>
  	Pooja : 7722038009 <br>
  	Neha : 8087790428 <br>
  	Swapnil : 8007230606 <br>
  	Deval : 9428910907 <br> 
  	Krushnakant : 9725975030 <br>
  	Ritesh : 8888642429 <br>
 </div> 
 <div align="center">
   <h2 align="center">Email Id:</h3>
   	krushnakant@admin.com<br>
	deval@admin.com <br>
	swapnil@admin.com <br>
	reitesh@admin.com <br>
	pooja@admin.com <br>
	neha@admin.com <br>
 </div> 
 </div>
</div>
 
<!--  footer --> 
<%@include file="footer.jsp"%>
<!--  footer end-->	

</body>
</html>