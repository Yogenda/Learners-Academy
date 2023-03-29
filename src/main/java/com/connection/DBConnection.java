package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
	public static Connection GetConnection()
	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/learnacademy", "root", "123456");
		}
		
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		
		return con;
	}
	
	

}
