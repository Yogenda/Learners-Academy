<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Student</title>
<link rel='stylesheet'  href="../navbar.css">
<link rel='stylesheet' href="../adminhome.css">
</head>
<body>

<ul>
		<li><a href="../Home.jsp">Admin Home</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>
<h2>Add New Student</h2>
	<form name = "frmclass" method = "POST" >
		<table>
			<tr>
				<td>Student ID</td>
				<td><input type = "number" name = "stid" ></td>
			</tr>
			<tr>
				<td>Student Name</td>
				<td><input type ="text" name="stname"></td>
			</tr>
			<tr>
				<td>Class ID</td>
				<td><select name="ddlclass">
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
			</select> </td>
			</tr>
			<tr>
				<td><input type = "submit" value = "Add Student"></td>
				<td><input type = "reset" value = "Clear Form"></td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<h2>Class Details</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Student Id</th><th>Student Name</th><th>Class</th>
		</tr>
		<%
		try
		{
		StudentOpr sto = new StudentOpr();
		ResultSet rs = sto.ShowAllStudent();
		
		while (rs.next())
		{		
		%>
		
		
		<tr>
			<td><%=rs.getInt("studentid") %></td>
			<td><%=rs.getString("studentname") %></td>
			<td><%=rs.getInt("klassids") %></td>
			<td><a href="DeleteStudent.jsp?stid=<%=rs.getInt("studentid")%>">Delete</a></td>
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

	String studentid = request.getParameter("stid");
	String studentname = request.getParameter("stname");
	String klassids = request.getParameter("ddlclass");
	
	try
	{
	StudentModel smo = new StudentModel();
	smo.setStudentid(Integer.parseInt(studentid));
	smo.setStudentname(studentname);
	smo.setKlassids(Integer.parseInt(klassids));
	
	StudentOpr sto = new StudentOpr();
	String res = sto.AddNewStudent(smo);
	
	if(res.equals("Success"))
	{
			response.sendRedirect("AddStudent.jsp");
	}
	
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	
		

%>