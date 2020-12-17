<%@  page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="app_error.jsp" %>


<!DOCTYPE html>
<html lang="en">
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
						<img src="<%=request.getContextPath() %>/FindYourGame/images/uno.png" alt="UNO">
						<!-- </a> -->
					
					</div>
					<div class="secdetails">

						<div class="game-title">
							<h2>UNO Classic Edition</h2>						
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
								<span class="rating-value">4.67</span>
								<span class="out-of">/5</span>
								
							</span>
						</div>
		
						<div class="rules">

							<ul class="categories">
								<li class="left-up"> <span class="white"><i class="fa fa-quote-right fa-xs"></i> Category:</span> Cards </li>
								<li class="right-up"> <span class="white"><i class="fa fa-user-friends fa-xs"></i> Players: </span> 2-10 </li>  
								<li class="left-down"> <span class="white"><i class="fa fa-child fa-xs"></i> Age:</span> 7+ </li>
								<li class="right-down"> <span class="white"><i class="fa fa-clock fa-xs"></i> Duration:</span> 20'+ </li>

							</ul>
							
							
							<div class="game-description">
								<div class="desc-heading">Short Description</div>
								<div class="br-headings">
									<br>
								</div>
		
									<p> Every player starts with seven cards, and they are dealt face down. 
										The rest of the cards are placed in a Draw Pile face down. 
										Next to the pile a space should be designated for a Discard Pile. 
										The top card should be placed in the Discard Pile, and the game begins!	
										<span id="points">...</span> 
									</p>	
										<div class="desc-heading">Details</div>
										<div class="br-headings">
											<br>
										</div> 
										<span id="moreText" class="game-description">
												
												The first player is normally the player to the left of the dealer (you can also choose the youngest player) and gameplay usually 
												follows a clockwise direction. Every player views his/her cards and tries to match the card in 
												the Discard Pile. 
												You have to match either by the number, color, or the symbol/Action. 
												For instance, if the Discard Pile has a red card that is an 8 you have to place either a red card or a card with an 8 on it.  
												You can also play a Wild card (which can alter current color in play). 
												If the player has no matches or they choose not to play any of their cards even though they might have 
												a match, they must draw a card from the Draw pile. If that card can be played, play it. 
												Otherwise, keep the card, and the game moves on to the next person in turn.  
												You can also play a Wild card, or a Wild Draw Four card on your turn. Note: If the first card turned 
												up from the Draw Pile (to form the Discard Pile) is an Action card, the Action from that card 
												applies and must be carried out by the first player to go (as stated, it is usually the player 
												to the dealer’s left). The exceptions are if a Wild or Wild Draw Four card is turned up. If it is a 
												Wild card, Mattel has now stated that the first player to start (usually the one on the dealer’s left),
												can choose whatever color to begin play. If the first card is a Wild Draw Four card – Return it to the 
												Draw Pile, shuffle the deck, and turn over a new card. At any time during the game, if the Draw Pile becomes 
												depleted and no one has yet won the round, take the Discard Pile, shuffle it, and turn it over to regenerate 
												a new Draw Pile. Take note that you can only put down one card at a time; you cannot stack two or more cards 
												together on the same turn. For example, you cannot put down a Draw Two on top of another Draw Two, 
												or Wild Draw Four during the same turn, or put down two Wild Draw Four cards together.
												The game continues until a player has one card left. The moment a player has just one card 
												they must yell “UNO!”. If they are caught not saying “Uno” by another player before the next player 
												has taken their turn, that player must draw two new cards as a penalty. Assuming that the 
												player is unable to play/discard their last card and needs to draw, but after drawing, is then 
												able to play/discard that penultimate card, the player has to repeat the action of calling out “Uno”. 
												The bottom line is – Announcing “Uno” needs to be repeated every time you are left with one card. 
												Once a player has no cards remaining, the game round is over, points are scored, and the game begins 
												over again. Normally, everyone tries to be the first one to achieve 500 points, but you can also 
												choose whatever points number to win the game, as long as everyone agrees to it.
												The game continues until a player has one card left. The moment a player has just one card 
												they must yell “UNO!”. If they are caught not saying “Uno” by another player before the next 
												player has taken their turn, that player must draw two new cards as a penalty. Assuming that 
												the player is unable to play/discard their last card and needs to draw, but after drawing, 
												is then able to play/discard that penultimate card, the player has to repeat the action of 
												calling out “Uno”. The bottom line is – Announcing “Uno” needs to be repeated every time you 
												are left with one card. Once a player has no cards remaining, the game round is over, points 
												are scored, and the game begins over again. Normally, everyone tries to be the first one to 
												achieve 500 points, but you can also choose whatever points number to win the game, 
												as long as everyone agrees to it.
												
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
							
							<div class="rate">
								<input type="radio" id="star5" name="rate" value="5" />
								<label for="star5" title="Excellent">5 stars</label>
								<input type="radio" id="star4" name="rate" value="4" />
								<label for="star4" title="Very good">4 stars</label>
								<input type="radio" id="star3" name="rate" value="3" />
								<label for="star3" title="Good">3 stars</label>
								<input type="radio" id="star2" name="rate" value="2" />
								<label for="star2" title="Not good">2 stars</label>
								<input type="radio" id="star1" name="rate" value="1" />
								<label for="star1" title="Not good at all">1 star</label>
							</div>
						</div>

						<div class="comment-area" id="com">
							<h2 class="comments-ratings-head">
								<span class="comments-ratings-title">Comments</span>
							</h2>
							<div class="br-headings">
								<br>
							</div>

							<div class="comment">
								<div class="user-avatar">
									<img src="<%=request.getContextPath() %>/FindYourGame/images/user.png">
								</div>
								<!-- the comment body -->
								<div class="comment-body">
									<p>				
										<div class="user">
											johnsmith5
										</div>
										Comment text.
									</p>
									
								</div>
								<!-- comments toolbar -->
								<div class="comment-toolbar">
								<!-- inc. date and time  -->
									<ul>
										<li>
											<i class="fa fa-calendar"></i> 04/01/2020 
											
										</li>

								</div>
							</div>

							<div class="comment">
								<div class="user-avatar">
									<img src="<%=request.getContextPath() %>/FindYourGame/images/user.png">
								</div>
								<!-- the comment body -->
								<div class="comment-body">
									<p>				
										<div class="user">
											mary2003
										</div>
										Comment text.
									</p>
								</div>
								<!-- comments toolbar -->
								<div class="comment-toolbar">
									<!-- inc. date and time  -->
									<ul>
										<li>
											<i class="fa fa-calendar"></i> 26/01/2020 
											
										</li>

								</div>
							</div>
							<div class="comment-br">
								<br>
							</div>
						
							<div class="create-new-comment">
								<!-- current {user} avatar -->
								<div class="user-avatar">
									<img src="<%=request.getContextPath() %>/FindYourGame/images/user.png">
								</div>
								<!-- the input field -->
								<input type="text" placeholder="Join the conversation..">
								<button class="hover-button submit" >Submit it!</button>

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
	</body>	
</html>