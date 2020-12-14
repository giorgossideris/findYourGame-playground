<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>



<%
CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categories = categoryDAO.getCategories();
GameDAO gameDAO = new GameDAO();

DurationDAO durationdao = new DurationDAO();
List<Duration> durations = durationdao.getDurations();

%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Gaming Store a Games Category Bootstrap responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- portfolio -->	
<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="all">
<!-- //portfolio -->
<!-- custom css -->
<link rel="stylesheet" href="css/custom_style.css" type="text/css" media="all">	
<!-- //custom css -->
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Turret+Road:wght@200;500&display=swap" rel="stylesheet"> 
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
</head>
<body>
	<!-- banner -->
	<div class="banner1">
		<div class="agileinfo-dot">
			<div class="logo"> <img src="images/logo.png"></div>
			<div class="agileits-logo">
				<h1><a href="index.html">Find  <span>Your <a href="index.html">Game</span></a></h1>
			</div>
			<div class="header-top">
				<div class="container">
					<div class="header-top-info">
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
										<li class="active">
											<a href="index.html">
												Home 
												<i class="fa fa-home"></i>
											</a>
										</li>
										<li class="inactive">
											<a href="about_us.html">
												About us <i class="fa fa-group"></i>
											
											</a>
										</li>
											<li id="color_of_nav_button_index" >
												<a href="login.html">
													Sign in 
													<i class="fas fa-sign-in-alt"></i> 
												</a>
											</li>
										
											<li id="color_of_nav_button_index">
												<a href="signup.html">
													Register 
													<i class="fas fa-user-plus"></i>
												</a>
											</li>
									
									</ul>
								</nav>
							</div>
							<br>
							<br>
					

		
						<!-- 	 /.navbar-collapse -->
						</nav>


						<form action="index_Controller.jsp" method="GET">
							<div id="whole-form" class=" example index_searchbar"  >
								<input class="search-input" type="text" placeholder="Search Your Game.." name="searchbar">
								<button class="search-button" type="submit"><i class="fa fa-search"></i></button> 
							</div>


							<br><br>
							
								
							<div class = "filter-area">
								<div  class="form-group container filter-form">
									<div class="row filters-row">
										
										<div class="filter col-sm-6">
											<label   class="control-label filter-description">Players:</label>
											<input   type="text" name="players" class="form-control filter-input rounded-corners" placeholder="3">
										</div>
										
										<div class="filter col-sm-6">
											<label  class="control-label filter-description">  Age:</label>
											<input  type="text" name="age" class="form-control filter-input rounded-corners" placeholder="12">
										</div>
									</div>
									
									<div class="row filters-row">
										<div class="filter col-sm-6">
											<label   class="control-label filter-description">Category:</label>

											<select class="form-control filter-input rounded-corners" name="category" id="duration">
												
												<option class="correct-font" value="-1">Choose Category</option>
												<%	for ( Category cat: categories) { %>
													<option value="<%=cat.getCategory_id()%>"><%=cat.getCategory_name()%></option>
												<%}%>
											</select>
										</div>
										
										<div class="filter col-sm-6">
											<label for="duration" class="control-label filter-description">Duration:</label>
											<select class="form-control filter-input rounded-corners" name="duration" id="duration">
												<option class="correct-font" value="-1">Choose Duration</option>
												<%	for ( Duration dur: durations ) { %>
													<option value="<%=dur.getDuration_id()%>"><%=(dur.getDuration_name())%></option>
												<%}%>

											</select>
										</div>
										
									</div>					
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
<!--Search bar-->
		
<!--Search bar-->


			
			</div>
		</div>
		
	</div>
<div class="br-back"><br></div>

<div class="hot-games-back"> 
		
		<br>
		<br>
		<div class="agileits-title" id="gallery"> 
			<h3>Top Rated Games</h3> 
			<br>
