<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.operator.*" %>   
<%@ page import ="com.model.*" %> 
<%@ page import ="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Class Report</title>
<link rel='stylesheet'  href="navbar.css">
<link rel='stylesheet' href="home.css">
</head>
<body>


	<ul>
		<li><a href="Landing.jsp">Home</a></li>
		<li><a href="Login.jsp">Admin Login</a></li>
	</ul>
	
	<h2 align="center"> Class Report</h2>
	<table width = "50%" border = "1" align="center">
		<tr>
		<th>Class Name </th><th>Subject Name</th><th>Teacher Name</th><th>Student Name</th>
		</tr>
		<%
		try
		{
		ClassOpr top = new ClassOpr();
		ResultSet rs = top.ShowClassReport();
		
		while (rs.next())
		{		
		%>
		<tr>
			<td><%=rs.getString("klass.klassname") %></td>
			<td><%=rs.getString("sub.subname") %></td>
			<td><%=rs.getString("teacher.teachername") %></td>
			<td><%=rs.getString("student.studentname") %></td>
			
		</tr>
		<%
		} 
		}
		catch(Exception ex)
		{
			System.out.print(ex);
		}
		%>
	</table>

</body>
</html>