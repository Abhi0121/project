
<%@page import="com.cebs.daos.RestaurantDAO"%>
<%@page import="com.cebs.daos.StateDAO"%>
<%@page import="java.sql.ResultSet"%>
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


 <br><br><br><br>

 <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-2">
                     </div>
                
               
            <div class="col-xs-8">
               <div class="panel panel-info">
                        <div class="panel-heading">
                            Forget Password
                        </div>
                        <div class="panel-body">
                           <form  method="post" action="ForgotPassword.do">
                          
                                 	 <h5>Enter your e-mail address below to reset your password.</h5>
                                       <br />
                                     <div class="form-group input-group">
                                     <input type="text" class="email" size="80" placeholder="Enter your E-mail " name="email" />
                                      </div>
                                 
                                     
                                     <div class="form-group">
                               		 <button type="submit" class="btn btn-success">Submit</button>
                           			 </div>
                            </form>
                                   
                            </div>
                        </div>
                     </div>

            <div class="col-xs-2"></div>
         	   </div>
        
        </div>
  
    </div>
    
    </div>
   <jsp:include page="footer.jsp"/>