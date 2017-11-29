package com.cebs.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cebs.beans.Items;
import com.cebs.beans.MailDetails;
import com.cebs.beans.User;
import com.cebs.daos.OrderDAO;


/**
 * Servlet implementation class PlaceOrder
 */
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

//	String fullname= request.getParameter("fullname");
	int branch_id=Integer.parseInt(request.getParameter("branch_id")); 
	String shipping_address=request.getParameter("fullName")+"\n\n"+request.getParameter("address")+"\n"+request.getParameter("landmark")+"\n"+"PIN - "+request.getParameter("pincode")+"\n"+"Mob.- "+request.getParameter("phone");
	String email;
	HttpSession session = request.getSession(false);
	if(session!=null && session.getAttribute("user")!=null)
	{
		email = ((User)session.getAttribute("user")).getEmail();
	}
	else
	{
		email=request.getParameter("email");
	}
	
	
//	MailDetails.setContent((ArrayList<Items>)session.getAttribute("cart"));
	
	
	
	int o_id=OrderDAO.assignOrderId(branch_id, ((User)session.getAttribute("user")).getId(), shipping_address, (Double)session.getAttribute("amount"));
	if((OrderDAO.addInventoryDetails(o_id        , (ArrayList<Items>)session.getAttribute("cart")))>0)
	{
		session.setAttribute("cart", new ArrayList<Items>());
		session.setAttribute("amount", 0.0);
		response.sendRedirect("mail.jsp?oid="+o_id+"&eid="+email);
	}
	
	
	
//	OrderDAO.addOrderDetails(email,shipping_address,(ArrayList<Items>)session.getAttribute("cart"));
	
		
	}

}
