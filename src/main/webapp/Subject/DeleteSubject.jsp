<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String subid = request.getParameter("sid");
	
		SubjectOpr sop = new SubjectOpr();
		
		String res = sop.DeleteSubject(Integer.parseInt(subid));
		
		if(res.equals("Success"))
			response.sendRedirect("AddSubject.jsp");
	
%>
	