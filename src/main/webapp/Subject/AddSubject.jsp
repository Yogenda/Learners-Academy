<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Subject</title>
<link rel='stylesheet'  href="../navbar.css">
<link rel='stylesheet' href="../adminhome.css">
</head>
<body>

<ul>
		<li><a href="../Home.jsp">Admin Home</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>
<h2>Add New Subjects</h2>
	<form name = "frmsubject" method = "POST" >
		<table>
			<tr>
				<td>Subject ID</td>
				<td><input type = "number" name = "sid" ></td>
			</tr>
			<tr>
				<td>Subject Name</td>
				<td><input type ="text" name="sname"></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "Add Subject"></td>
				<td><input type = "reset" value = "Clear Form"></td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<h2>Subject Details</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Subject Id</th><th>Subject Name</th>
		</tr>
		<%
		try
		{
		SubjectOpr cop = new SubjectOpr();
		ResultSet rs = cop.ShowAllSubject();
		
		while (rs.next())
		{		
		%>
		
		
		<tr>
			<td><%=rs.getInt("subid") %></td>
			<td><%=rs.getString("subname") %></td>
			<td><a href="DeleteSubject.jsp?sid=<%=rs.getInt("subid")%>">Delete</a></td>
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

	String subid = request.getParameter("sid");
	String subname = request.getParameter("sname");
	try
	{
	SubjectModel smo = new SubjectModel();
	smo.setSubid(Integer.parseInt(subid));
	smo.setSubname(subname);
	
	SubjectOpr sop = new SubjectOpr();
	String res = sop.AddNewSubject(smo);
	
	if(res.equals("Success"))
	{
			response.sendRedirect("AddSubject.jsp");
	}
	
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	
		

%>