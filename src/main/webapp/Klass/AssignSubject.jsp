<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import	= "com.operator.*" %>
<%@ page import	= "com.model.*" %>
<%@ page import	= "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Subject</title>
<link rel='stylesheet'  href="../navbar.css">
<link rel='stylesheet' href="../adminhome.css">
</head>
<body>

<ul>
		<li><a href="../Home.jsp">Admin Home</a></li>
		<li><a href="AddKlass.jsp">Back</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>

<form name="assign" action="SubAs.jsp" method="POST">
		
		 Sno :<input type = "number" name = "ksid">
		
			
			Class Name :
			<select name="ddlklass">
				<option>Select Class</option>

				<%
				ClassOpr cop = new ClassOpr();
				ResultSet rcs = cop.ShowAllClass();

				while (rcs.next()) {
				%>
				<option value='<%=rcs.getInt("klassid")%>'><%=rcs.getString("klassname")%></option>
				<%
				}
				%>
			</select>
			
			Subject Name :
			<select name="ddlsubject">
				<option>Select Subject</option>

				<%
				SubjectOpr sop = new SubjectOpr();
				ResultSet rss = sop.ShowAllSubject();

				while (rss.next()) {
				%>
				<option value='<%=rss.getInt("subid")%>'><%=rss.getString("subname")%></option>
				<%
				}
				%>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			
							
			<br>
			<br>
			<input type="submit" value="Assign Subject" />
	</form>
	
	<h2>Assigned Subject</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Class_Subject Id</th><th>Class ID</th><th>Subject ID</th>
		</tr>
		<%
		try
		{
		ClassOpr cop1 = new ClassOpr();
		ResultSet rs = cop1.ShowAllClassSubject();
		
		while (rs.next())
		{		
		%>
		
		
		<tr>
			<td><%=rs.getInt("klass_subjectid") %></td>
			<td><%=rs.getInt("klassids") %></td>
			<td><%=rs.getInt("subjectid") %></td>
			<td><a href="DeleteAssignSubject.jsp?csid=<%=rs.getInt("klass_subjectid")%>">Delete</a></td>
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