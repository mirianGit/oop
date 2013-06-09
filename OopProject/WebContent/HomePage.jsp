<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Home page </title>
</head>

<body style="height: 100%;" bgcolor="#FFF8F0">


<table border= 0  width=100%  ALIGN=center style="height: 100%;" cellpadding="10">

<tr height = 20% bgcolor="#FAF1E8">
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

<% if (request.getSession().getAttribute("signed") == null ){ %>

<p align="justify"><a  href = "Login.jsp"> Login </a> </p>
<p align="justify"><a href = "Register.jsp"> Register</a></p>

<% } else { %>

<p align="justify"><a  href = "userServlet"> Hello, <%= request.getSession().getAttribute("name") %></a> </p>
<p align="justify"><a href = "LogOut"> Sign Out </a></p>

<%  } %> 


</td>
</tr>


<tr height= 100% >
<td valign=top align="center">

<h4 align="center"><a href = "AllRecipes.jsp"> Most Popular Recipes </a></h4>

<% ArrayList <Dish> allApprovedDishes = (ArrayList<Dish>) request.getSession().getAttribute("allApprovedDishes"); 
 	if(allApprovedDishes != null){
 	
 		request.setAttribute("all", allApprovedDishes);
 		
 	 	if(allApprovedDishes.size() > 10){ 
			for(int i = 0; i < 10; i++){ 
	 			out.println("<li> <a href= \"Dish.jsp?id=" + allApprovedDishes.get(i).getId()
						+ "\">" +  allApprovedDishes.get(i).getName()  + "</a>"); 
	 		}
 		}else{
 			for(int i = 0; i < allApprovedDishes.size(); i++){
 				out.println("<li> <a href= \"Dish.jsp?id=" + allApprovedDishes.get(i).getId()
						+ "\">" +  allApprovedDishes.get(i).getName()  + "</a>"); 
 			}
 		}
 	}
 		
 %>


</td>

<td valign="top" align="center">

<h4><a href = "AllRecipes.jsp" > All recipes </a></h4> 
</td>


<td valign="top" align="center">

 <h4><a href = "AllRecipes.jsp"> Newest Recipes </a></h4>

<ul>
	
<%  ArrayList <Dish> lastApprovedDishes = (ArrayList<Dish>) request.getSession().getAttribute("lastApprovedDishes"); 

 	if(lastApprovedDishes != null){
 		if(lastApprovedDishes.size() > 10){ 
			for(int i = 0; i < 10; i++){ 
	 			out.println("<li> <a href= \"Dish.jsp?id=" + lastApprovedDishes.get(i).getId()
						+ "\">" +  lastApprovedDishes.get(i).getName()  + "</a>"); 
	 		}
 		}else{
 			for(int i = 0; i < lastApprovedDishes.size(); i++){
 				out.println("<li> <a href= \"Dish.jsp?id=" + lastApprovedDishes.get(i).getId()
						+ "\">" +  lastApprovedDishes.get(i).getName()  + "</a>"); 
 			}
 		}
 	}
 		
 %>



</ul>

 </td>
 
</tr>

</table>



</body>
</html>