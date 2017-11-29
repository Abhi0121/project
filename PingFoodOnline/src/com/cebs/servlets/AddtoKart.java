package com.cebs.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cebs.beans.Items;

/**
 * Servlet implementation class AddtoKart
 */
public class AddtoKart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int item_id=Integer.parseInt(request.getParameter("iid"));
		String item_name=request.getParameter("in");
		int item_price=Integer.parseInt(request.getParameter("ip"));
		String unit_name=request.getParameter("un");
		int bid=Integer.parseInt(request.getParameter("bid"));
		String menuid=request.getParameter("menuid");
		HttpSession session=request.getSession(false);
		
		
		if(session != null && session.getAttribute("cart")!=null && session.getAttribute("amount")!=null)
		{
			ArrayList<Items> ak= (ArrayList<Items>)session.getAttribute("cart");
			ak.add(new Items(item_id,item_name,item_price,unit_name,bid));
			double total=(Double)session.getAttribute("amount");
			total +=item_price;
			session.setAttribute("amount", total);
			session.setAttribute("cart", ak);
		}

		response.sendRedirect("res_menu.jsp?bid="+bid+"&menuid="+menuid);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
