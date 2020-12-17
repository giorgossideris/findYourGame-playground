<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
	
<!DOCTYPE html>
<html lang="en">
<head>

	<title>Error page</title>
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

		<!-- Fixed navbar -->
        <nav class="navbar navbar-default">
            <!-- Collect the nav links, forms, and other content for toggling -->					
            <div class=" nav-wil">
                <nav>
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home <i class="fa fa-home"></i></a></li>
                    </ul>
                </nav>
            </div>
        <!-- 	 /.navbar-collapse -->
        </nav>
		<div class="container" role="main">


<% if(exception != null) { %>
			<!-- Page Title -->
			<div class="page-header">
				<h1>Σφάλμα</h1>
			</div>		

			<div class="alert alert-danger" role="alert">
				<p>
					<b>Message: </b> <%= exception.getMessage() %>
				</p>
				<p>
					<b>Class: </b> <%= exception.getClass() %>
				</p>
			</div>
<% } %>			
		</div>
		<!-- /container -->

	<!-- copyright -->
	<div class="copyright" style="margin-bottom: 25em;">
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