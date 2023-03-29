package com.operator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DBConnection;
import com.model.StudentModel;

public class StudentOpr {
	private Connection con;
	private PreparedStatement ps;
	public StudentOpr()
	{
		con=DBConnection.GetConnection();
	}
	
	
	public String AddNewStudent(StudentModel stmo)
	{
			String chk="Err";
			try 
			{
				ps=con.prepareStatement("insert into student (studentid,studentname,klassids) values (?,?,?)");
				ps.setInt(1, stmo.getStudentid());
				ps.setString(2, stmo.getStudentname());
				ps.setInt(3, stmo.getKlassids());
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
		
		
		public ResultSet ShowAllStudent()
		{
			ResultSet rs = null;
			try
			{
				ps = con.prepareStatement("select * from student");
				rs = ps.executeQuery();
			}
			catch(Exception ex)
			{
				rs = null;
			}
			
			return rs;
		}
		
		

		public String DeleteStudent(int stid)
		{
			String chk = "Err";
			try
			{
				ps=con.prepareStatement("delete from student where studentid=?");
				ps.setInt(1, stid);
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



