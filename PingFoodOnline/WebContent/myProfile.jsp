<%@page import="com.cebs.daos.UserDAO"%>
<%@page import="com.cebs.beans.User"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> 
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

<div id="wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12"><br><br><br>
                        <h1 class="page-head-line"></h1>
                       <!--  <h1 class="page-subhead-line">This is dummy text , you can replace it with your original text. </h1> -->

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-5 col-sm-4 col-xs-12">
               <div class="panel panel-info">
                        <div class="panel-heading" style="background-color:teal;">
                           <h2 style="color: white"><i>My Details is:</i></h2>
                        </div>
                        <div class="panel-body">
                        

 
                           <form  method="post" action="">
                           <div class="form-group">
                                        
			                       
                                        </div>
                          
                                         <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" type="text" name="firstname" value="${sessionScope.user.firstName}" readonly>
                                      
                                        
                                        </div>
                                            
                                 <div class="form-group">
                                            <label>Lastname</label>
                                            <input class="form-control" type="text" name="lastname" value="${sessionScope.user.lastName}" readonly>
                                     
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input class="form-control" type="phone" name="phone" value="${sessionScope.user.phone}" readonly>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label>E-mail</label>
                                            <input class="form-control" type="email" name="email" value="${sessionScope.user.email}" readonly>
                                            
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" type="password" name="password" value="${sessionScope.user.password}" disabled="disabled">
                                            
                                        </div>
                                     
                                      <div class="form-group">
                                      <input class="form-control" type="submit" value="save" name="save" style="background-color:teal;">
                                 
                                      </div> 
                                        
                                            
                                  
                                 
                                    </form>
                            </div>
                        
	
	
	
	
	

</div>
            </div>
							      
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>

<jsp:include page="footer.jsp"/>

</body>
</html>