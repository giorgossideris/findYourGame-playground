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
<html lang="en" data-user-id = "<%= isUserRegistered ? auth_user.getId() : "null"%>">
<head>
	<title>Home Page</title>
	<%@ include file = "header.jsp" %>
	<!-- custom css -->
	<link rel="stylesheet" href="css/custom_style.css" type="text/css" media="all">	
	<!-- //custom css -->

</head>
<body>
	<!-- banner -->
	<div class="banner1">
		<div class="agileinfo-dot">
			<a class="logo" title="Home" href="<%=request.getContextPath() %>/FindYourGame/index.jsp">
				<img src="<%=request.getContextPath() %>/FindYourGame/images/logo.png">
			</a>
			<div class="agileits-logo">
				<h1><a href="index.jsp">Find  <span>Your <a href="index.jsp">Game</span></a></h1>
			</div>
			<div class="header-top">
				<div class="container">
					<div class="header-top-info">
						<%@ include file = "navMenu.jsp" %>
						<br>
						<hr id="nav-filter-hr">
						<br>
						<form id="filter-form" action="search_Controller.jsp" method="GET">
							<div id="whole-form" class=" example index_searchbar basic-whole-form"  >
								<input class="basic-search-input" type="text" placeholder="Search Your Game.." name="searchbar"> 
							</div>


							<br><br>
								
							<div class = "filter-area">
								<div  class="form-group container filter-form">
									<div class="row filters-row">
										
										<div class="filter col-sm-6">
											<label   class="control-label filter-description">Players:</label>
											<input   type="text" name="players" class="form-control filter-input rounded-corners" placeholder="PLAYERS">
										</div>
										
										<div class="filter col-sm-6">
											<label  class="control-label filter-description">  Age:</label>
											<input  type="text" name="age" class="form-control filter-input rounded-corners" placeholder="AGE">
										</div>
									</div>
									
									<div class="row filters-row">
										<div class="filter col-sm-6">
											<label   class="control-label filter-description">Category:</label>

											<select class="form-control filter-input rounded-corners" name="category" id="duration">
												
												<option class="correct-font" value="-1">Category</option>
												<%	for ( Category cat: categories) { %>
													<option value="<%=cat.getCategory_id()%>"><%=cat.getCategory_name()%></option>
												<%}%>
											</select>
										</div>
										
										<div class="filter col-sm-6">
											<label for="duration" class="control-label filter-description">Duration:</label>
											<select class="form-control filter-input rounded-corners" name="duration" id="duration">
												<option class="correct-font" value="-1">Duration</option>
												<%	for ( Duration dur: durations ) { %>
													<option value="<%=dur.getDuration_id()%>"><%=(dur.getDuration_name())%></option>
												<%}%>

											</select>
										</div>
										
									</div>					
								</div>
							</div>
							<button class="basic-search-button" type="submit">Search <i class="fa fa-search"></i></button>
						</form>
					<%
					if (request.getAttribute("message")!=null){
					%>
					<div class="alert alert-danger error-message" role="alert">  
						<%=(String)request.getAttribute("message")%>
					</div>
					<% } %>
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
int counter=1;
for (Game game : topRatedGames){
%>
			<div class="game-row">
				<p id="counter"><%=counter++%>.</p>
				<div class="game-layout">	
					<img class="game-photo" src="<%=game.getPhoto_path()%>" alt="Photo of the game">
					<a class="game-name" href="game-view.jsp?game_id=<%=game.getGame_id()%>">
							<h4 id="title-font-size"><%=game.getGamename()%></h4>
					</a>    
	
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
										<p>by <%=userDAO.searchUserByID(comment.getCommenting_user_id()).getUsername()%></p>
									</div>
								</div>
	
							</li>
						<% } %>
						</ul>
						<div class="clearfix"> </div>
		
					</div>
				<% } %>
				</div>
			</div>
			<br>
<% } %>			

		</div>
	</div>
	<div class="br-back"><br></div>

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
										<a class="game-name" href="game-view.jsp?game_id=<%=MostRatedGames.get(0).getGame_id()%>">
											<h5><%=MostRatedGames.get(0).getGamename()%><h5>
										</a> 
										<h6><%= game_1_comment.get(0).getComment_text()%></h6>
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
											<a class="game-name" href="game-view.jsp?game_id=<%=MostRatedGames.get(1).getGame_id()%>">
												<h5><%=MostRatedGames.get(1).getGamename()%><h5>
											</a> 
											<h6><%= game_2_comment.get(0).getComment_text()%></h6>
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
											<a class="game-name" href="game-view.jsp?game_id=<%=MostRatedGames.get(2).getGame_id()%>">
												<h5><%=MostRatedGames.get(2).getGamename()%><h5>
											</a> 													
											<h6><%= game_3_comment.get(0).getComment_text()%></h6>
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

	<%@ include file = "footer.jsp" %>

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