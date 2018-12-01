
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
				<a href="partialAdmin.jsp"><img src="images/logo.jpg" alt="Logo" /> </a>
			</div>
			
	</div>
</div>