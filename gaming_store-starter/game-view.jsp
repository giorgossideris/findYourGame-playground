<%@  page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@  page errorPage="app_error.jsp" %>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>
<%   

int game_id = Integer.parseInt(request.getParameter("game_id"));
GameDAO gamedao = new GameDAO();
DurationDAO durationdao = new DurationDAO();
CategoryDAO categorydao = new CategoryDAO();
CommentDAO commentdao = new CommentDAO();
UserDAO userdao = new UserDAO();
Game game = gamedao.searchGameByID(game_id);

boolean isUserRegistered = false;
User auth_user = null;
if (session.getAttribute("userObj") != null) {
	auth_user = (User)session.getAttribute("userObj");
	isUserRegistered = true;
}
%>


<!DOCTYPE html>
<html lang="en" data-user-id = "<%= isUserRegistered ? auth_user.getId() : "null"%>" 
				data-username = "<%= isUserRegistered ? userdao.searchUserByID(auth_user.getId()).getUsername() : "null"%>"
				data-game-id = "<%=game_id%>">
<head>

	<title>Game details</title>
	<%@ include file = "header.jsp" %>
	<!-- css -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/FindYourGame/css/game.css" type="text/css" media="all" />
	<!--// css -->
	<link href="<%=request.getContextPath() %>/FindYourGame/css/all.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/FindYourGame/css/custom_style.css" rel="stylesheet"> 
	<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
	<!-- //font -->
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
		<div id="allbody">
			<!-- banner -->
			<div class="agileinfo-dot">
				<div class="logo"> <img src="<%=request.getContextPath() %>/FindYourGame/images/logo.png"></div>
				
				<!-- <div class="agileits-logo" id="smaller">
					<h1><a href="index.html">Find  <span>Your <a href="index.html">Game</span></a></h1>
				</div> -->
	
				<div class="header-top">
					<div class="header-top-info">
						<%@ include file = "navMenu.jsp" %>

					</div>
						
				</div>
				
			</div>

		
			<section class ="game-details">
				<div class="br-back">
					<br>
				</div>
				<div class="section-content">
					<div class="secimage">
						<!-- <a href="#" class="thumbnail"> -->
						<img src="<%=game.getPhoto_path()%>" alt="game.getGamename()">
						<!-- </a> -->
					
					</div>
					<div class="secdetails">

						<div class="game-title">
							<h2><%=game.getGamename()%></h2>						
							<div class="right-buttons">
								<div class="ac-footer">
									<div class="ac-footer-container ac-footer-brand" title="Add to favorite">
										<span class="ac-icon ac-icon-love-dark"></span> 
									</div>
								</div>
								<div class="rating-commenting-button" style="margin-left: 0px;">
										<button class="hover-button" title="Rate it!">
											<a href="#rate" class="scroll">
												<i class="far fa-star"></i>
											</a>
										</button>
								</div>

								<div class="rating-commenting-button">
										<button class="hover-button" title="Leave a comment">
											<a href="#rate" class="scroll">
												<i class="far fa-comment"></i>
											</a>
										</button>
								</div>
							</div>

						</div>

						<div class="rating">
							<span class="rate-num">

								<i class="far fa-star"></i>
								<span class="rating-value"><%=game.getRating_value()%></span>
								<span class="out-of">/5</span>
								
							</span>
						</div>
		
						<div class="rules">

							<ul class="categories">
								<li class="left-up"> <span class="white"><i class="fa fa-quote-right fa-xs"></i> Category:</span> <%=categorydao.getCategoryByID(game.getCategory_id()).getCategory_name()%> </li>
								<li class="right-up"> <span class="white"><i class="fa fa-user-friends fa-xs"></i> Players: </span> <%=game.getMin_players()%>-<%=game.getMax_players()%> </li>  
								<li class="left-down"> <span class="white"><i class="fa fa-child fa-xs"></i> Age:</span> <%=game.getStart_age()%>-<%=game.getEnd_age()%> </li>
								<li class="right-down"> <span class="white"><i class="fa fa-clock fa-xs"></i> Duration:</span> <%=durationdao.getDurationByID(game.getDuration_id()).getDuration_name()%> </li>

							</ul>
							
							
							<div class="game-description">
								<div class="desc-heading">Short Description</div>
								<div class="br-headings">
									<br>
								</div>
		
									<p> <%=game.getGame_short_description() %>
										
										<span id="points">...</span> 
									</p>	
										<div class="desc-heading">Details</div>
										<div class="br-headings">
											<br>
										</div> 
										<span id="moreText" class="game-description">
											    <%=game.getGame_long_description()%>
												
												
										</span>
									<div class="moreButton">									
										<button class="hover-button" onclick="toggleText()" id="textButton">Show details</button>
									</div>
							</div>
						</div>
						<div class="rate-area" id="rate">
							<h2 class="comments-ratings-head">
								<span class="comments-ratings-title"> Rate the game </span>
							</h2>
							<div class="br-headings">
								<br>
							</div>
							<div class="add-rating">
								<%
								int rating = -1, fullStars, emptyStars;
								if(isUserRegistered){
									rating = gamedao.getRatingUserForGame(auth_user.getId(), game_id);
								}
								if (rating != -1){ // it means that the the current user has rated the game
									fullStars = rating;
									emptyStars = 5 - fullStars;
								%>
								<p>Your rating:</p>
								<%
								} else { // it means that the current user is not logged in or they haven't rated the game
									fullStars = 0;
									emptyStars = 5;
								%>
								<p id="add-rating-label">Add your rating:</p>
								<% } %>
								<div id="stars" data-is-rated=<%=rating != -1 ? "true" : "false"%>>
									<%
									for (int i=0; i < fullStars; i++){
									%>
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ecca31" class="bi bi-star-fill" viewBox="0 0 16 16">
											<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
										</svg>
									</div>
									<%
									}
									for (int i = 0; i < emptyStars; i++){
									%>
									<div data-star-id = <%= i + 1%>>
										<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ecca31" class="bi bi-star" viewBox="0 0 16 16">
											<path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
										</svg>
									</div>
									<%
									}
									%>	
								</div>
							</div>
						</div>


						<div class="comment-area" id="com">
							<h2 class="comments-ratings-head">
								<span class="comments-ratings-title">Comments</span>
							</h2>
							<div class="br-headings">
								<br>
							</div>
							<%
							List<Comment> all_comments = commentdao.getAllCommentsOfGame(game.getGame_id());
							for (Comment comment: all_comments) {
							%>
							<div class="comment">
								<div class="user-avatar">
									<img src="<%=request.getContextPath() %>/FindYourGame/images/user.png">
								</div>
								<!-- the comment body -->
								<div class="comment-body">
									<p>				
										<div class="user">
											<%=userdao.searchUserByID(comment.getCommenting_user_id()).getUsername()%>
										</div>
										<%=comment.getComment_text()%>
									</p>
									
								</div>
							</div>
							<% } %>
							<div class="comment-br">
								<br>
							</div>	
							<div class="create-new-comment">
								<!-- current {user} avatar -->
								<div class="user-avatar">
									<img src="<%=request.getContextPath() %>/FindYourGame/images/user.png">
								</div>
								<!-- the input field, not form as everything is handled in the comment.js -->
								<input type="text" name= "comment_text" placeholder="Join the conversation.." id="new-comment">
								<button type="submit" class="hover-button submit" id="comment-button">Submit it!</button>
							</div>

						</div>
						<!-- comment-area end -->
					</div>
					<!-- secdetails end -->
				</div>
				<!-- section-content end -->
			</section>
	
			<%@ include file = "footer.jsp" %>
			
		</div>
		<script src="<%=request.getContextPath() %>/FindYourGame/js/jarallax.js"></script>
		<!-- <script src="js/SmoothScroll.min.js"></script> -->
		<script type="text/javascript">
			/* init Jarallax */
			$('.jarallax').jarallax({
				speed: 0.5,
				imgWidth: 1366,
				imgHeight: 768
			})
		</script>
		<script src="<%=request.getContextPath() %>/FindYourGame/js/responsiveslides.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/FindYourGame/js/move-top.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/FindYourGame/js/easing.js"></script>
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
		<script src="<%=request.getContextPath() %>/FindYourGame/js/jquery.filterizr.js"></script>
			<script src="<%=request.getContextPath() %>/FindYourGame/js/controls.js"></script>
			<script type="text/javascript">
				$(function() {
					$('.filtr-container').filterizr();
				});
			</script>
		<!-- //Tabs-JavaScript -->
		<!-- PopUp-Box-JavaScript -->
			<script src="<%=request.getContextPath() %>/FindYourGame/js/jquery.chocolat.js"></script>
			<script type="text/javascript">
				$(function() {
					$('.filtr-item a').Chocolat();
				});
			</script>
		<!-- //PopUp-Box-JavaScript -->
		</div>
		<!-- script for show-more -->
		<script> 
			function toggleText() { 
	  
				// Get all the elements from the page 
				var points =  
					document.getElementById("points"); 
	  
				var showMoreText = 
					document.getElementById("moreText"); 
	  
				var buttonText = 
					document.getElementById("textButton"); 
	  
				// If the display property of the dots  
				// to be displayed is already set to  
				// 'none' (that is hidden) then this  
				// section of code triggers 
				if (points.style.display === "none") { 
	  
					// Hide the text between the span 
					// elements 
					showMoreText.style.display = "none"; 
	  
					// Show the dots after the text 
					points.style.display = "inline"; 
	  
					// Change the text on button to  
					// 'Show More' 
					buttonText.innerHTML = "Show Details"; 
				} 
	  
				// If the hidden portion is revealed, 
				// we will change it back to be hidden 
				else { 
	  
					// Show the text between the 
					// span elements 
					showMoreText.style.display = "inline"; 
	  
					// Hide the dots after the text 
					points.style.display = "none"; 
	  
					// Change the text on button 
					// to 'Show Less' 
					buttonText.innerHTML = "Show Less"; 
				} 
			} 
		</script>
		<script src="js/comment.js"></script>
		<script src="js/rating.js"></script>	
	</body>	
</html>