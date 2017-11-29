<%@page import="java.sql.ResultSet"%>
<%@page import="com.cebs.daos.StateDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<option value="0">Select City</option>
<%
int stateid=Integer.parseInt(request.getParameter("stateid"));
ResultSet rs= StateDAO.listCity(stateid);

while(rs!=null && rs.next())
{
%>
<option value="<%=rs.getInt("id")%>"><%=rs.getString("city_name") %></option>

<%}%>