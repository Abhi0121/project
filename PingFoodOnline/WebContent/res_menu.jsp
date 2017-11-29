<%@page import="com.cebs.beans.Items"%>
<%@page import="java.util.ArrayList"%>
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
<jsp:include page="headerafterlogin.jsp"/>
<%-- <%@include file="headerafterlogin.jsp" %> --%>

<%}
else
{
%>
<%@include file="headerbeforelogin.jsp" %>

<%} %>

 
    
<%--  
 
     	<div class="row well mainmenu-area" style="padding-left: 25%;">

				<form action="#" method="post">
				    		<div class="col-sm-4">

						<input type="hidden" name="bid" value="<%=request.getParameter("bid")%>">
<!--             			<label class="" >Menu Category <abbr title="required" class="required">*</abbr>
            			</label> -->
            			
            			 <select class="form-control" id="menu_id" name="menu_id" >
            			

						<option value="0">Select Menu</option>
						<%
							ResultSet rs1=MenuDAO.listMenu(Integer.parseInt(request.getParameter("bid")));
							while(rs1.next())
							{
							%>
								<option value="<%=rs1.getInt("ID")%>"><%=rs1.getString("menu_name") %></option>
							<%} %>
						</select>
						</div>
    		<div class="col-sm-4" >

    			<input type="submit" class="" style="padding:6px;border-radius:5px"  value="Get Menu" />
                </div>

				</form>
			</div>
	
  --%>
 
 
 <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Items</h2>
                        <div class="product-carousel">
                        
                        								
				
				
                      <%/* if(session!=null && session.getAttribute("cart")==null)
                        {
            				session.setAttribute("cart", new ArrayList<Items>());
                        }
            			else
            			{

            			} */
                        
     
    					ResultSet rs2=MenuDAO.listMenuItems(Integer.parseInt(request.getParameter("bid")),Integer.parseInt(request.getParameter("menuid")));
                        while(rs2!=null && rs2.next())
                       	{
                        %>
                        
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="Logo.do?source=items&rid=<%=rs2.getInt("id") %>" alt="">
                                    <div class="product-hover">
                                        <a href="addtokart.do?bid=<%=request.getParameter("bid")%>&iid=<%=rs2.getInt("id") %>&in=<%=rs2.getString("item_name")%>&ip=<%=rs2.getString("item_price")%>&un=<%=rs2.getString("unit_name")%>&menuid=<%=request.getParameter("menuid")%>" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a> 
<%--                                         <a href="res_menu.jsp?items=<%=rs2.getInt("id")%>&menuid=0" class="view-details-link"><i class="fa fa-link"></i> See details</a> --%>
                                    </div>
                                </div>
                                
                                <h2><a href="#"><%=rs2.getString("item_name") %></a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins><%=rs2.getString("item_price") %></ins> <del><%=rs2.getString("unit_name")%></del>
                                </div> 
                            </div>
						<%} //}%> 
                            
                        </div>
                    	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
 
 
 
 
 
 
 
 
 
 
        
<jsp:include page="footer.jsp"/>
