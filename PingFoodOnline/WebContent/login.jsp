<%@page import="java.sql.ResultSet"%>
<%@page import="com.cebs.daos.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="com.cebs.beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
ResultSet rs= UserDAO.isValid(user);
if(rs!=null && rs.next())
{
user.setId(rs.getInt("id"));
user.setFirstName(rs.getString("firstname"));
user.setLastName(rs.getString("lastname"));
user.setPhone(rs.getString("phone"));
session.setAttribute("user", user);
response.sendRedirect("index.jsp");
}
%>
</body>
</html>