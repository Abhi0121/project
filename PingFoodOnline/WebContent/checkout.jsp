
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


String branch_id=request.getParameter("branch_id");
%>
				<br><br><br>
				<div class="conatiner">
				<div class="col-xs-2"></div>
				<div class="col-xs-8 well">
				<center>
				<form action="placeorder.js" method="post">
				
<%-- 				<%double total=Double.parseDouble(request.getParameter("total")); %> --%>
<%-- 				<h4>Total Amount = <%=total %> Rs</h4> --%>
				
				
				<h2 style="color:#A1A1A1"><i>Add Your Address</i></h2>
				<input type="hidden" name="branch_id" value=<%=branch_id %>>
 				  <input type="text" name="fullName" placeholder="Full Name" size="70" required title="enter your full name"><br><br>
 				  <%if(session!=null && session.getAttribute("user")==null)
					  {%>
					<input type="text" name="email" placeholder="Email" size="70" required title="enter your email id"><br><br>
					<%} %>
 				  
				  <input type="text" name="address" placeholder="Address" size="70" required title="enter your address"><br><br>
				 
				 
				 
				  <input type="text" name="landmark" placeholder="Landmark" size="70" ><br><br>
				  <input type="text" name="pincode" placeholder="Pincode" maxlength="6" size="70" required title="enter pincode" "><br><br>
				  <input type="text" name="phone" placeholder="Phone" maxlength="10" size="70" required title="enter valid phone no"><br><br>
<%-- 				  <input type="hidden" name="total" value=<%=total %>> --%>
					    <label class="radio-inline">
   						   <input type="radio" name="optradio">Cash on delivery
    					</label>
   					 <label class="radio-inline">
      					<input type="radio" name="optradio" disabled>Internet banking
    				</label>
    
    				</label>
   					 <br><br>
					
					
					<input type="submit" style="padding:6px;border-radius:5px" name="pay"  class="btn-danger" value="Proceed to Pay">
					</center>
				  </form>   
				</div>
				<div class="col-xs-2"></div>
  <%
  
  
//double total=Double.parseDouble(request.getParameter("total"));  
  
/* 	ArrayList<Items> cart=(ArrayList<Items>)session.getAttribute("cart");
	for(Items i : cart)
	{
						total+=i.getItem_price();
	} */

  
  %>  
    
    
    
    
    <%--    
    
        	<div class="row well mainmenu-area" style="padding-left: 25%;">
    	
    	 <form action="index.jsp" class="" method="post">
    		<div class="col-sm-4">
    			<select class="form-control" id="state" name="state" >
    				<option value="0">Select State</option>
    				<%
    					ResultSet rs=StateDAO.listState();
    					while(rs!=null && rs.next())
    					{
    				%>
    				
    				<option value='<%=rs.getInt("id")%>'><%=rs.getString("state_name") %></option>
    				
    				<%} %>
    				
    			</select>
    		</div>
    		<div class="col-sm-4">
    			<select class="form-control" id="city" name="city">
		   			<option>Select City</option>
    			</select>
    		</div>
    		<div class="col-sm-4" >
    			<input type="submit" class="" style="padding:6px;border-radius:5px"  value="Search" />
    		</div>
    		 </form>
    	</div> --%>
    	
    	
    	<jsp:include page="footer.jsp"/>
    	
    	