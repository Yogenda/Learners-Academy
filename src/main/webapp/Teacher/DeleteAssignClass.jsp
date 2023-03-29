<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String klass_teacherid = request.getParameter("ctid");
	
		TeacherOpr top = new TeacherOpr();
		
		String res = top.DeleteClassTeacher(Integer.parseInt(klass_teacherid));
		
		if(res.equals("Success"))
			response.sendRedirect("AssignClass.jsp");
	
%>
	