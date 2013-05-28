<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Homepage </title>
</head>

<body background="background.jpg">

<h1> Homepage</h1>
<p><a href = "HomePage.jsp"> Homepage </a>

<p align="right"><a  href = "Login.jsp"> Login </a> </p>
<p align="right"><a href = "Register.jsp"> Register</a></p>
<p align="right"> Welcome <%=request.getParameter("name")%></p>
<p align="right"><a href = "HomePage.jsp"> Log Out </a> </p>

<p>Search: <input type="text" name="name" /> 
<input type = "submit" value="Search" /></p>


<p><a href = "AllRecipes.jsp"> All recipes </a></p>
<p><a href = "SearchByIngredients.jsp"> Search By Ingredients </a> </p>


<ul>
	
</ul>

</body>
</html>