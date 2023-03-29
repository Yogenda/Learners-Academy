package com.operator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DBConnection;
import com.model.*;

public class TeacherOpr {
	private Connection con;
	private PreparedStatement ps;
	public TeacherOpr()
	{
		con=DBConnection.GetConnection();
	}

	public String AddNewTeacher(TeacherModel tmo)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("insert into teacher(teacherid,teachername) values(?,?)");
			ps.setInt(1, tmo.getTeacherid());
			ps.setString(2, tmo.getTeachername());
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
	
	
	public String AssignClass(ClassTeacher ctas)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("insert into klass_teacher(klass_teacherid,teacherid,klassids,subjectid) values (?,?,?,?)");
			ps.setInt(1, ctas.getKlass_teacherid());
			ps.setInt(2, ctas.getTeacherid());
			ps.setInt(3, ctas.getKlassids());
			ps.setInt(4, ctas.getSubjectid());
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
	
	
	public ResultSet ShowAllTeacher()
	{
		ResultSet rs = null;
		try
		{
		 ps=con.prepareStatement("select * from teacher");
		 rs=ps.executeQuery();
		}
		catch(Exception ex)
		{
			rs = null;
		}
		return rs;
	}
	
	public ResultSet ShowClassTeacher()
	{
		ResultSet rs = null;
		try
		{
		 ps = con.prepareStatement("select * from klass_teacher");
		 rs = ps.executeQuery();
		}
		catch(Exception ex)
		{
			rs = null;
		}
		return rs;
	}
	
	
	public String DeleteTeacher(int tid)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("delete from teacher where teacherid=?");
			ps.setInt(1, tid);
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
	
	public String DeleteClassTeacher(int ctid)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("delete from klass_teacher where klass_teacherid=?");
			ps.setInt(1, ctid);
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
