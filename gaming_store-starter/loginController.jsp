<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java_files_FindYourGame.*" %>
<%@ page errorPage="app_error.jsp" %>

<%

//if direct access not via login.jsp forward an appropriate message 
if (request.getParameter("username") == null || request.getParameter("password") == null) {
    response.sendRedirect("login.jsp");
    return;
}
String username = request.getParameter("username");
String password = request.getParameter("password");

// convert from ISO-8859-1 (latin) to UTF-8 so as to support Greek characters
username = new String(username.getBytes("ISO-8859-1"), "UTF-8");
password = new String(password.getBytes("ISO-8859-1"), "UTF-8");

UserDAO userdao = new UserDAO();

try {

    User auth_user = userdao.authenticate(username, password);
    session.setAttribute("userObj", auth_user);
%>
    <jsp:forward page = "index.jsp"/>
<%

}catch(Exception e) {

    request.setAttribute("message", e.getMessage());
%>
    <jsp:forward page = "login.jsp"/>
<%
}


%>