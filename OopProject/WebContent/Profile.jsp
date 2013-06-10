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
	Integer id = (Integer) request.getSession().getAttribute("id");
	User us = User.getUserById(id);
	String name = us.getName();
	ArrayList<Dish> wishlist = (ArrayList<Dish>) request
			.getSession().getAttribute("wishlist");
	ArrayList<Dish> dishes = (ArrayList<Dish>) request
			.getSession().getAttribute("dishes");
%>
<title><%=name%>'s profile</title>

</head>
<body style="height: 100%;width:  100%;" bgcolor="F8F6F7" >

<table style="height: 100%;width:  100%;"border="0"  >
     <tr bgcolor=FF7F50 >
   <td width="35%" height="5"valign="top">
      <p><a href = "Home"> <font color="white">Back to Homepage</font> </a></p>
      </td>
      <td width="30%" align="center">
      <img src=cupcakes.jpg  height=54 width=136 >
      </td>
      <td width="35%" valign="top">
      <p><font color="white"><%= name%>'s profile </font></p>
      </td>
      </tr >

<tr >
	
	<td width="35%" valign="top">

	
	<p>wishlist</p>
	<ul>
	<%
		for (int i = 0; i < wishlist.size(); i++) {
			Dish d = wishlist.get(i);
			int dishId=d.getId();
			String dish_name= d.getName();
			%><li><a href= "DishServlet?id=<%=dishId %>"><%=dish_name %></a><% 
	
 	}
	
 %>
 
 </ul>
  </td>
 <td width="30%" valign="top">
 	<p>User Information</p>
 	<a><%=name %></a>
 </td>
 <td width="35%" valign="top">
 <p>my recipes</p>
	<ul>
	<%
		for (int i = 0; i < dishes.size(); i++) {
			
			Dish d = dishes.get(i);
			int dishId=d.getId();
			String dish_name= d.getName();
			%><li><a href= "DishServlet?id=<%=dishId %>"><%=dish_name %></a><% 
	
 	}
	
 %>
 </ul>
 </td >
 
 </tr>
 </table>
</body>
</html>