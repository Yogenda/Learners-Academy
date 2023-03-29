<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String teacherid = request.getParameter("tid");
	
		TeacherOpr top = new TeacherOpr();
		
		String res = top.DeleteTeacher(Integer.parseInt(teacherid));
		
		if(res.equals("Success"))
			response.sendRedirect("AddTeacher.jsp");
	
%>
	