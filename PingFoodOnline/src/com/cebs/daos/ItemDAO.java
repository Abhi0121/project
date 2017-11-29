package com.cebs.daos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.cebs.connection.DBConnection;
import com.sun.mail.imap.protocol.Item;
public class ItemDAO
{

	static PreparedStatement ps;
	
	public static boolean deleteItems(int id) throws Exception
	{
		
			ArrayList<Object> params=new ArrayList<Object>();
			params.add(id);
			ps=DBConnection.getPreparedStatement("delete from items where id=?", params);
			ps.setInt(1, id);
			return DBConnection.executeUpdate(ps);
		
			
	}
	
	
}