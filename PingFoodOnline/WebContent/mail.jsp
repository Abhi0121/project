<%@page import="com.cebs.beans.Items"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cebs.connection.EmailUtility"%>
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

String o_id=request.getParameter("oid");
String to=request.getParameter("eid");
//ArrayList<Items> al=(ArrayList<Items>)session.getAttribute("cart");



String host=application.getInitParameter("host");
String port=application.getInitParameter("port");
String user=application.getInitParameter("user");
String pass=application.getInitParameter("pass");


String sub= "Order Placed";
String msg="<b>Thank You for placing order with us</b><br>Your Order id is <h4>"+o_id+"</h4><br><br>It will be delivered to you shortly.<br><br>";

EmailUtility.sendEmail(host, port, user, pass, to, sub, msg);

response.sendRedirect("successpage.jsp?oid="+o_id);

%>

<form action="#" method=post>


</form>

</body>
</html>


