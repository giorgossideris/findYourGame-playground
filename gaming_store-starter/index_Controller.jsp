<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*, java.util.List, java.util.Arrays" %>

<%

String searchbar = request.getParameter("searchbar"); // ama einai keno tote den ehei dwsei timh o hrhsths 
String players_str = request.getParameter("players");
String age_str = request.getParameter("age");
int category_id = Integer.parseInt(request.getParameter("category"));
int duration_id = Integer.parseInt(request.getParameter("duration"));
int players = -1, age = -1;


boolean negative_num_of_players_given = false;
boolean string_num_of_players_given = false;

boolean string_age_given = false;
boolean negative_age_given = false;

if(!players_str.equals("")){
	try{
		players= Integer.parseInt(players_str);
	}catch(Exception e){
		string_num_of_players_given=true;	
	}
	if(string_num_of_players_given==false){
		if(players<=0){
			negative_num_of_players_given=true;
		}
	}
} // if the user didn't enter players, players variable equals to -1
	
if(!age_str.equals("")){
	try{
		age = Integer.parseInt(age_str);
	}catch(Exception e){
		string_age_given=true;

	}
	if(string_age_given==false){
		if(age<=0){
			negative_age_given=true;
		}
	}
}// if the user didn't enter age, age variable equals to -1

boolean isSomethingWrong=negative_age_given || string_num_of_players_given || negative_num_of_players_given || string_age_given;
if(isSomethingWrong){
	/*String errorMessage = "<ol>";
	if (string_age_given){        
		errorMessage += "<li>Age has to be an Integer</li>";   
	} else if (negative_age_given){                 
		errorMessage += "<li>Age have to be a positive number.</li>";
	}
	if (string_num_of_players_given){                 
		errorMessage += "<li>Number of players has to be an Integer.</li>";
	}
	if (negative_num_of_players_given){
		errorMessage += "<li>Number of players has to be a positive number.</li>";
	}
	errorMessage += "</ol>";
	request.setAttribute("message", errorMessage);*/
%>
<!-- <jsp:forward page="index.jsp"/> -->
<%} 
	else {%>
	List<String> search_items = new List<String>(Arrays.toList(searchbar, Integer.toString(players), Integer.toString(age),
												  Integer.toString(category_id), Integer.toString(duration_id)));
	request.setAttribute("search_items", search_items);
%>
<jsp:forward page="navigation.jsp"/>
<% } %>