<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import	= "com.operator.*" %>
<%@ page import	= "com.model.*" %>
<%@ page import	= "java.sql.*" %>


<% 
String klass_teacherid = request.getParameter("ctid");
String teacherid = request.getParameter("ddlteacher");
String klassids = request.getParameter("ddlclass");
String subid = request.getParameter("ddlsubject");

ClassTeacher tr = new ClassTeacher();
tr.setKlass_teacherid(Integer.parseInt(klass_teacherid));
tr.setTeacherid(Integer.parseInt(teacherid));
tr.setKlassids(Integer.parseInt(klassids));
tr.setSubjectid(Integer.parseInt(subid));

TeacherOpr top = new TeacherOpr();
String res = top.AssignClass(tr);

if(res.equals("Success"))
	response.sendRedirect("AssignClass.jsp");


%>
