<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="app_error.jsp" %>
<%@ page import="java_files_FindYourGame.*" %>

<%

//if direct access not via login.jsp forward an appropriate message 
if (request.getParameter("username") == null || request.getParameter("password") == null) {
    response.sendRedirect("login.jsp");
    return;
}
String username = request.getParameter("username");
String password = request.getParameter("password");

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