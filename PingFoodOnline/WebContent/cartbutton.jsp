<%@page import="com.cebs.beans.Items"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    
    
        
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img height="176" width="64" src="img/PingFood.png"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
                    <%if(session!=null && session.getAttribute("cart")==null)
                    {
        				session.setAttribute("cart", new ArrayList<Items>());
                    %>
                    
                    	<a href="cart.jsp">Cart - <span class="cart-amunt">Rs.0</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">0</span></a>
                  <%} 
                    else
                    {
                    	double total=0;
                    	ArrayList<Items> cart=(ArrayList<Items>)session.getAttribute("cart");
						for(Items i : cart)
						{
/* 							i.setTotal(i.getItem_price());
							total=i.getTotal();
 */							total+=i.getItem_price();
 						}
						
                    
                    %>
                    
                   		<a href="cart.jsp">Cart - <span class="cart-amunt">Rs.<%=total %></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=((ArrayList<Items>)session.getAttribute("cart")).size() %></span></a>
                    
                  <%} %>
                    </div>
                </div>
                
            </div>
        </div>
    </div> 
    
    
    