
<%@page import="java.sql.*,java.io.*" %>
<%ServletContext context = getServletContext(); %>
<div class="top_bg">
	<div class="container">
		<div class="header_top">
			<!-- <div class="logo">
				<a href="__index.jsp"><img src="images/logo.jpg" alt="Logo" /> </a>
			</div> -->
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
											onclick="return validateEmail();"> <!-- <label for="checkbox"><input
											type="checkbox" id="checkbox"> <i>Remember me</i> </label>-->
									</fieldset>
									<span><a href="#">Forgot your password?</a> </span>
								</form>
							</div>
						</div>
					</li>
					
					<!-- if logged in -->
					<%}else{%>
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
				<a href="admin.jsp"><img src="images/logo.jpg" alt="Logo" /> </a>
			</div>
			<%-- start header_right
			<div class="header_right">
				<div class="create_btn">
					<a class="arrow" href="registration.html">Register<img
						src="images/right_arrow.png" alt="" /> </a>
				</div>
				<ul class="icon1 sub-icon1 profile_img">
					<li><a class="active-icon c2" href="#"> </a>
						<ul class="sub-icon1 list">
							<li><h3>shopping cart empty</h3> <a href=""></a></li>
							<li><p>
									if items in your wishlit are missing, <a href="">login to
										your account</a> to view them
								</p></li>
						</ul>
					</li>
				</ul>
				<ul class="icon1 sub-icon1 profile_img">
					<li><a class="active-icon c1" href="#"> </a>
						<ul class="sub-icon1 list">
							<li><h3>wishlist empty</h3> <a href=""></a></li>
							<li><p>
									if items in your wishlit are missing, <a href="">login to
										your account</a> to view them
								</p></li>
						</ul>
					</li>
				</ul>
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
				<li><a class="color1" href="index.html">Electronics</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											Connection connection = null;
											Class.forName(context.getInitParameter("dbname"));
											connection = DriverManager.getConnection(
													context.getInitParameter("ConUrl"),
													context.getInitParameter("user"),
													context.getInitParameter("password"));
											Statement stmt = connection.createStatement();
											String query1 = "select category_name from category_details where super_category_id=1";
											ResultSet rs1 = stmt.executeQuery(query1);
											while (rs1.next()) {
										%>
										<li><a href=""><%=rs1.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li class="grid"><a class="color2" href="#">Men</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query2 = "select category_name from category_details where super_category_id=2";
											ResultSet rs2 = stmt.executeQuery(query2);
											while (rs2.next()) {
										%>
										<li><a href=""><%=rs2.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color3" href="index.html">Women</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query3 = "select category_name from category_details where super_category_id=3";
											ResultSet rs3 = stmt.executeQuery(query3);
											while (rs3.next()) {
										%>
										<li><a href=""><%=rs3.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color4" href="index.html">Food</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query4 = "select category_name from category_details where super_category_id=4";
											ResultSet rs4 = stmt.executeQuery(query4);
											while (rs4.next()) {
										%>
										<li><a href=""><%=rs4.getString("category_name")%></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li><a class="color5" href="index.html">Beverages</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<%
											String query5 = "select category_name from category_details where super_category_id=5";
											ResultSet rs5 = stmt.executeQuery(query5);
											while (rs5.next()) {
										%>
										<li><a href=""><%=rs5.getString("category_name")%></a>
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
		</div> --%>
	</div>
</div>