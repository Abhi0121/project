<%@page import="com.cebs.beans.Items"%>
<%@page import="java.util.ArrayList"%>
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

<%} %>



<br><br><br>

<div class="container">

<div class="col-xs-2"></div>
<div class="col-sm-8">
<div class="row jumbotron " style="margin: 15px; padding:5px 0px;background: none repeat scroll 0 0 #5a88ca; color:white">
<div class="col-sm-4">Item Name</div>
<div class="col-sm-4">Unit</div>
<div class="col-sm-2" >Price</div>
<div class="col-sm-2" >Action</div>
</div>

<%

	int bid=0;//=Integer.parseInt(request.getParameter("bid"));
	String menuid=request.getParameter("menu_id");


if(session!=null && session.getAttribute("cart")!=null)
{
	ArrayList<Items> cart=(ArrayList<Items>)session.getAttribute("cart");	
		for(Items i: cart)
		{
			bid=i.getBranch_id();
		
	%>

				<div class="row jumbotron" style="margin: 1px; background-color; padding: 5px">
					
					<div class="col-sm-4">
						<h4><%=i.getItem_name() %></h4>
					</div>
					<div class="col-sm-4">
						<h4> <%=i.getUnit_name() %></h4>														
					</div>
					<div class="col-sm-2">
						<h4>Rs. <%=i.getItem_price() %></h4>
					</div>
					<div class="col-sm-2">
						<p>							
							<a href="deleteItems.do?id=<%=i.getItem_id() %>"><span class="glyphicon glyphicon-trash"></span></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
		

<div class="row jumbotron" style="margin: 1px; padding:5px" >
<div class="col-sm-8"></div>
<div class="col-sm-2" >
	<h3>Rs. <%=(Double)session.getAttribute("amount") %></h3>
	</div>
<div class="col-sm-2" >
		<form action="checkout.jsp" method="post">	 
		<input type="hidden" name="branch_id" value=<%=bid %>> 
		<input type="submit" class="" style="padding:6px;border-radius:5px"  value="Place Order" />
		</form>
</div>
</div>



<%

}
else
{
	response.sendRedirect("res_menu.jsp?bid="+bid+"&menuid="+menuid);
}

%>
</div>

<%-- 
<div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Your Cart</h2>
                        <div class="product-carousel">
                        <%if(request.getMethod().equalsIgnoreCase("post") && Integer.parseInt(request.getParameter("city"))>0) 
                        {
                        	ResultSet rs =RestaurantDAO.listRestaurants(Integer.parseInt(request.getParameter("city")));
                        	while(rs!=null && rs.next())
                        	{
                        %>
                        
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="Logo.do?source=branch&rid=<%=rs.getInt("id") %>" alt="">
                                    <div class="product-hover">
                                       <!-- <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a> -->
                                        <a href="menu.jsp?bid=<%=rs.getInt("id")%>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="menu.jsp?bid=<%=rs.getInt("id")%>"><%=rs.getString("branch_name") %></a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><%=rs.getString("branch_phone") %></ins> <del><%=rs.getString("branch_website") %></del>
                                </div> 
                            </div>
						<%} }%>
                            
                        </div>
                    	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->


 --%>







<jsp:include page="footer.jsp"/>

