<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*" %>
<%@ page errorPage="app_error.jsp" %>

<%
    int user_id_who_rates = -1, game_id_to_be_rated = -1;
    double new_rating_value=-1;
    try {  
        user_id_who_rates = Integer.parseInt(request.getParameter("user_id"));  // το String μπορεί να μετατραπεί σε int 
    } catch (NumberFormatException e) {  
        // το String δεν μπορεί να μετατραπεί σε int  
    }
    try {  
        game_id_to_be_rated = Integer.parseInt(request.getParameter("game_id"));  // το String μπορεί να μετατραπεί σε int 
    } catch (NumberFormatException e) {  
        // το String δεν μπορεί να μετατραπεί σε int  
    }
    try {  
        new_rating_value = Double.parseDouble(request.getParameter("rating"));  // το String μπορεί να μετατραπεί σε int 
    } catch (NumberFormatException e) {  
        // το String δεν μπορεί να μετατραπεί σε double  
    }

GameDAO gamedao = new GameDAO(); 
gamedao.addRating(game_id_to_be_rated,user_id_who_rates,new_rating_value);//vazw thn nea aksiologhsh
Game game = gamedao.getCurrentRatingAndNumberOfRatingsOfGame(2);//pairnw thn aksiologhsh tou 2ou game kai to number_of_ratings
double old_rating= game.getRating_value();
int old_num_of_ratings = game.getNumber_of_ratings();
double new_rating_of_game = (old_num_of_ratings*old_rating + new_rating_value)/(old_num_of_ratings + 1);
int new_num_of_ratings = old_num_of_ratings +1;
gamedao.UpdateGameRating(game_id_to_be_rated,new_rating_of_game,new_num_of_ratings);
%>