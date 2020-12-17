<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_files_FindYourGame.*, java.util.List" %>
<%@ page errorPage="app_error.jsp" %>

<%
String given_email = request.getParameter("email");
if (given_email == null) {
    
    response.sendRedirect("index.jsp");
    return;

}

try {

    if ( given_email.length() == 0 ) {
        throw new Exception("No email inserted");
    }
    
	String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(given_email);
	
	//Case 2: if email is not valid throw an Exception with the message.
	if( !m.matches() ) {		
		throw new Exception(given_email + " is not a valid email address!");
    
    
    }
    EmailDAO emaildao= new EmailDAO();
    emaildao.add_email(given_email);
    %>
    <jsp:forward page="index.jsp"/>
    <% 
	}	catch (Exception e){
        request.setAttribute("error_message", e.getMessage());
    %>
    <jsp:forward page="index.jsp"/>
    <%    
    }

    %>