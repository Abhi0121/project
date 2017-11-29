<%@page import="com.cebs.daos.TrackDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="headerafterlogin.jsp"%>
<br><br><br>
<center>
<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<form action="" method="post">
					 <input type="text" class="form-control" name="id" placeholder="Enter Order Id" autofocus>
		            <br>		           
		            <button class="btn btn-danger" type="submit"><i></i> View Order Status</button>
					<!--  <input type="text" name="id" placeholder="Enter Your Order Number"/><br>
					<input type="submit" value="view"/>-->
				</form>    <hr>


<%

if(request.getMethod().equalsIgnoreCase("post") && request.getParameter("id").trim()!="")
{
	int id=Integer.parseInt(request.getParameter("id"));

	ResultSet res=TrackDAO.orderview(id);
	while(res.next())
	{	
		if(res.getInt("status")==1)
		{
			out.println("<h1>New Order </h1>");			
		}
		else if(res.getInt("status")==2)
		{
			out.println("<h1>New Order is in Process.........</h1>");	
		}
		else if(res.getInt("status")==3)
		{
			out.println("<h1>Your Item has been Delivered</h1>");	
		}
		else 
		{
			out.println("<h1>Cancelled</h1>");	
		}
	}
}
%>


			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</center>
<br><br>
<%@include file="footer.jsp"%>

</html>