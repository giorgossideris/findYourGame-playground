<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>
<%@ page errorPage="app_error.jsp" %>

<%
String comment_text = request.getParameter("comment_text");
if (comment_text == null) {
    
    response.sendRedirect("game-view.jsp");
    return;

}

try {

    if ( comment_text.length() == 0 ) {
        throw new Exception("No comment inserted");
    }
    

    CommentDAO commentdao= new CommentDAO();
    commentdao.add_comment(comment_text,game_id,registered_user_id);
    %>
    <jsp:forward page="game-view.jsp"/>
    <% 
	}	catch (Exception e){ 
        request.setAttribute("error_message", e.getMessage());
    %>
    <jsp:forward page="game-view.jsp"/>
    <%    
    }

    %>