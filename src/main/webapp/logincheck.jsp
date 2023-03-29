<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.connection.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.model.*" %>
<%@ page import = "com.operator.*" %>


<% 
String user = request.getParameter("txtUsername");
String pass = request.getParameter("txtPass");

if (user.equals("Admin@gmail.com") && pass.equals("Admin"))
{
	session.setAttribute("info", "");
	response.sendRedirect("Home.jsp");
}
else
{
	session.setAttribute("info", "Invalid Login ID & Password");
	response.sendRedirect("Login.jsp");	
}

%>

			