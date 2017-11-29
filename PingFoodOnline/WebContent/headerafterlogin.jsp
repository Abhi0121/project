<%@page import="com.cebs.beans.Items"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.cebs.daos.StateDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cebs.beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ping Food</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link href="css/login.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function()
  		{  			
  			
  			$("#state").change(function()
  			{
  				var id=$("select#state").val();
  				$.get("city.jsp",{stateid:id},function(response)
  				{  					
  						$("select#city").html(response);
  				})	;	
  			});
  			
  		});  	  
  	</script>
  	<style type="text/css">
  	.diffuse-light {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  border: none;
  font: normal 75px/normal "Arizonia", Helvetica, sans-serif;
  color: rgba(183, 51, 51,1);
  text-align: center;
  -o-text-overflow: clip;
  text-overflow: clip;
  text-shadow: 0 15px 29px rgba(0,0,0,0.0980392) , 10px 20px 5px rgba(0,0,0,0.0470588) , -10px 20px 5px rgba(0,0,0,0.0470588) ;
  -webkit-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1) 10ms;
  -moz-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1) 10ms;
  -o-transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1) 10ms;
  transition: all 200ms cubic-bezier(0.42, 0, 0.58, 1) 10ms;
}

.diffuse-light:hover {
  text-shadow: 0 -15px 29px rgba(0,0,0,0.0980392) , 10px -20px 5px rgba(0,0,0,0.0470588) , -10px -20px 5px rgba(0,0,0,0.0470588) ;
}
  	
  	</style>
  </head>
  <body>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li><a href="myProfile.jsp"><i class="fa fa-user"></i> My Account</a></li>
                            <li><a href="track.jsp"><i class="fa fa-user"></i>Tracking</a></li>
                            <li><a href="#"><i class="fa fa-user"></i> My Order</a></li>
                            <li><a href="cart.jsp"><i  class="fa fa-shopping-cart"></i> My Cart</a></li>
                            
                            <li><a href="cart.jsp"><i class="glyphicon glyphicon-check"></i> Checkout</a></li>
                            
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                    	<ul class="user-menu">
                    	<li>Welcome <%=((User)session.getAttribute("user")).getFirstName() %>, 
                        <li><a href="logout.jsp"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo">
                        <h1><a href="./"><img height="176" width="64" src="img/PingFood.png"></a></h1>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="logo">
                        <h1 class="diffuse-light">Deliciousness at its Best!!!</h1>
                    </div>
                </div>
                <%
                int count=0;
                double amount=0;
                if(session.getAttribute("cart")!=null && session.getAttribute("amount")!=null)
                {
                	count=((ArrayList<Items>)session.getAttribute("cart")).size();
                	amount= (Double)(session.getAttribute("amount"));
                }
                else
                {
                	session.setAttribute("cart", new ArrayList<Items>());
                	session.setAttribute("amount", 0.0);
                }
                %>
                <div class="col-sm-3">
                    <div class="shopping-item">
                        <a href="cart.jsp">Cart - <span class="cart-amunt">Rs.<%=amount %></span> <i class="fa fa-shopping-cart"></i> <span class="product-count"><%=count %></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    	<div class="row mainmenu-area" style="padding-left: 25%;margin: 0px">
    	
    	 <form action="index.jsp" class="" method="post">
    		<div class="col-sm-4">
    			<select class="form-control" id="state" name="state" >
    				<option value="0">Select State</option>
    				<%
    					ResultSet rs=StateDAO.listState();
    					while(rs!=null && rs.next())
    					{
    				%>
    				
    				<option value='<%=rs.getInt("id")%>' <%=rs.getInt("id")==1%>><%=rs.getString("state_name") %></option>
    				
    				<%} %>
    				
    			</select>
    		</div>
    		<div class="col-sm-4">
    			<select class="form-control" id="city" name="city">
		   			<option value="0">Select City</option>
    			</select>
    		</div>
    		<div class="col-sm-4" >
    			<input type="submit" class="btn-block" style="padding:6px;border-radius:5px"  value="Search" />
    		</div>
    		 </form>
    	</div>
    