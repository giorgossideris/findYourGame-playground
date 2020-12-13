<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>

<%
String searchbar = request.getParameter("searchbar"); // ama einai keno tote den ehei dwsei timh o hrhsths 
String players = request.getParameter("players");
String age = request.getParameter("age");
int category = Integer.parseInt(request.getParameter("category"));
int duration = Integer.parseInt(request.getParameter("duration"));
int num_of_players = -1;
int age_num = -1;

boolean negative_num_of_players_given = false;
boolean string_num_of_players_given = false;

boolean string_age_given = false;
boolean negative_age_given = false;

if(!players.equals("")){
	try{
		num_of_players= Integer.parseInt(players);
	}catch(Exception e){
		string_num_of_players_given=true;	
	}
	if(string_num_of_players_given==false){
		if(num_of_players<=0){
			negative_num_of_players_given=true;
		}
	}
}else{
	num_of_players=-1; // ΑΜΑ ΔΕ ΔΩΣΕΙ ΤΙΜΗ ΒΑΖΩ ΧΕΡΑΤΑ ΤΟ -1 ΩΣΤΕ ΝΑ ΜΠΟΡΩ ΝΑ ΠΑΙΞΩ ΣΤΗ ΒΑΣΗ
}
	
if(!age.equals("")){
	try{
		age_num = Integer.parseInt(age);
	}catch(Exception e){
		string_age_given=true;

	}
	if(string_age_given==false){
		if(age_num<=0){
			negative_age_given=true;
		}
	}
}else{
	age_num=-1; // ΑΜΑ ΔΕ ΔΩΣΕΙ ΤΙΜΗ ΒΑΖΩ ΧΕΡΑΤΑ ΤΟ -1 ΩΣΤΕ ΝΑ ΜΠΟΡΩ ΝΑ ΠΑΙΞΩ ΣΤΗ ΒΑΣΗ 
}

if(negative_age_given || string_num_of_players_given || negative_num_of_players_given || string_age_given){



%>
    <!DOCTYPE html>
<html lang="en">
<head>
<title>Gaming Store a Games Category Bootstrap r	esponsive Website Template | Home :: w3layouts</title>
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
<div class="alert alert-danger" role="alert">  
<%  
int x = 0 ; 
	if (string_age_given){        
		
		x++;
		out.println(x +".Age has to be an Integer\n");
		%><br><%    
	}
	if (negative_age_given){                 
		x++;
		out.println(x +".Age have to be a positive number \n");
		%><br><% 
	}
	if (string_num_of_players_given){                 
		x++;
		out.println(x +".Number of players has to be an Integer\n");
		%><br><% 
		
	}
	if (negative_num_of_players_given){                 
		x++;
		out.println(x +".Number of players has to be a positive number\n");
		%><br><% 
		
	}
%>
</div>

<form action="index.jsp">
    <button type="submit" class="btn btn-dark"><span class="glyphicon glyphicon-menu-left"></span>Back to the main page</button>
</form>
</body>
</html>
<% }else{

GameDAO gamedao = new GameDAO(); 

List<Game> games = gamedao.getGames(searchbar,num_of_players,age_num,category,duration);

	
for ( Game game : games){
	%><p><%=game.getGamename()%></p><%
}


}
%> 

