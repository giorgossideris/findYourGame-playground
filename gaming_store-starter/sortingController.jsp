<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*, java.util.List, java.util.ArrayList, java.util.Arrays" %>
<% 



int eidos_sort = Integer.parseInt(request.getParameter("eidos_sort")); // eidos sortarismatos 0 = default 1 = popularity 2 = rating 


List<Game> unsorted_games = (List<Game>)request.getAttribute("games_list");
GameDAO gamedao = new GameDAO();
List<Game> sorted_games = gamedao.ReturnGamesSorted(unsorted_games,eidos_sort);

request.setAttribute("sorted_list",sorted_games);
%>
<jsp:forward page = "navigation.jsp"/>






    
