<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>p, a {text-decoration: none} </style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Recipes</title>
</head>
<body background="back.jpg">

<p><a href = "Home"> Homepage </a></p>

<h1> All Recipes </h1>

<form action="SearchServlet" method = "get">
<p>Search: <input type="text" name="name" /> 
<input type = "submit" value="Search" /></p>
</form>


<% ArrayList <Dish> allApprovedDishes = (ArrayList<Dish>)request.getAttribute("alldishes");
 	if(allApprovedDishes != null){	
 		for(int i = 0; i < allApprovedDishes.size(); i++){
 				out.println("<p><li> <a href= \"DishServlet?id=" + allApprovedDishes.get(i).getId()
						+ "\">" +  allApprovedDishes.get(i).getName()  + "</a></p>"); 
 				}
 		}
 	%>

</body>
</html>
