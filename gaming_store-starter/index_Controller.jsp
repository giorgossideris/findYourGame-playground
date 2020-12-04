<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>%>
<%@ page errorPage="app_error.jsp" %>

<%
String search2 = request.getParameter("search2"); // ama einai keno tote den ehei dwsei timh o hrhsths 
String players = request.getParameter("players");
String age = request.getParameter("age");
int category = Integer.parseInt(request.getParameter("category"));
int duration = Integer.parseInt(request.getParameter("duration"));


%>
<h1>

 <%
 if(search2.equals("")){
    out.println("hi");
 }
 out.println(search2);
 out.println(players);
 out.println(age);
 out.println(category);
 out.println(duration);

 
 %>   
</h1>