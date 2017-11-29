<%@page import="com.cebs.daos.TrackDAO"%>
<%@page import="com.cebs.daos.OrderDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RestroKart</title>
<link href="css/bootstrap.css" rel="stylesheet"/>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script>	
 
      function init_map() {
		var var_location = new google.maps.LatLng(45.430817,12.331516);
 
        var var_mapoptions = {
          center: var_location,
          zoom: 14
        };
 
		var var_marker = new google.maps.Marker({
			position: var_location,
			map: var_map,
			title:"Venice"});
 
        var var_map = new google.maps.Map(document.getElementById("map-container"),
            var_mapoptions);
 
		var_marker.setMap(var_map);	
 
      }
 
      google.maps.event.addDomListener(window, 'load', init_map);
 
    </script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#address_state").change(function(){
		var sid=$("select#address_state").val();
		$.get("citylist.jsp",{address_state:sid},function(response){
			$("select#address_city").html(response);
		});
	});
	
});



</script>
<style type="text/css">
	.my
	{
		width:100%;
		height: 30px;
	}	
	.my1
	{
		width:100%;
		
	}	
	 
table, th, td {  
    border: 1px solid red;  
    border-collapse: collapse;  
}  
table,th, td {  
    padding: 15px;  
}  
body {  
background-image: url("img/.jpg");  
margin-left:100px;  
}  


</style>

</head>
<body>
<%@include file="headerafterlogin.jsp"%>
<div class="col-sm-12">
    <center><h1>Booking Order List</h1></center><br>
    <div class="col-sm-12">
<table class="nav navbar-nav navbar-mid" width="100%" height="100%" padding="10px">
	<tr><th>ID</th><th>branch id</th><th>user id</th><th>shipping address</th><th>total</th><th>Action</th></tr>
<%
	int id=Integer.parseInt(request.getParameter("id"));

	ResultSet res1=TrackDAO.order(id);
	while(rs.next())
	{		
%>

	<tr><td><%=rs.getInt(1)%></td><td><%=rs.getInt(2)%></td><td><%=rs.getInt(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getDouble(5)%></td>
	<td>
	<form action="/trackOrder.do" method="post">
	<input type="hidden" name="id" value='<%=rs.getInt(1)%>'>
	<select name="status">
<option value="1" <%=(rs.getInt(6)==1)?"selected":""%>>New Order</option>
<option value="2" <%=(rs.getInt(6)==2)?"selected":""%>>Process</option>
<option value="3" <%=(rs.getInt(6)==3)?"selected":""%>>Delivered</option>
<option value="4" <%=(rs.getInt(6)==4)?"selected":""%>>Cancelled</option>
</select>
<input type="submit" name="submit" value="Submit">
</form>
</td></tr>

<%
	} 
%>
</table>

</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
