<%@page import="com.cebs.daos.StateDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  
  <script>
function validateform(){
	var firstname=document.reg.firstname.value;
	var lastname=document.reg.lastname.value;
	var phone=document.reg.phone.value;
	var email=document.reg.email.value;
	var password=document.reg.password.value;
	
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (firstname==null || name==""){
		  alert("First Name can't be blank");
		  return false;
		}
		else if (lastname==null || name=="")
		{
			  alert("Last Name can't be blank");
			  return false;
		}
		else if(phone.length<10)
		{
			  alert("Password must be at least 10 characters long.");
			  return false;
		}
		else if(!re.test(email))
		{
			alert("Enter valid email");
		    return false;
		}
		else if(password.length<6)
		{
			  alert("Password must be at least 6 characters long.");
			  return false;
     	  }
		
		
	
}



</script>
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
  <body >
   
    <!-- <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>                           
                            <li><a href="#"><i class="fa fa-user"></i> Sign In</a></li>
                            <li><a href="#"><i class="fa fa-user"></i> Sign Up</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="header-right">
                        
                    </div>
                </div>
            </div>
        </div>
    </div> -->
     <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo">
                        <h1><a href="./"><img class="" height="176" width="64" src="img/PingFood.png"></a></h1>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="logo">
                        <h1 class="diffuse-light">Deliciousness at its Best!!!</h1>
                    </div>
                </div>
                 <div class="col-sm-3">
                    <div class="user-menu" style="float: right;">
                        <ul>                           
                            <li><a href="#" data-toggle="modal" class="dropdown-toggle" data-target="#login-modal"><i class="fa fa-user"></i> Sign In</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#register-modal"><i class="fa fa-user"></i> Sign Up</a></li>
                        </ul>
                    </div>
                </div>
                
                <!-- <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="cart.html">Cart - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                    </div>
                </div> -->
                
            </div>
                       
        </div>
        
    </div>
    
    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
				  <form action="login.jsp" method="post"  >
					<input type="text" name="email" placeholder="Email">
					<input type="password" name="password" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
					
				  <div class="login-help">					
					
					<a href="forgotPassword.jsp">Forgot Password</a>
				  </div>
				</div>
			</div>
			</div>
			
		<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
	
				<div class="loginmodal-container">
					<h1>Sign Up</h1><br>
				  <form action="register.jsp" method="post" onsubmit="validateform()">
				  <input type="text" name="firstName"  placeholder="First Name" required="required" maxlength="20" >
				  <input type="text" name="lastName"  placeholder="Last Name" required="required" maxlength="10">
				  <input type="text" name="phone"   placeholder="Phone" required="required"  title=" number must be 10 digit"pattern="[0-9]{10}">
					<input type="text" name="email" placeholder="Email" required="required" title="please enter in email format" >
					
					
					<input type="password" name="password"  placeholder="Password" required="required" title="password atleast 6 character" >
					<input type="submit" name="login" class="login loginmodal-submit" value="Register">
				  </form>				 
				</div>
			</div>
			</div>
    
    
   	<div class="row well  mainmenu-area" style="padding-left: 25%;margin: 0px">
    	
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
    				<%  
    					} 
    				%>    				
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