  <%@page import="com.cebs.daos.RestaurantDAO"%>
<%@page import="java.sql.ResultSet"%>

<div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Restaurants</h2>
                        <div class="product-carousel">
                        <%if(request.getMethod().equalsIgnoreCase("post") && Integer.parseInt(request.getParameter("city"))>0) 
                        {
                        	ResultSet rs =RestaurantDAO.listRestaurants(Integer.parseInt(request.getParameter("city")));
                        	while(rs!=null && rs.next())
                        	{
                        %>
                        
                            <div class="single-product" >
                                <div class="product-f-image" style="height: inherit;" >
                                    <img src="Logo.do?source=branch&rid=<%=rs.getInt("id") %>" alt="" >
                                    <div class="product-hover">
                                       <!-- <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a> -->
                                        <a href="menu.jsp?bid=<%=rs.getInt("id")%>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="menu.jsp?bid=<%=rs.getInt("id")%>"><%=rs.getString("branch_name") %></a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><%=rs.getString("branch_website") %></ins>
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
