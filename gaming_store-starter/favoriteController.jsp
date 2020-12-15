<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*" %>

<%
    FavoriteDAO favoriteDAO = new FavoriteDAO();
    favoriteDAO.addToFavorite(1, 4);
%>