package com.cebs.daos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.cebs.connection.DBConnection;

public class StateDAO 
{
	static PreparedStatement ps;
	public static ResultSet listState()
	{		
		ps=DBConnection.getPreparedStatement("select * from state",null);
		return DBConnection.executeQuery(ps);
	}
	public static ResultSet listCity(int stateid)
	{		
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(stateid);
		ps=DBConnection.getPreparedStatement("select * from city where city_state=?",params);
		return DBConnection.executeQuery(ps);
	}
}
