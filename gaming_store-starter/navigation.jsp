<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*, java.util.List,java.util.ArrayList" %>
<%@ page errorPage="app_error.jsp" %>

<%
boolean isUserRegistered = false;
User auth_user = null;
if (session.getAttribute("userObj") != null) {
	auth_user = (User)session.getAttribute("userObj");
	isUserRegistered = true;
}
Search_fields search_items = new Search_fields();
if (request.getAttribute("search_items") != null){
    search_items = (Search_fields)request.getAttribute("search_items");
}


CategoryDAO categoryDAO = new CategoryDAO();
List<Category> categories = categoryDAO.getCategories();
GameDAO gameDAO = new GameDAO();

DurationDAO durationdao = new DurationDAO();
List<Duration> durations = durationdao.getDurations();

FavoriteDAO favoriteDAO = new FavoriteDAO();
UserDAO userDAO = new UserDAO();




List <Game> gamesToShow = new ArrayList<Game>();
if(request.getAttribute("search_items")!=null){
    gamesToShow = gameDAO.getGames(search_items);
}else{
%>
    <jsp:forward page="index.jsp"/>
<%
    return;
}
request.setAttribute("games_list",gamesToShow);
%>

<!DOCTYPE html>
<html lang="en" data-user-id = "<%= isUserRegistered ? auth_user.getId() : "null"%>">
<head>

    <title>Search Results</title>
    <%@ include file = "header.jsp" %>
    <!-- custom css -->
    <link rel="stylesheet" href="css/custom_style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/navigation_style.css" type="text/css" media="all">
    <!-- //custom css -->
 
