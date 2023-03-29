<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String studentid = request.getParameter("stid");
	
		StudentOpr cop = new StudentOpr();
		
		String res = cop.DeleteStudent(Integer.parseInt(studentid));
		
		if(res.equals("Success"))
			response.sendRedirect("AddStudent.jsp");
	
%>
	