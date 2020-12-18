<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*" %>
<%@ page errorPage="app_error.jsp" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
-->
<!DOCTYPE html>
<html lang="en">
<head>

	<title>Log in</title>
	<%@ include file = "header.jsp" %>
	<!-- custom login css -->
	<link rel="stylesheet" href="css/login_style.css" type="text/css" media="all">	
	<!-- //custom login css -->
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script> 

</head>
<body>
	<!-- banner -->
	<div class="banner" id="login-background">
		<div class="agileinfo-dot">
			<div class="logo"> <img src="images/logo.png"></div>
			<div class="header-top">
				<div class="container">
					<div class="header-top-info">
						<%@ include file = "navMenu.jsp" %>
                        <div class="flexbox">
                            <div class="container login-border box">
								<h1 class="login-title text-white">LOG IN</h1>
                                <form class="form-horizontal login-form" action="<%= request.getContextPath()%>/FindYourGame/loginController.jsp" method="POST">
                                    <div class="form-group login-form-group">
                                        <label class="control-label text-white login-field-description">username</label>
                                        <div class="login-input">
                                            <input type="text" class="form-control rounded-corners" name="username" placeholder="username" required>
                                        </div>
                                    </div>
                                    <div class="form-group login-form-group">
                                        <label class="control-label text-white login-field-description">password</label>
                                        <div class="login-input">
                                            <input type="password" class="form-control rounded-corners" name="password" placeholder="password" required> 
                                        </div>
									</div>
									<% 
								if(request.getAttribute("message") != null) {
%>
									<div class="alert alert-danger message-box" role="alert">
										<%=request.getAttribute("message")%>
									</div>
<%
								}
%>
                                    <div class="form-group login-form-group">
                                        <button type="submit" class="login-button rounded-corners text-white login-button-area">I finished!</button>
									</div>
									<div class="signup-message login-form-group">
										<p>You don't have an account? Sign up <a href="signup.jsp">here</a>.</p>
									</div>
                                </form>
                            </div>  
                        </div>                         
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	<%@ include file = "footer.jsp" %>
	
	<script src="js/jarallax.js"></script>
	<!-- <script src="js/SmoothScroll.min.js"></script> -->
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
	<script src="js/responsiveslides.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- Tabs-JavaScript -->
	<script src="js/jquery.filterizr.js"></script>
		<script src="js/controls.js"></script>
		<script type="text/javascript">
			$(function() {
				$('.filtr-container').filterizr();
			});
		</script>
	<!-- //Tabs-JavaScript -->
	<!-- PopUp-Box-JavaScript -->
		<script src="js/jquery.chocolat.js"></script>
		<script type="text/javascript">
			$(function() {
				$('.filtr-item a').Chocolat();
			});
		</script>
	<!-- //PopUp-Box-JavaScript -->
</body>	
</html>