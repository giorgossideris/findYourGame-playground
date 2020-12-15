<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>
<%@ page errorPage="app_error.jsp" %>

<%

String x = request.getContextPath();
String y = request.getRequestURI();

if (session.getAttribute("userObj") == null) {
	/* Navigation menu for visitors */
%>

<!-- banner -->
<!-- <div class="agileinfo-dot">
	<div class="logo"> <img src="<%=request.getContextPath() %>/FindYourGame/images/logo.png"></div> -->
				
	<!-- <div class="agileits-logo" id="smaller">
	<h1><a href="index.html">Find  <span>Your <a href="index.html">Game</span></a></h1>
	</div> -->
	
	<!-- <div class="header-top">
		<div class="header-top-info"> -->
			<nav class="navbar navbar-default">
    			<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>			
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav>
	    				<ul class="nav navbar-nav">
							<li id="no-dot" class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("index.jsp") ? "active": "" %>" >
								<a href="<%=request.getContextPath() %>/FindYourGame/index.jsp">
									Home 
		    						<i class="fa fa-home"></i>
								</a>
							</li>

							<li class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("about_us.jsp") ? "active": "" %>" >
			    				<a href="about_us.jsp">
									About us 
									<i class="fa fa-group"></i>
									
				    			</a>
							</li> 
										
							<li id="orange" class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("login.jsp") ? "active": "" %>" >
								<a href="<%=request.getContextPath() %>/FindYourGame/login.jsp">
						    		Sign in 
					    			<i class="fas fa-sign-in-alt"></i> 
								</a>
							</li>
										
							<li id="orange" class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("signup.jsp") ? "active": "" %>" >
								<a href="<%=request.getContextPath() %>/FindYourGame/signup.jsp">
									Register 
							    	<i class="fas fa-user-plus"></i>
								</a>
							</li>
									
						</ul>
					</nav>
				</div>
							<!-- /.navbar-collapse -->

	        </nav>
<!-- 
		</div>
						
	</div>
				
</div> -->
<%
} else {
	/* Navigation menu for authenticated users */

%>
<!-- banner -->
<!-- <div class="agileinfo-dot">
	<div class="logo"> <img src="<%=request.getContextPath() %>/FindYourGame/images/logo.png"></div> -->
				
	<!-- <div class="agileits-logo" id="smaller">
	<h1><a href="index.html">Find  <span>Your <a href="index.html">Game</span></a></h1>
	</div> -->
	
	<!-- <div class="header-top">
		<div class="header-top-info"> -->
			<nav class="navbar navbar-default">
    			<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>			
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav>
	    				<ul class="nav navbar-nav">

							<li id="no-dot" class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("index.jsp") ? "active": "" %>" >
								<a href="<%=request.getContextPath() %>/FindYourGame/index.jsp">
									Home 
		    						<i class="fa fa-home"></i>
								</a>
							</li>

							<li id="orange" class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("favorite_page.jsp") ? "active": "" %>" >
								<a href="<%=request.getContextPath() %>/FindYourGame/favorite_page.jsp">
						    		Favorites
					    			<i class="fas fa-heart"></i> 
								</a>
							</li>

							<li class="<%=request.getRequestURI().replace(request.getContextPath() + "/FindYourGame/", "").equals("about_us.jsp") ? "active": "" %>" >
			    				<a href="about_us.jsp">
									About us 
									<i class="fa fa-group"></i>
									
				    			</a>
							</li> 
										
							<li id="orange" >
								<a href="<%=request.getContextPath() %>/FindYourGame/logout.jsp">
									Log out 
							    	<i class="fas fa-sign-out-alt"></i>
								</a>
							</li>
									
						</ul>
					</nav>
				</div>
							<!-- /.navbar-collapse -->

	        </nav>
<!-- 
		</div>
						
	</div>
				
</div> -->
<%
}
%>
