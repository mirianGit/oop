<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Home page </title>
</head>

<body background="background.jpg">

<table border=1 bgcolor="F3E2A9" width=100% height=100% ALIGN=center>

<tr height = 20%>
<td width="20%">

<h1> <a href = "HomePage.jsp"> Homepage </a> </h1>
</td>


<th>
<form action="SearchServlet" method="get">
<p> <input type="text" name="name" value = "Search..." onclick="if(this.value=='Search...'){this.value=''}" onblur="if(this.value==''){this.value='Search...'}">
<input type = "submit" value="Search" /></p>
</form>

<p><a href = "SearchByIngredients.jsp"> Search By Ingredients </a> </p>
</th>


<td align=right width="30%">



<% if (request.getSession().getAttribute("name") == null) { %>

<p align="justify"><a  href = "Login.jsp"> Login </a> </p>
<p align="justify"><a href = "Register.jsp"> Register</a></p>

<% } else { %>

<p align="justify"><a  href = "Profile.jsp"> Hello, <%= request.getSession().getAttribute("name") %></a> </p>



<p align="justify"><a href = "LogOut"> Sign Out </a></p>


<%  } %> 


</td>
</tr>


<tr height= 100% >
<td valign=top>

<p><a href = "AllRecipes.jsp"> Most Popular Recipes </a></p>
<ul>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
</ul>


</td>

<td valign="top" bgcolor="#FBFBEF">

<p><a href = "AllRecipes.jsp" > All recipes </a></p> 
</td>


<td valign="top"> <p><a href = "AllRecipes.jsp"> Newest Recipes </a></p>

<ul>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>
<li><a href = "AllRecipes.jsp"> list </a></li>

</ul>

 </td>
 
</tr>

</table>



</body>
</html>