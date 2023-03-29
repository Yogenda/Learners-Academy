<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel='stylesheet' href="navbar.css">
<link rel='stylesheet' href="form.css">
</head>
<body>
	<ul>
	<li><a href="Landing.jsp">Home</a></li>
	</ul>
	<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form name="frmLogin" method="POST" action="logincheck.jsp">
		
		<h3>Login Here</h3>

		<label>Email</label> 
		<input type="email" placeholder="Email" name="txtUsername" id="username"> 
		
		<label>Password</label> 
		<input type="password" placeholder="Password" name="txtPass" id="password">
 		
 		<button type="submit">Log In</button>
		
		
		<%
			if(session.getAttribute("info")!=null)
			{
				String str = (String)session.getAttribute("info");
		%>		
			<label><%=str %></label>	
		<% 	
			}
		%>
		
		
	
		

	</form>
</body>
</html>