<% 
List<Game> topRatedGames = gameDAO.getTopRatedGames();
for (Game game : topRatedGames){
%>
			<div class="game-layout">
						
				<img class="game-photo" src="<%=game.getPhoto_path()%>" alt="Photo of the game">

				<h4 class="game-name"><%=game.getGamename()%></h4> 

				<div class="game-info">
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-user-friends fa-xs"></i>Players: <%=game.getMin_players()%>-<%=game.getMax_players()%></li>
						<li><i class="fa-li fa fa-child fa-xs"></i>Age: <%=game.getStart_age()%>-<%=game.getEnd_age()%></li>
						<li><i class="fa-li fa fa-quote-right fa-xs"></i>Category: <%=categoryDAO.getCategoryByID(game.getCategory_id()).getCategory_name()%></li>
						<li><i class="fa-li fa fa-clock fa-xs"></i>Duration: <%=game.getDuration()%></li>
					</ul>
				</div>
				<div class="game-rating">
					<section class="ac-footer">
						<div class="person_who_made_a_comment_color">
							<p class="heart">Add to favorite </p>
						</div>
							<div class="ac-footer-container ac-footer-brand">
								<span class="ac-icon ac-icon-love-dark"></span> 
							</div>
							
					</section>	
					<div class="stars">

						<span class="fa fa-star checked" ></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						
					</div>
					
				</div>
				<div class=game-comments>
					<ul class="rslides callbacks callbacks1 sliding-comments">
						<li>
							<div class="banner_text">

								<h4>An awesome game for kids and adults!</h4>
								<div class="person_who_made_a_comment_color">	
									<p>by Deathwariorr</p>
								</div>
							</div>

						</li>
						<li>
							<div class="banner_text">

								<h4>I can't get enough of this game!</h4>
								<div class="person_who_made_a_comment_color">
									<p>by nickiller66</p>
								</div>
							</div>
						</li>
					</ul>
					<div class="clearfix"> </div>
	
				</div>
			</div>
			<br>
<% } %>			

																						<!-- HOT GAME NUMBER 1-->
			<!-- <div class="game-layout">
				
				<img class="game-photo" src="images/ts2.jpg" alt="Photo of the game">

				<h4 class="game-name">Monopoly: Cheaters Edition </h4> 

				<div class="game-info">
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-user-friends fa-xs"></i>Players: 2-8</li>
						<li><i class="fa-li fa fa-child fa-xs"></i>Age: 3+</li>
						<li><i class="fa-li fa fa-quote-right fa-xs"></i>Category: Family</li>
						<li><i class="fa-li fa fa-clock fa-xs"></i>Duration: 45'+</li>
					</ul>
				</div>
				<div class="game-rating">
					<section class="ac-footer">
						<div class="person_who_made_a_comment_color">
							<p class="heart">Add to favorite </p>
						</div>
							<div class="ac-footer-container ac-footer-brand">
								<span class="ac-icon ac-icon-love-dark"></span> 
							</div>
							
					</section>	
					<div class="stars">
						<span class="fa fa-star checked" ></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</div>
				</div>
				<div class=game-comments>
					<ul class="rslides callbacks callbacks1" id="slider4">
						<li>
							<div class="banner_text">

								<h4>An awesome game for kids and adults!</h4>
								<div class="person_who_made_a_comment_color">	
									<p>by Deathwariorr</p>
								</div>
							</div>

						</li>
						<li>
							<div class="banner_text">

								<h4>I can't get enough of this game!</h4>
								<div class="person_who_made_a_comment_color">
									<p>by nickiller66</p>
								</div>
							</div>
						</li>
					</ul>
					<div class="clearfix"> </div>
					<script src="js/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function () {
							// Slideshow 4
							$("#slider4").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 50,
							namespace: "callbacks",
							before: function () {
								$('.events').append("<li>before event fired.</li>");
							},
							after: function () {
								$('.events').append("<li>after event fired.</li>");
							}
							});
					
						});
					</script>
				</div>
			</div>
			<br>	-->																					
													<!-- HOT GAME NUMBER 2-->
			<!-- <div class="game-layout">
				
				<img class="game-photo" src="images/ts1.jpg" alt="Photo of the game">

				<h4 class="game-name">Risk </h4> 

				<div class="game-info">
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-user-friends fa-xs"></i>Players: 2-6</li>
						<li><i class="fa-li fa fa-child fa-xs"></i>Age: 10+</li>
						<li><i class="fa-li fa fa-quote-right fa-xs"></i>Category: Strategy</li>
						<li><i class="fa-li fa fa-clock fa-xs"></i>Duration: 60'+</li>
					</ul>
				</div>
				<div class="game-rating">
					<section class="ac-footer">
						<div class="person_who_made_a_comment_color">
							<p class="heart">Add to favorite </p>
						</div>
							<div class="ac-footer-container ac-footer-brand">
								<span class="ac-icon ac-icon-love-dark"></span> 
							</div>
							
					</section>	
					<div class="stars">
						<span class="fa fa-star checked" ></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</div>
				</div>
				<div class=game-comments>
					<ul class="rslides callbacks callbacks1" id="slider5">
						<li>
							<div class="banner_text">

								<h4>Got it for my birthday, GREAT!</h4>
								<div class="person_who_made_a_comment_color">	
									<p>by KatKat2</p>
								</div>
							</div>

						</li>
						<li>
							<div class="banner_text">

								<h4>I love strategic games, this is the one</h4>
								<div class="person_who_made_a_comment_color">
									<p>by roarroar33</p>
								</div>
							</div>
						</li>
					</ul>
					<div class="clearfix"> </div>
					<script src="js/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function () {
							// Slideshow 4
							$("#slider5").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 50,
							namespace: "callbacks",
							before: function () {
								$('.events').append("<li>before event fired.</li>");
							},
							after: function () {
								$('.events').append("<li>after event fired.</li>");
							}
							});
					
						});
					</script>
				</div>	
			</div>
			<br> -->
																									<!-- HOT GAME NUMBER 3-->
			<!-- <div class="game-layout">
				
				<img class="game-photo" src="images/scotland_yard.jpeg" alt="Photo of the game">

				<h4 class="game-name">Scotland Yard </h4> 

				<div class="game-info">
					<ul class="fa-ul">
						<li><i class="fa-li fa fa-user-friends fa-xs"></i>Players: 3-6</li>
						<li><i class="fa-li fa fa-child fa-xs"></i>Age: 10+</li>
						<li><i class="fa-li fa fa-quote-right fa-xs"></i>Category: Bluffing</li>
						<li><i class="fa-li fa fa-clock fa-xs"></i>Duration: 45'+</li>
					</ul>
				</div>
				<div class="game-rating">
					<section class="ac-footer">
						<div class="person_who_made_a_comment_color">
							<p class="heart">Add to favorite </p>
						</div>
							<div class="ac-footer-container ac-footer-brand">
								<span class="ac-icon ac-icon-love-dark"></span> 
							</div>
							
					</section>	
					<div class="stars">
						<span class="fa fa-star checked" ></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</div>
				</div>
				<div class=game-comments>
					<ul class="rslides callbacks callbacks1" id="slider6">
						<li>
							<div class="banner_text">

								<h4>None could call my bluffs &#128521  </h4>
								<div class="person_who_made_a_comment_color">	
									<p>by WhoAmI</p>
								</div>
							</div>

						</li>
						<li>
							<div class="banner_text">

								<h4>TRASH</h4>
								<div class="person_who_made_a_comment_color">
									<p>by MrBin</p>
								</div>
							</div>
						</li>
					</ul>
					<script src="js/responsiveslides.min.js"></script>
					<script>
						// You can also use "$(window).load(function() {"
						$(function () {
							// Slideshow 4
							$("#slider6").responsiveSlides({
							auto: true,
							pager:true,
							nav:true,
							speed: 50,
							namespace: "callbacks",
							before: function () {
								$('.events').append("<li>before event fired.</li>");
							},
							after: function () {
								$('.events').append("<li>after event fired.</li>");
							}
							});
					
						});
					</script>
				</div>
			</div>
			<br> -->

		</div>
	</div>
	<div class="br-back"><br></div>
	<!-- //portfolio -->
	<!-- modal -->
	<div class="modal about-modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					<h4 class="modal-title">Deathwariorr's <span>Comment</span></h4>
				</div> 
				<div class="modal-body">
					<div class="agileits-w3layouts-info">
						
						<p>An awesome game for kids and adults. I've been palying this game for over 3 years and can't get enough of it. Although is the most expensive game i've ever bought, it's worth every penny. </p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //modal -->
	<!-- testimonial -->
	<div id="blog" class="jarallax testimonial1" id="testimonial">
		<div class="testimonial-dot">
			<div class="container">
				<div class="agileits-title testimonial-heading"> 
					<h3>Our Suggestions</h3> 
				</div>
				<div class="w3-agile-testimonial">
					
						<div class="callbacks_container">
							<ul class="rslides callbacks callbacks1" id="slider3">
								<li>
									<div class="testimonial-img-grid">
										<div class="testimonial-img t-img1">
											<img src="images/ts1.jpg" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="images/ts2.jpg" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="images/ts3.jpg" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
										<p>Check Out the New Monopoly "Cheaters Edition" and leave aside your FAIR-side &#128521;</p>
										<h5>By Hasbro Gaming</h5>
										<h6>Rating 4,87</h6>
									</div>
								</li>
								<li>
									<div class="testimonial-img-grid">
										<div class="testimonial-img t-img1">
											<img src="images/ts2.jpg" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="images/ts3.jpg" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="images/ts1.jpg" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
										<p>Do not miss Trivial Pursuit Disney Edition</p>
										<h5>By Hasbro Gaming</h5>
										<h6>Rating 3,82</h6>
									</div>
								</li>
								<li>
									<div class="testimonial-img-grid">
										<div class="testimonial-img t-img1">
											<img src="images/ts3.jpg" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="images/ts1.jpg" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="images/ts2.jpg" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
										<p>Searching for a Strategic game? Risk is what you are looking for!</p>
										<h5>By Hasbro Gaming</h5>
										<h6>Rating 4,34</h6>
									</div>
								</li>
							</ul>
						</div>
						<div class="clearfix"> </div>
						<script>
									// You can also use "$(window).load(function() {"
									$(function () {
									  // Slideshow 4
									  $("#slider3").responsiveSlides({
										auto: true,
										pager:false,
										nav:false,
										speed: 400,
										namespace: "callbacks",
										before: function () {
										  $('.events').append("<li>before event fired.</li>");
										},
										after: function () {
										  $('.events').append("<li>after event fired.</li>");
										}
									  });
								
									});
						</script>
						<!--banner Slider starts Here-->
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="br-back"><br></div>
	<!-- //testimonial -->
	<!-- team -->


 
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-4 amet-sed"> 
					<div class="footer-title">
						<h3>About Us</h3>
					</div> 
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.</p>
				</div>
				<div class="col-md-4 amet-sed amet-medium">
					<div class="footer-title">
						<h3>Subscribe</h3>
					</div> 
					<div class="support">
						<form action="#" method="post">
							<input type="email" placeholder="Enter email...." required="" class="footer-email"> 
							<input type="submit" value="Subscribe" class="botton">
						</form> 
					</div>
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
			<p class="footer-class">© 2020 Gaming App . All Rights Reserved | Design by  <a href="index.html" target="_blank"></a>FindYourGame </a> </p>
		</div>
	</div>
	<!-- //copyright -->
		<!-- scripts for sliding comments -->
		<script src="js/responsiveslides.min.js"></script>
		<script>
			// You can also use "$(window).load(function() {"
			$(function () {
				// Slideshow 4
				$(".sliding-comments").responsiveSlides({
				auto: true,
				pager:true,
				nav:true,
				speed: 50,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
				});
		
			});
		</script>
	<!-- end of scrips for sliding comments -->
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
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script> 
</body>	
</html>