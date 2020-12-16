<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8180116.jsp"%>

<%
session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gaming Store a Games Category Bootstrap responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="3;url=<%=request.getContextPath() %>/FindYourGame/index.jsp" />

<meta charset="utf-8">
<meta name="keywords" content="Gaming Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- //font-awesome icons -->
<!-- portfolio -->	
<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="all">
<!-- //portfolio -->
<!-- custom login css -->
<link rel="stylesheet" href="css/login_style.css" type="text/css" media="all">	
<!-- //custom login css -->
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Turret+Road:wght@200;500&display=swap" rel="stylesheet"> 
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script> 

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
</head>
<body>
	<!-- banner -->
	<div class="banner" id="login-background">
		<div class="agileinfo-dot">
			<div class="logo"> <img src="images/logo.png"></div>
			<div class="header-top">
				<div class="container">
					<div class="header-top-info">
						<nav class="navbar navbar-default">
							<!-- Collect the nav links, forms, and other content for toggling -->					
							<div class=" nav-wil">
								<nav>
									<ul class="nav navbar-nav">
										<li><a href="index.html">Home <i class="fa fa-home"></i></a></li>
									</ul>
								</nav>
							</div>
						<!-- 	 /.navbar-collapse -->
						</nav>
<% 
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
	
    

	<!-- //banner -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-4 amet-sed"> 
					<div class="footer-title">
						<h3>About Us</h3>
					</div> 
					<p>We are a team that seeks greatness.</p>
				</div>
			
				<div class="col-md-4 amet-sed ">
					<div class="footer-title">
						<h3>Follow Us</h3>
					</div> 
					<div class="agileinfo-social-grids">
						<ul>
							<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //footer --> 
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<p class="footer-class">© 2020 Gaming Store . All Rights Reserved | FindYourGame© </p>
		</div>
	</div>
	<!-- //copyright -->
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