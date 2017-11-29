package com.cebs.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class DBConnection 
{
	public static Connection con;
	static
	{
		try
		{
			ResourceBundle bundle=ResourceBundle.getBundle("db");
			Class.forName(bundle.getString("driver"));
			con=DriverManager.getConnection(bundle.getString("url"),bundle.getString("user"),bundle.getString("password"));
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public static Connection getConnection()
	{
		return con;
	}
	public static PreparedStatement getPreparedStatement(String query,ArrayList<Object> params)
	{
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement(query);
			for(int i=0;params!=null&& i<params.size();i++)
			{
				ps.setObject(i+1, params.get(i));
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return ps;
	}
	public static ResultSet executeQuery(PreparedStatement ps)
	{
		try
		{
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	public static int executeInsert(PreparedStatement ps)
	{
		try
		{
			if(ps.executeUpdate()>0)
			{
				ps=con.prepareStatement("select last_insert_id()");
				ResultSet r=ps.executeQuery();
				if(r!=null && r.next())
				{
					return r.getInt(1);
				}
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return 0;
	}
	public static boolean executeUpdate(PreparedStatement ps)
	{
		try
		{
			return ps.executeUpdate()>0;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}
}
