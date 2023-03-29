<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.operator.*" %>    
<%@ page import = "com.model.*" %>  
<%@ page import = "java.sql.*" %>  



<%    	String klass_subjectid = request.getParameter("csid");
	
		ClassOpr cop = new ClassOpr();
		
		String res = cop.DeleteAssignSubject(Integer.parseInt(klass_subjectid));
		
		if(res.equals("Success"))
			response.sendRedirect("AssignSubject.jsp");
	
%>
	