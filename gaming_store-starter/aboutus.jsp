<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Some information about the developpers' team</title>
	<%@ include file = "header.jsp" %>
	<!-- custom login css -->
	<link rel="stylesheet" href="css/login_style.css" type="text/css" media="all">	
	<!-- //custom login css -->
	<link rel="stylesheet" href="css/custom_style.css" type="text/css" media="all">	

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
								if(request.getAttribute("message") != null) {
								%>
									<div class="alert alert-danger message-box" role="alert">
										<%=request.getAttribute("message")%>
									</div>
								<%
								}
								%>
						<div class="team" id="team">
    						<div class="container">
								<div class="agileits-title"> 
									<h3>Amazing Team</h3> 
								</div>
								<div class="agileits-team-grids">
									<div class="col-md-3 agileits-team-grid">
										<div class="team-info">
											<img src="images/t1.jpg" alt="">
											<div class="team-caption"> 
												<h4>Antonopoulos Nikolaos</h4>
												<p>Software Engineer</p>
												<ul>
													<li><a href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a href="#"><i class="fa fa-rss"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-md-3 agileits-team-grid">
										<div class="team-info">
											<img src="images/t2.jpg" alt="">
											<div class="team-caption"> 
												<h4>Psychogiou Artemis-Konstantina</h4>
												<p>Software Engineer</p>
												<ul>
													<li><a href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a href="#"><i class="fa fa-rss"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-md-3 agileits-team-grid">
										<div class="team-info">
											<img src="images/t3.jpg" alt="">
											<div class="team-caption"> 
												<h4>Sideris Georgios</h4>
												<p>Software Engineer</p>
												<ul>
													<li><a href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a href="#"><i class="fa fa-rss"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-md-3 agileits-team-grid">
										<div class="team-info">
											<img src="images/t4.jpg" alt="">
											<div  class="team-caption"> 
												<h4>Stack Overflow</h4>
												<p>THE savior</p>
												<ul>
													<li><a href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a href="#"><i class="fa fa-rss"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="clearfix"> </div>
    							</div>
							</div>
						</div>
						<div class="br-back"><br></div>                                       

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