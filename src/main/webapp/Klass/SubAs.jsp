<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import	= "com.operator.*" %>
<%@ page import	= "com.model.*" %>
<%@ page import	= "java.sql.*" %>


<% 
String klass_subjectid = request.getParameter("ksid");
String subjectid = request.getParameter("ddlsubject");
String klassids = request.getParameter("ddlklass");

ClassSubjectModel tr = new ClassSubjectModel();
tr.setKlass_subjectid(Integer.parseInt(klass_subjectid));
tr.setSubjectid(Integer.parseInt(subjectid));
tr.setKlassids(Integer.parseInt(klassids));

ClassOpr cop = new ClassOpr();
String res = cop.AssignSubject(tr);

if(res.equals("Success"))
	response.sendRedirect("AssignSubject.jsp");


%>
