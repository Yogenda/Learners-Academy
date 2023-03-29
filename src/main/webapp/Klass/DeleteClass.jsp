<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String klassid = request.getParameter("kid");
	
		ClassOpr cop = new ClassOpr();
		
		String res = cop.DeleteClass(Integer.parseInt(klassid));
		
		if(res.equals("Success"))
			response.sendRedirect("AddKlass.jsp");
	
%>
	