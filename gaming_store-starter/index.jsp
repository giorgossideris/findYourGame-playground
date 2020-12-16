<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>
<%@ page errorPage="app_error.jsp" %>


<%
boolean isUserRegistered = false;
User auth_user = null;
if (session.getAttribute("userObj") != null) {
	auth_user = (User)session.getAttribute("userObj");
	isUserRegistered = true;
}


CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categories = categoryDAO.getCategories();
GameDAO gameDAO = new GameDAO();

DurationDAO durationdao = new DurationDAO();
List<Duration> durations = durationdao.getDurations();

FavoriteDAO favoriteDAO = new FavoriteDAO();
UserDAO userDAO = new UserDAO();
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
						<%@ include file = "navMenu.jsp" %>
						<br>
						<br>

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
						<li><i class="fa-li fa fa-clock fa-xs"></i>Duration: <%=durationdao.getDurationByID(game.getDuration_id()).getDuration_name()%></li>
					</ul>
				</div>
				<div class="game-rating">
					<section class="ac-footer">
						<div class="person_who_made_a_comment_color">
							<p class="heart">Add to favorite </p>
						</div>
						<div class="heart-icon"  
							data-is-favorite=<%= isUserRegistered && favoriteDAO.isGameFavorite(game.getGame_id(), auth_user.getId()) ? "true" : "false"%>
							data-game-id = "<%=game.getGame_id()%>"
							data-user-id = "<%= isUserRegistered ? auth_user.getId() : "null"%>"
							<% if (isUserRegistered && favoriteDAO.isGameFavorite(game.getGame_id(), auth_user.getId())){%>
								style='background-image: url("./images/heart.svg");'
							<% } %>
							>
						</div>
							
					</section>	
					<div class="stars">
						<%
						int fullStars = (int) game.getRating_value();
						int emptyStars = 5 - fullStars - 1; //-1 because we will see later what the last star be
						int halfStars = 0;
						double modulus = game.getRating_value()%1; //for the decimal part
						if (modulus < 0.25){
							emptyStars += 1;
						}else if (modulus < 0.75){
							halfStars += 1;
						}else {
							fullStars += 1;
						}
						for (int i=0; i < fullStars; i++){
						%>
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#c59b08" class="bi bi-star-fill" viewBox="0 0 16 16">
							<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
						</svg>
						<%
						}
						for (int i = 0; i < halfStars; i++){
						%>
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#c59b08" class="bi bi-star-half" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M5.354 5.119L7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.55.55 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.519.519 0 0 1-.146.05c-.341.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.171-.403.59.59 0 0 1 .084-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027c.08 0 .16.018.232.056l3.686 1.894-.694-3.957a.564.564 0 0 1 .163-.505l2.906-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.002 2.223 8 2.226v9.8z"/>
						</svg>
						<%
						}
						for (int i = 0; i < emptyStars; i++){
						%>
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#c59b08" class="bi bi-star" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
						</svg>
						<%
						}
						%>

						
			
						
					</div>
					
				</div>
			<%
				CommentDAO commentDAO = new CommentDAO();
				List<Comment> gameComments = commentDAO.getTwoCommentsOfGame(game.getGame_id());%>
					
<%
				if (gameComments.size() == 2){
			%>
				<div class=game-comments>
					<ul class="rslides callbacks callbacks1 sliding-comments">
					<%for (Comment comment : gameComments){ %>
						<li>
							<div class="banner_text">

								<h4><%=comment.getComment_text()%></h4>
								<div class="person_who_made_a_comment_color">	
									<p>by <%=userDAO.searchUserByID(comment.getCommening_user_id()).getUsername()%></p>
								</div>
							</div>

						</li>
					<% } %>
					</ul>
					<div class="clearfix"> </div>
	
				</div>
			<% } %>
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
<%
	GameDAO gameDA = new GameDAO();
	List <Game> MostRatedGames = gameDA.getMostFavorite();
	
%>

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
											<img src="<%=MostRatedGames.get(2).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="<%=MostRatedGames.get(0).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="<%=MostRatedGames.get(1).getPhoto_path()%>" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
										<h5>	
										</h5>
										<%	CommentDAO commentdao = new CommentDAO();
											List<Comment> game_1_comment = commentdao.getOneCommentOfGame(MostRatedGames.get(0).getGame_id());
										%>													
										<h5><%=MostRatedGames.get(0).getGamename()%><h5>
										<h6><%= 	game_1_comment.get(0).getComment_text()%></h6>
										<h6>Rating: <%=MostRatedGames.get(0).getRating_value()%></h6>
									</div>
								</li>
								<li>
									<div class="testimonial-img-grid">
										<div class="testimonial-img t-img1">
											<img src="<%=MostRatedGames.get(2).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="<%=MostRatedGames.get(1).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="<%=MostRatedGames.get(0).getPhoto_path()%>" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
									<%	List<Comment> game_2_comment = commentdao.getOneCommentOfGame(MostRatedGames.get(1).getGame_id());%>													
											<h5><%=MostRatedGames.get(1).getGamename()%><h5>
											<h6><%= 	game_2_comment.get(0).getComment_text()%></h6>
											<h6>Rating: <%=MostRatedGames.get(1).getRating_value()%></h6>


									
									</div>
								</li>
								<li>
									<div class="testimonial-img-grid">
										<div class="testimonial-img t-img1">
											<img src="<%=MostRatedGames.get(1).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img">
											<img src="<%=MostRatedGames.get(2).getPhoto_path()%>" alt="" />
										</div>
										<div class="testimonial-img t-img2">
											<img src="<%=MostRatedGames.get(0).getPhoto_path()%>" alt="" />
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="testimonial-img-info">
										<%	List<Comment> game_3_comment = commentdao.getOneCommentOfGame(MostRatedGames.get(2).getGame_id());%>													
											<h5><%=MostRatedGames.get(2).getGamename()%><h5>
											<h6><%= 	game_3_comment.get(0).getComment_text()%></h6>
											<h6>Rating: <%=MostRatedGames.get(2).getRating_value()%></h6>

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
					<p>A great team from a small greek suburb that seeks glory and honor.</p>
				</div>
				<div class="col-md-4 amet-sed amet-medium">
					<div class="footer-title">
						<h3>Subscribe</h3>
					</div> 
					<div class="support">
						<form action="email.jsp" method="post">
							<input type="email" name="email" placeholder="Enter email...." required="" class="footer-email"> 
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
							<li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
							<li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
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
			<p class="footer-class">Β© 2020 Gaming App . All Rights Reserved | Design by  <a href="index.html" target="_blank"></a>FindYourGame </a> </p>
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
	<!-- script for clicking heart -->
	<script src="js/favorite.js"></script>
	<!-- end of script for clicking heart -->
</body>	
</html>