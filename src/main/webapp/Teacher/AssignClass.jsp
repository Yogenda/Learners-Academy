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
		<li><a href="AddTeacher.jsp">Back</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>

<form name="assign" action="ClassAs.jsp" method="POST">
		
		 Sno :<input type = "number" name = "ctid">
		
			
			Teacher Name :
			<select name="ddlteacher">
				<option>Select Teacher</option>

				<%
				TeacherOpr top = new TeacherOpr();
				ResultSet rcs = top.ShowAllTeacher();

				while (rcs.next()) {
				%>
				<option value='<%=rcs.getInt("teacherid")%>'><%=rcs.getString("teachername")%></option>
				<%
				}
				%>
			</select>
			
			Class Name :
			<select name="ddlclass">
				<option>Select Class</option>

				<%
				ClassOpr cop = new ClassOpr();
				ResultSet rss = cop.ShowAllClass();

				while (rss.next()) {
				%>
				<option value='<%=rss.getInt("klassid")%>'><%=rss.getString("klassname")%></option>
				<%
				}
				%>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			Subject Name :
			<select name="ddlsubject">
				<option>Select Subject</option>

				<%
				SubjectOpr sop = new SubjectOpr();
				ResultSet rsub = sop.ShowAllSubject();

				while (rsub.next()) {
				%>
				<option value='<%=rsub.getInt("subid")%>'><%=rsub.getString("subname")%></option>
				<%
				}
				%>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			
							
			<br>
			<br>
			<input type="submit" value="Assign Class" />
	</form>
	
	<h2>Assigned Subject</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Class_Teacher Id</th><th>Teacher ID</th><th>Class ID</th><th>Subject ID</th>
		</tr>
		<%
		try
		{
		TeacherOpr top1 = new TeacherOpr();
		ResultSet rs = top1.ShowClassTeacher();
		
		while (rs.next())
		{		
		%>
		
		
		<tr>
			<td><%=rs.getInt("klass_teacherid") %></td>
			<td><%=rs.getInt("teacherid") %></td>
			<td><%=rs.getInt("klassids") %></td>
			<td><%=rs.getInt("subjectid") %></td>
			<td><a href="DeleteAssignClass.jsp?ctid=<%=rs.getInt("klass_teacherid")%>">Delete</a></td>
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