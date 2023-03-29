package com.operator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connection.DBConnection;
import com.model.*;

public class SubjectOpr 
{
	private Connection con;
	private PreparedStatement ps;
	public SubjectOpr()
	{
		con=DBConnection.GetConnection();
	}

	public String AddNewSubject(SubjectModel smo)
	{
		String chk="Err";
		try
		{
			ps=con.prepareStatement("insert into sub(subid,subname) values(?,?)");
			ps.setInt(1, smo.getSubid());
			ps.setString(2, smo.getSubname());
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
	
	public ResultSet ShowAllSubject()
	{
		ResultSet rs = null;
		try 
		{
			ps=con.prepareStatement("select * from sub");
			rs = ps.executeQuery();
			
		}
		catch(Exception ex)
		{
			rs = null;
		}
		
		return rs;
	}
	
	public String DeleteSubject(int subid)
	{
		String chk = "Err";
		try
		{
			ps=con.prepareStatement("delete from sub where subid=?");
			ps.setInt(1, subid);
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
