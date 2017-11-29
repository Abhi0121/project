<%@page import="com.cebs.daos.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body> -->

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
<jsp:useBean id="user" class="com.cebs.beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
int id=UserDAO.addUser(user);
if(id>0)
{
%>
<h2 style="color: light-gray"><i>User is Registered!!!</i></h2>
<%-- <jsp:include page="index.jsp"/> --%>
<%} %>
<!-- </body>
</html> -->
<jsp:include page="footer.jsp"/>