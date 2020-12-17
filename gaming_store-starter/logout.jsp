<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="app_error.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>Log out</title>
	<meta http-equiv="refresh" content="3;url=<%=request.getContextPath() %>/FindYourGame/index.jsp" />
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
						<%
						session.invalidate();
						
 
								if(request.getAttribute("message") != null) {
%>
									<div class="alert alert-danger message-box" role="alert">
										<%=request.getAttribute("message")%>
									</div>
<%
								}
%>
                        <div class="flexbox">
                            <div class="container login-border box">
                                <h1 class="login-title text-white">LOG OUT</h1>
                                <h2 class="logout-title text-orange">Logged out Succesfully </h2>
                                <h3 class="logout-title text-orange">You are returning to the log in page </h3>
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