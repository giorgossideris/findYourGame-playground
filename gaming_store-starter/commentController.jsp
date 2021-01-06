<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page errorPage="app_error.jsp" %>

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
    String commentContent = URLDecoder.decode(request.getParameter("comment_content"), "UTF-8"); // decoded because script encoded the comment in order to support greek characters
    

    CommentDAO commentDAO = new CommentDAO();
    
    commentDAO.add_comment(commentContent, gameId, userId);
%>