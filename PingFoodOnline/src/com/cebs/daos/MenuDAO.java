package com.cebs.daos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.cebs.connection.DBConnection;

public class MenuDAO 
{
	static PreparedStatement ps;
	
	
	public static ResultSet listMenus(int menu_id)
	{
		try
		{
			ArrayList<Object> params=new ArrayList<Object>();
			params.add(menu_id);
			ps=DBConnection.getPreparedStatement("select * from menu where id=?", params);
			return DBConnection.executeQuery(ps);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	
	
	public static ResultSet listMenu(int menu_branch)
	{
		try
		{
			ArrayList<Object> params=new ArrayList<Object>();
			params.add(menu_branch);
			ps=DBConnection.getPreparedStatement("select * from menu where menu_branch=?", params);
			return DBConnection.executeQuery(ps);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	
	
	public static ResultSet listMenuItems(int bid,int mid)
	{
		try
		{
			ArrayList<Object> params=new ArrayList<Object>();
			params.add(bid);
			params.add(mid);
			ps=DBConnection.getPreparedStatement("select i.id,i.item_name,i.item_description,i.item_price,i.item_unit,i.item_delivery_type,i.logo,m.menu_name,u.unit_name from unit u join items i on u.id=i.item_unit join menu m on i.item_category=m.id join branch b on m.menu_branch=b.id where b.id=? and m.id=?", params);
			return DBConnection.executeQuery(ps);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}


}
