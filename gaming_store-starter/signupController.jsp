<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*" %>

<%

//if direct access not via signup redirect to signup
if (request.getParameter("username") == null || request.getParameter("email") == null || request.getParameter("password") == null) {

    response.sendRedirect("signup.jsp");
    return;

}

String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");


//validating inputs of the user
String message = "<ol>";
boolean flag = true;

//validating username
if (username.length() < 4) {
     message += "<li>Username must be at least 4 characters</li>";
     flag = false;
}

if (email.length() == 0) {
    message += "<li>No email inserted</li>";
    flag = false;
}

String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
java.util.regex.Matcher m = p.matcher(email);

 //Case 2: if email is not valid throw an Exception with the message.
if( !m.matches() ) {		
    message += "<li>" + email + " is not a valid email address</li>";
    flag = false;
}	

//validating password
if (password.length() < 4) {
     message += "<li>Password must be at least 8 characters</li>";
     flag = false;
}

//case: all inputs are valid
if (flag) {
    UserDAO user = new UserDAO();
    try {

        User reg_user = user.registerUser(username, email, password); 
    
    

    session.setAttribute("userObj", reg_user);
%>
    <jsp:forward page = "index.jsp"/>
<%
    }catch (Exception e) {

        request.setAttribute("error_message", e.getMessage());
%>
        <jsp:forward page = "signup.jsp"/>
<%
        }

} else {
    message += "</ol>";
    request.setAttribute("error_message", message);
%>
    <jsp:forward page = "signup.jsp"/>
<%
}







%>