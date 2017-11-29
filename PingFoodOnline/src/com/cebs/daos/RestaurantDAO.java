package com.cebs.daos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import com.cebs.connection.DBConnection;

public class RestaurantDAO 
{
	static PreparedStatement ps;
	public static ResultSet listRestaurants(int cityid)
	{
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(cityid);		
		ps=DBConnection.getPreparedStatement("SELECT b.branch_name,b.branch_email,b.branch_phone,b.branch_website,b.id from branch b join address a on b.id=a.address_branch where a.address_city=?",params);
		return DBConnection.executeQuery(ps);
	}
	public static ResultSet getLogo(String source,int id)
	{
		try
		{
			ArrayList<Object> params=new ArrayList<Object>();			
			params.add(id);
			ps=DBConnection.getPreparedStatement("select logo from "+source+" where id=?",params);
			ps.setInt(1, id);
			return ps.executeQuery();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
}
