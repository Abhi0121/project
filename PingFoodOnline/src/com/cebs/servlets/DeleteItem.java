package com.cebs.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cebs.beans.Items;
import com.cebs.daos.ItemDAO;

/**
 * Servlet implementation class DeleteItem
 */
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			HttpSession session=request.getSession(false);
			int id=Integer.parseInt(request.getParameter("id"));
			ArrayList<Items> cart=(ArrayList<Items>)session.getAttribute("cart");	
			Iterator<Items> itr=cart.iterator();
			while(itr.hasNext())
			{
				Items i=itr.next();
				
				if(i.getItem_id()==id)
				{
					double remaining=(Double)session.getAttribute("amount")-i.getTotal();
					System.out.println(remaining);
					session.setAttribute("amount", remaining);
					itr.remove();
					break;
				}
			}
			response.sendRedirect("cart.jsp");
		
		}
		catch(Exception e)
		{
				e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
