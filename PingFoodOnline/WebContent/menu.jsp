<%@page import="com.cebs.daos.MenuDAO"%>
<%@page import="com.cebs.daos.RestaurantDAO"%>
<%@page import="com.cebs.daos.StateDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if(session!=null && session.getAttribute("user")!=null)
{
%>
<%@include file="headerafterlogin.jsp" %>
<%}
else
{
%>
<%@include file="headerbeforelogin.jsp" %>

<%} %>

 
    
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Cuisines</h2>
                        <div class="product-carousel">
                        <%if(Integer.parseInt(request.getParameter("bid"))>0) 
                        {
                        	ResultSet rs =MenuDAO.listMenu(Integer.parseInt(request.getParameter("bid")));
                        	while(rs!=null && rs.next())
                        	{
                        %>
                        
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="Logo.do?source=branch&rid=<%=rs.getInt("id") %>" alt="">
                                    <div class="product-hover">
                                       <!-- <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a> -->
                                        <a href="res_menu.jsp?bid=<%=Integer.parseInt(request.getParameter("bid"))%>&menuid=<%=rs.getInt("ID") %>" class="view-details-link"><i class="fa fa-link"></i> See Items</a>
                                    </div>
                                </div>
                                
                                <h2><a href="res_menu.jsp?bid=<%=Integer.parseInt(request.getParameter("bid"))%>&menuid=<%=rs.getInt("ID") %>"><%=rs.getString("menu_name") %></a></h2>
                                
<%--                                 <div class="product-carousel-price">
                                    <ins><%=rs.getString("branch_phone") %></ins> <del><%=rs.getString("branch_website") %></del>
                                </div> --%> 
                            </div>
						<%} }%>
                            
                        </div>
                    	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
   <!--  <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <img src="img/brand1.png" alt="">
                            <img src="img/brand2.png" alt="">
                            <img src="img/brand3.png" alt="">
                            <img src="img/brand4.png" alt="">
                            <img src="img/brand5.png" alt="">
                            <img src="img/brand6.png" alt="">
                            <img src="img/brand1.png" alt="">
                            <img src="img/brand2.png" alt="">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --> <!-- End brands area -->
        
<jsp:include page="footer.jsp"/>
