package com.cebs.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cebs.beans.Items;
import com.cebs.beans.User;
import com.cebs.connection.EmailUtility;
import com.cebs.daos.OrderDAO;
import com.cebs.daos.UserDAO;

/**
 * Servlet implementation class ForgotPassword
 */
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
				
			String email=request.getParameter("email");

			//ArrayList<Items> al=(ArrayList<Items>)session.getAttribute("cart");



			String host=getServletContext().getInitParameter("host");
			String port=getServletContext().getInitParameter("port");
			String user=getServletContext().getInitParameter("user");
			String pass=getServletContext().getInitParameter("pass");

			try
			{
			String userPassword=UserDAO.recoverPass(email);
			String sub= "<b>PASSWORD RECOVERY</b>";
			String msg="<b>your password is <h4>"+userPassword+"</h4><br><br><br>Enter these password to login again<br><br><h2>Thank you </h2>";
			

			EmailUtility.sendEmail(host, port, user, pass, email, sub, msg);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
			
				
			
		}
		
		 
		public void service(ServletRequest request, ServletResponse response)throws ServletException, IOException 
		{	
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
						out.println("<br><br><center><h1><b>your password is sent to your E-mail address</b></h1><br><br>");
			
		}



	}


