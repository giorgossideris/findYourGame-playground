<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*" %>

<%
    int gameId = -1, userId = -1;
    try {  
        gameId = Integer.parseInt(request.getParameter("game_id"));  // το String μπορεί να μετατραπεί σε int 
    } catch (NumberFormatException e) {  
        // το String δεν μπορεί να μετατραπεί σε int  
    }
    try {  
        userId = Integer.parseInt(request.getParameter("user_id"));  // το String μπορεί να μετατραπεί σε int 
    } catch (NumberFormatException e) {  
        // το String δεν μπορεί να μετατραπεί σε int  
    }
    String action = request.getParameter("action");
    
    FavoriteDAO favoriteDAO = new FavoriteDAO();
    
    if (action.equals("add")){
        favoriteDAO.addToFavorite(userId, gameId);
    } else if (action.equals("remove")){
        favoriteDAO.removeFromFavorite(userId, gameId);
    }
%>