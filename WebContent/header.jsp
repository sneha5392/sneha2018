<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<%@page import="com.java.dao.CartDao"%>
<%@page import="com.java.userUtil.*"%>
<%@page import="java.sql.*,java.io.*,com.java.*" %>
<%ServletContext context = getServletContext(); %>
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
				} 
				else if (result.role == "P") {
					newURL=location.substring(0,location.lastIndexOf("/") + 1)+"partialAdmin.jsp";
					window.location.href=newURL;
				}else {
					document.getElementById("errBox").innerHTML="<label>Invalid Email or Password !!</label>";
				}
			}
		});
		return false;
	}
</script>
<div class="top_bg">
	<div class="container">
		<div class="header_top">
			<div class="top_left">
				<h2>Be Smart Shop Smart</h2>
			</div>
			<div class="top_right">
				<ul>
					<li><a href="Contactus.jsp">Contact</a>
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
											onclick="return validateEmail();"> 
									</fieldset>
									<span><a href="#">Forgot your password?</a> </span>
								</form>
							</div>
						</div>
					</li>
					
					<!-- if logged in -->
					<%}else{ %>
					<li><a href="MyProfileServlet?user_id=<%=session.getAttribute("user_id")%>">Hello <%=session.getAttribute("username")%></a></li>
					<b>|</b>
					<li><a href="LoginServlet">Logout</a></li>
					<%} %>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- header -->
<div class="header_bg">
	<div class="container">
		<div class="header">
			<div class="logo">
				<a href="index.jsp"><img src="images/logo.jpg" alt="Logo" style="height: 50px;"/> </a>
			</div>
			<!-- start header_right -->
			<div class="header_right">
			 <%if(session.getAttribute("username")==null){ %>
				<div class="create_btn">
					<a class="arrow" href="RegisterCustomer.jsp">Register<img
						src="images/right_arrow.png" alt="" /> </a>
				</div>
			<%} %>
				<%if(session.getAttribute("username")!=null){ %>
				<ul class="icon1 sub-icon1 profile_img">
					<li><a class="active-icon c2" href="buy_product.jsp"> </a>
						<ul class="sub-icon1 list">
						<%
							CartDao cd = new CartDao();
							HttpSession hs = request.getSession();
							String user_id = (String)hs.getAttribute("user_id");
							int cart_idh = cd.getCartId(user_id);
							String query = "select count(usercart_id) as count from usercart_details where cart_id ="+cart_idh+" group by cart_id";
							Connection con = DbUtil.getConnection();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							int count = 0;
							while(rs.next()){
								count = rs.getInt("count");
							}
							if(count>0){
						%>
								<li><h3><%=count%> items in shopping</h3></li>
								<li><p>Please click <a href=""> here </a> to view them</p></li>
							<%}else{ %>
								<li><h3>shopping cart empty</h3> <a href=""></a></li>
								<!-- <li><p>Please Login To View Items</p></li> -->
							<%}%>
						</ul>
					</li>
				</ul>
				<%} %>
				
				<div class="search">
					<form>
						<input type="text" value="" placeholder="search..."> <input
							type="submit" value="">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- start header menu -->
			<%
				/* ConnectionClass con = new ConnectionClass();
				Connection connection = con.getConnection();
				Statement stmt = connection.createStatement();
				String query = "select * from super_category";
				ResultSet rs = stmt.executeQuery(query); */
			%>
			<ul class="megamenu skyblue">
				<li><a class="color1" href="searchmenu.jsp?scat_id=1">Electronics</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											Connection connection = DbUtil.getConnection();
											Statement stmt = connection.createStatement();
											String query1 = "select category_id,category_name from category_details where super_category_id=1";
											ResultSet rs1 = stmt.executeQuery(query1);
											while (rs1.next()) {
										%>
										<li><a href="searchmenu.jsp?cat_id=<%= rs1.getString("category_id") %>"><%=rs1.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li class="grid"><a class="color2" href="searchmenu.jsp?scat_id=2">Men</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query2 = "select category_id,category_name from category_details where super_category_id=2";
											ResultSet rs2 = stmt.executeQuery(query2);
											while (rs2.next()) {
										%>
										<li><a href="searchmenu.jsp?cat_id=<%= rs2.getString("category_id") %>"><%=rs2.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color3" href="searchmenu.jsp?scat_id=3">Women</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query3 = "select category_id,category_name from category_details where super_category_id=3";
											ResultSet rs3 = stmt.executeQuery(query3);
											while (rs3.next()) {
										%>
										<li><a href="searchmenu.jsp?cat_id=<%= rs3.getString("category_id") %>"><%=rs3.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color4" href="searchmenu.jsp?scat_id=4">Food</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query4 = "select category_id,category_name from category_details where super_category_id=4";
											ResultSet rs4 = stmt.executeQuery(query4);
											while (rs4.next()) {
										%>
										<li><a href="searchmenu.jsp?cat_id=<%= rs4.getString("category_id") %>"><%=rs4.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color5" href="searchmenu.jsp?scat_id=5">Beverages</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query5 = "select category_id,category_name from category_details where super_category_id=5";
											ResultSet rs5 = stmt.executeQuery(query5);
											while (rs5.next()) {
										%>
										<li><a href="searchmenu.jsp?cat_id=<%= rs5.getString("category_id") %>"><%=rs5.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</div>