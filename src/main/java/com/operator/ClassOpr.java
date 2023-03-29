package com.operator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DBConnection;
import com.model.ClassModel;
import com.model.ClassSubjectModel;

public class ClassOpr {

	private Connection con;
	private PreparedStatement ps;
	public ClassOpr()
	{
		con=DBConnection.GetConnection();
	}
	
	
	public String AddNewClass(ClassModel cmo)

	{
		String chk="Err";
		try 
		{
			ps=con.prepareStatement("insert into klass (klassid,klassname) values (?,?)");
			ps.setInt(1, cmo.getKlassid());
			ps.setString(2, cmo.getKlassname());
			int res = ps.executeUpdate();
			
			if(res>=1)
			{
				chk = "Success";
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		
		return chk;
	}
	
	public String AssignSubject(ClassSubjectModel csmo)

	{
		String chk="Err";
		try 
		{
			ps=con.prepareStatement("insert into klass_subject (klass_subjectid,subjectid,klassids) values (?,?,?)");
			ps.setInt(1, csmo.getKlass_subjectid());
			ps.setInt(2, csmo.getSubjectid());
			ps.setInt(3, csmo.getKlassids());
			int res = ps.executeUpdate();
			
			if(res>=1)
			{
				chk="Success";
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		
		return chk;
	}
	
	public ResultSet ShowAllClass()
	{
		ResultSet rs = null;
		try
		{
			ps = con.prepareStatement("select * from klass");
			rs = ps.executeQuery();
		}
		catch(Exception ex)
		{
			rs = null;
		}
		
		return rs;
	}
	
	
	public ResultSet ShowAllClassSubject()
	{
		ResultSet rs1 = null;
		try
		{
		ps = con.prepareStatement("select * from klass_subject");
		rs1 = ps.executeQuery();
		}
		catch(Exception ex)
		{
			rs1 =  null;
		}
		return rs1;
	}

	public ResultSet ShowClassReport()
	{
		ResultSet rcrp = null;
		try
		{
			ps = con.prepareStatement("SELECT klass.klassname , sub.subname, teacher.teachername, student.studentname FROM klass JOIN klass_subject ON klass.klassid = klass_subject.klassids JOIN sub ON klass_subject.subjectid = sub.subid JOIN klass_teacher ON klass.klassid = klass_teacher.klassids AND klass_subject.subjectid = klass_teacher.subjectid JOIN teacher ON klass_teacher.teacherid = teacher.teacherid JOIN student ON klass.klassid = student.klassids ORDER BY klass.klassname ");
			rcrp = ps.executeQuery();
		}
		catch(Exception ex)
		{
			rcrp = null;
		}
		
		return rcrp;
	}
	
	
	public String DeleteAssignSubject(int asid)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("delete from klass_subject where klass_subjectid=?");
			ps.setInt(1, asid);
			int res = ps.executeUpdate();
			
			if (res>=1)
			{
				chk="Success";
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return chk;
	}
	
	public String DeleteClass(int kid)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("delete from klass where klassid=?");
			ps.setInt(1, kid);
			int res = ps.executeUpdate();
			
			if (res>=1)
			{
				chk="Success";
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return chk;
	}
}
