<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Teacher</title>
<link rel='stylesheet'  href="../navbar.css">
<link rel='stylesheet' href="../adminhome.css">
</head>
<body>

<ul>
		<li><a href="../Home.jsp">Admin Home</a></li>
		<li><a href="AssignClass.jsp">Assign Class</a></li>
		<li><a href="../Landing.jsp">Logout</a></li>
</ul>

<br>
<h2>Add New Teacher</h2>
	<form name = "frmteacher" method = "POST" >
		<table>
			<tr>
				<td>Teacher ID</td>
				<td><input type = "number" name = "trid" ></td>
			</tr>
			<tr>
				<td>Teacher Name</td>
				<td><input type ="text" name="tname"></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "Add Teacher"></td>
				<td><input type = "reset" value = "Clear Form"></td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<h2>Teacher Details</h2>
	<table width = "25%" border = "1" >
		<tr>
		<th>Teacher Id</th><th>Teacher Name</th>
		</tr>
		<%
		try
		{
		TeacherOpr top = new TeacherOpr();
		ResultSet rs = top.ShowAllTeacher();
		
		while (rs.next())
		{		
		%>
		<tr>
			<td><%=rs.getInt("teacherid") %></td>
			<td><%=rs.getString("teachername") %></td>
			<td><a href="DeleteTeacher.jsp?tid=<%=rs.getInt("teacherid")%>">Delete</a></td>
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

	String teacherid = request.getParameter("trid");
	String teachername = request.getParameter("tname");
	try
	{
	TeacherModel tmo = new TeacherModel();
	tmo.setTeacherid(Integer.parseInt(teacherid));
	tmo.setTeachername(teachername);
	
	TeacherOpr sop = new TeacherOpr();
	String res = sop.AddNewTeacher(tmo);
	
	if(res.equals("Success"))
	{
			response.sendRedirect("AddTeacher.jsp");
	}
	
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	
		

%>