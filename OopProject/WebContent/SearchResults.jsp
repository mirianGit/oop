<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="back.jpg">

<p><a href = "HomePage.jsp"> Homepage </a></p>

<h1> Found followig dishes </h1>

<form action="Search" method = "get">
<p>Search: <input type="text" name="name" /> 
<input type = "submit" value="Search" /></p>
</form>


<% ArrayList <Dish> allApprovedDishes = (ArrayList<Dish>)request.getAttribute("foundDishes");
 	if(allApprovedDishes != null){	
 		for(int i = 0; i < allApprovedDishes.size(); i++){
 				out.println("<p><li> <a href= \"Dish.jsp?id=" + allApprovedDishes.get(i).getId()
						+ "\">" +  allApprovedDishes.get(i).getName()  + "</a></p>"); 
 				}
 		}
 	%>


</body>
</html>