package com.cebs.daos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




import com.cebs.connection.DBConnection;


public class TrackDAO
{
		static PreparedStatement ps;
		
		public static ResultSet order(int id )
		{
			try
			{
				ArrayList<Object>params=new ArrayList<Object>();
				params.add(id);
				ps=DBConnection.getPreparedStatement("select * from orders where id=?",params);			
				return DBConnection.executeQuery(ps);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return null;
		}
		
		public static ResultSet orderview(int id)
		{
			try
			{
				ArrayList<Object> params=new ArrayList<Object>();
				params.add(id);
				ps=DBConnection.getPreparedStatement("select * from orders where id=?",params);
				return DBConnection.executeQuery(ps);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return null;
		}
	
		public static boolean updateStatus(int id,int status)throws Exception
		{
			//CallableStatement ps=DBConnection.getConnection().prepareCall("call sp_del_users(?)");
			ArrayList<Object>params=new ArrayList<Object>();
			params.add(id,status);
			ps=DBConnection.getPreparedStatement("update orders set status=? where id=?",params);
			ps.setInt(1, status);
			ps.setInt(2, id);		
			return DBConnection.executeUpdate(ps);
		}
		
	
		public static boolean updateStatus(int id)throws Exception
		{
			//CallableStatement ps=DBConnection.getConnection().prepareCall("call sp_del_users(?)");
			ArrayList<Object>params=new ArrayList<Object>();
			params.add(id);
			ps=DBConnection.getPreparedStatement("update orders set  where id=?",params);
			ps.setInt(1, id);		
			return DBConnection.executeUpdate(ps);
		}
		
}