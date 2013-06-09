<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All users</title>
<% ArrayList<User> users = (ArrayList<User>) request
			.getAttribute("users");%>
</head>
<body>
<h1>All recipes</h1>
		<ul>
	<%
		for (int i = 0; i < users.size(); i++) {
			User us = users.get(i);
			String name= us.getName();
			%><li><a><%=name %>&nbsp; &nbsp;<input type="button" value="delete"></a><% 
	
 	}
	
 %>
 </ul>
</body>
</html>