<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	Integer id = (Integer) request.getAttribute("id");
	User us = User.getUserById(id);
	String name = us.getName();
	ArrayList<Dish> wishlist = (ArrayList<Dish>) request
			.getAttribute("wishlist");
	ArrayList<Dish> dishes = (ArrayList<Dish>) request
			.getAttribute("dishes");
%>
<title><%=name%></title>

</head>
<body style="height: 100%;">
<table style="height: 100%;"border="1"cellpadding="10">

<tr >
	
	<td width="35%" >

	
	<p>wishlist</p>
	<ul>
	<%
		for (int i = 0; i < wishlist.size(); i++) {
			Dish d = wishlist.get(i);
			String dish_name= d.getName();
			%><li><a><%=dish_name %></a><% 
	
 	}
	
 %>
 
 </ul>
  </td>
 <td width="30%">
 	<p>User Information</p>
 	<a><%=name %></a>
 </td>
 <td width="35%">
 <p>uploaded dishes</p>
	<ul>
	<%
		for (int i = 0; i < dishes.size(); i++) {
			Dish d = dishes.get(i);
			String dish_name= d.getName();
			%><li><a><%=dish_name %></a><% 
	
 	}
	
 %>
 </ul>
 </td >
 
 </tr>
 </table>
</body>
</html>