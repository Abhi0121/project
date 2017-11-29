<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
if(session!=null && session.getAttribute("user")!=null)
{
%>
<%-- <jsp:include page="headerafterlogin.jsp"/> --%>
<%@include file="headerafterlogin.jsp" %>
<%}
else
{
%>
<%@include file="headerbeforelogin.jsp" %>
<%} 
String order_id=request.getParameter("oid");

%>


<br><br>
<div class="container">
<div class="col-xs-4"></div>
<div class="col-xs-4 well">
<center>
<h2>Order Placed</h2>

<br>
<h3>Your order id is <i><%=order_id %></i></h3><br><br>
<h4>Thank You !</h4>


				<form action="index.jsp" method="get">
			<input type="submit" style="padding:6px;border-radius:5px" name="home"  class="" value="Go to Home">
				  </form>   
			</center>
			</div>
<div class="col-xs-4"></div>
</div>
    <jsp:include page="footer.jsp"/>