</head>
<body>
	<!-- banner -->
	<div class="banner1">
		<div class="agileinfo-dot">
            <a class="logo" title="Home" href="<%=request.getContextPath() %>/FindYourGame/index.jsp">
				<img src="<%=request.getContextPath() %>/FindYourGame/images/logo.png">
			</a>
			<div class="header-top">
				<div class="container">
					<div class="header-top-info">
                        <%@ include file = "navMenu.jsp" %>
                        <form action="search_Controller.jsp" method="GET">
                            <div id="whole-form" class=" example index_searchbar"  >
                                <input class="search-input" type="text" name="searchbar" value= "<%= search_items.getSearch_bar().equals("") ? "" : search_items.getSearch_bar() %>" <%= search_items.getSearch_bar().equals("") ?  "placeholder=Search Your Game.." : "" %> >
                            
   
                                <button class="search-button" type="submit"><i class="fa fa-search"></i></button> 
                            </div>
                                <input   type="hidden" name="players" class="form-control filter-input rounded-corners" value= "" >
                                <input  type="hidden" name="age" class="form-control filter-input rounded-corners" value="" >
                                <select style="visibility: hidden;" class="form-control filter-input rounded-corners" name="category" >
                                    <option value="-1" ></option>
                                </select>
                                <select style="visibility: hidden;" class="form-control filter-input rounded-corners" name="duration">
                                    <option value="-1"></option>
                                </select> 
                        </form>
                    </div>     
				</div>
			</div>	
		</div>
	</div>
    <div class="br-back"><br></div>
    <div class="navigation-area hot-games-back">
        <form action="search_Controller.jsp" method="GET">

            <div class = "filter-area">
                <div  class="form-group filter-form">
                    <div class="filter">
                        <label   class="control-label filter-description">Players:</label>
                        <input   type="text" name="players" class="form-control filter-input rounded-corners" value= "<%= search_items.getPlayers() == 0 || search_items.getPlayers() == -1 ? "" : search_items.getPlayers() %>" <%= search_items.getPlayers() == -1 ? "placeholder=-" : "" %>>
                    </div>
                    <div class="filter">
                        <label  class="control-label filter-description">  Age:</label>
                        <input  type="text" name="age" class="form-control filter-input rounded-corners" value="<%= search_items.getAge() == 0 || search_items.getAge() ==  -1 ? "" : search_items.getAge() %>" <%= search_items.getAge() == -1 ? "placeholder=-" : "" %>>
                    </div>
                
                    <div class="filter">
                        <label   class="control-label filter-description">Category:</label>
                        <select class="form-control filter-input rounded-corners" name="category">
                            <option class="correct-font" value="-1" style="padding-left: 0px; ">Any</option>		
                            <%	for (Category cat: categories) { %>
                                <option value="<%=cat.getCategory_id()%>" <%= search_items.getCategory_id() == cat.getCategory_id() ? "selected" : "" %> ><%=cat.getCategory_name()%></option>
                            <% } %>
                        </select>

                        
                    </div>

                    <div class="filter">
                        <label for="duration" class="control-label filter-description">Duration:</label>
						<select class="form-control filter-input rounded-corners" name="duration">
                            <option class="correct-font" value="-1" style="padding-left: 0px; ">Any</option>
							<%	for ( Duration dur: durations ) { %>
						    	<option value="<%=dur.getDuration_id()%>" <%= search_items.getDuration_id() == dur.getDuration_id() ? "selected" : "" %> ><%= dur.getDuration_name() %></option>
							<% } %>

						</select>
                    </div>	
                    <!-- <input class="search-input" type="hidden" placeholder="Search Your Game.." name="searchbar"> -->
			
                </div>
      
                <button type="submit" class="apply-filters-button">Apply filters</button> 
            </div>   
            <input type="hidden" class="search-input" name="searchbar" value= "<%= search_items.getSearch_bar().equals("") ? "" : search_items.getSearch_bar() %>" >

        </form>
        <div class="games-to-navigate-area"> 	
            <div class="results-header">
                <span id="results-title">
                    <h2>Search Results</h2> <span class="badge"><%=gamesToShow.size()%></span>
                   
                </span>
                <span id="sorting-section">
                    <label for="sorting">Sort by:</label>
                    <select id="sort-dropdown" name="eidos_sort">
                        <%if( request.getParameter("eidos_sort") == null || Integer.parseInt(request.getParameter("eidos_sort")) == 0){%>
                        <option class="sort-type" value="0">Default</option>
                        <option class="sort-type" value="1">Popularity</option>
                        <option class="sort-type" value="2">Rating</option>
                        <%}else if(Integer.parseInt(request.getParameter("eidos_sort"))==1){%>
                        <option class="sort-type" value="1">Popularity</option>
                        <option class="sort-type" value="0">Default</option>
                        <option class="sort-type" value="2">Rating</option>
                        <%}else{%>
                        <option class="sort-type" value="2">Rating</option>
                        <option class="sort-type" value="0">Default</option>
                        <option class="sort-type" value="1">Popularity</option>
                    <% }%>
                    </select>
                </span> 
            </div>
            <button id="show-filters-button">Show filters</button>
            <hr>
            <div class="agileits-title" id="gallery"> 
                <br>
            <%
            if (gamesToShow.size()==0){
            %>
            <p class="no-games" style="height: 50vw;">No games found.</p>
            <%
            }else{
            %>
                <div id="games-to-show">
            <%
                for (Game game : gamesToShow){
            %>
                    <div class="game"
                        data-game-name="<%=game.getGamename()%>"
                        data-game-rating="<%=game.getRating_value()%>"
                        data-game-favorites-counter="<%=game.getFavorite_counter()%>">
                        <div class="game-layout">	
                            <img class="game-photo" src="<%=game.getPhoto_path()%>" alt="Photo of the game">
        
                            <a class="game-name" href="game-view.jsp?game_id=<%= game.getGame_id()%>">
                                <h4><%=game.getGamename()%></h4>

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
                        <br>
                    </div>
<%      } 
    }%>		
                </div>	
            </div>
        </div>
    </div>
	
	<div class="br-back"><br></div>

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
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {

								
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
        <!--script for filter-area in small screens  -->
    <!--script for filter-area in small screens  -->
    <script type="text/javascript">
        $('#show-filters-button').click(function() {
            let filter_area = document.querySelector('.filter-area'),
                style = window.getComputedStyle(filter_area),
                display = style.getPropertyValue('display');
            if (display == 'none'){
                $('.filter-area').css({
                    'display': 'flex',
                });
                document.getElementById('show-filters-button').innerText = "Hide filters";
            } else {
                $('.filter-area').css({
                    'display': 'none',           
                });
                document.getElementById('show-filters-button').innerText = "Show filters";
            }
        });
    </script>
    <!-- script to make filter-area displayable for large screens -->
    <script src="js/resp_filters.js"></script>
    <!-- script for clicking heart -->
	<script src="js/favorite.js"></script>
    <!-- end of script for clicking heart -->
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){		
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script> 
    <script src="js/sorting.js"></script>
</body>	
</html>