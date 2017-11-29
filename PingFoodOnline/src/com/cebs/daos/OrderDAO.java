package com.cebs.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.cebs.beans.Items;
import com.cebs.connection.DBConnection;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

public class OrderDAO 
{
	static PreparedStatement ps;
	
/*	//private static int orderid = 1100;
	public static int getOrderid() 
	{
		orderid++;
		return orderid;
	}


	public static void setOrderid(int orderid) {
		OrderDAO.orderid = orderid;
	}
*/
	
	public  static int assignOrderId(int branch_id,int user_id,String shipping_address,double total)
	{
		int status=1;
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(branch_id);
		params.add(user_id);
		params.add(shipping_address);
		params.add(total);
		params.add(status);
		ps=DBConnection.getPreparedStatement("insert into orders(branch_id,user_id,shipping_address,total,status) values(?,?,?,?,?)", params);
		return DBConnection.executeInsert(ps);
		
	}
	
	
	
	public static int addInventoryDetails(int order_id,ArrayList<Items> items)
	{
		
		int qty=1,status=1;
		
		try {
//			Connection con=DBConnection.getConnection();
//			con.setAutoCommit(false);
			for(Items i: items)
			{
				ArrayList<Object> params=new ArrayList<Object>();
				params.add(order_id);
				params.add(i.getItem_id());
				params.add(qty);
				params.add(i.getItem_price());
				params.add(status);
				ps=DBConnection.getPreparedStatement("insert into inventory(orderid,itemid,qty,total,status) values(?,?,?,?,?)", params);
				DBConnection.executeInsert(ps);
			}
//			con.commit();
//			con.close();
			return 1;
		}
		catch (Exception e) 
		{
			
			e.printStackTrace();
			return 0;
			
		}
	}
	
	
	
}

