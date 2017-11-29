package com.cebs.daos;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.cebs.beans.User;
import com.cebs.connection.DBConnection;

public class UserDAO 
{	
	static PreparedStatement ps;
	
	public static int addUser(User user)
	{
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(user.getFirstName());
		params.add(user.getLastName());
		params.add(user.getEmail());
		params.add(user.getPhone());
		params.add(user.getPassword());
		ps=DBConnection.getPreparedStatement("insert into user(firstname,lastname,email,phone,password) values(?,?,?,?,?)", params);
		return DBConnection.executeInsert(ps);
	}
	public static boolean deleteUser(int id)
	{
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(id);
		ps=DBConnection.getPreparedStatement("delete from user where id=?",params);
		return DBConnection.executeUpdate(ps);
	}
	public static ResultSet isValid(User user)
	{
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(user.getEmail());
		params.add(user.getPassword());
		ps=DBConnection.getPreparedStatement("select * from user where email=? and password=?",params);
		return DBConnection.executeQuery(ps);
	}
	public static String recoverPass(String email) throws Exception
	{
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(email);

		ps=DBConnection.getPreparedStatement("select password from user where email=?",params);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return rs.getString("password");
		}
		return null;
	}
	
	
}
