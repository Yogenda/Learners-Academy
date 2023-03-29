<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Class</title>
<link rel='stylesheet'  href="../navbar.css">
<link rel='stylesheet' href="../adminhome.css">
</head>
<body>

<ul>
		<li><a href="../Home.jsp">Admin Home</a></li>
		<li><a href="AssignSubject.jsp">Assign Subject</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>
<h2>Add New Class</h2>
	<form name = "frmclass" method = "POST" >
		<table>
			<tr>
				<td>Class ID</td>
				<td><input type = "number" name = "clid" ></td>
			</tr>
			<tr>
				<td>Class Name</td>
				<td><input type ="text" name="clname"></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "Add Class"></td>
				<td><input type = "reset" value = "Clear Form"></td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<h2>Class Details</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Class Id</th><th>Class</th>
		</tr>
		<%
		try
		{
		ClassOpr cop = new ClassOpr();
		ResultSet rs = cop.ShowAllClass();
		
		while (rs.next())
		{		
		%>
		
		
		<tr>
			<td><%=rs.getInt("klassid") %></td>
			<td><%=rs.getString("klassname") %></td>
			<td><a href="DeleteClass.jsp?kid=<%=rs.getInt("klassid")%>">Delete</a></td>
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

<%

	String klassid = request.getParameter("clid");
	String klassname = request.getParameter("clname");
	try
	{
	ClassModel cmo = new ClassModel();
	cmo.setKlassid(Integer.parseInt(klassid));
	cmo.setKlassname(klassname);
	
	ClassOpr cop = new ClassOpr();
	String res = cop.AddNewClass(cmo);
	
	if(res.equals("Success"))
	{
			response.sendRedirect("AddKlass.jsp");
	}
	
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	
		

%>