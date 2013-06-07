<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;width:  100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	Integer id = (Integer) request.getAttribute("id");
	User us = User.getUserById(id);
	String name = us.getName();
	Collection<Dish> c =(Collection) request.getAttribute("notApproved");
	ArrayList<Dish> dishes = (ArrayList<Dish>) request
			.getAttribute("dishes");
%>
<title><%=name%>'s profile</title>
</head>
<body style="height: 100%;width:  100%;" bgcolor="F8F6F7">
<div id="container" style="width:100%;height:100%;">
<div id="header" style="background-color:#FF7F50;">
<p style="margin-bottom:0;"><font size="5"color=white><%=name%>'s profile</font></p>
<p style="margin-top:0;margin-bottom:0;"><font color=white> admin </font></p>
</div>
<div id="menu" style="background-color:#F8F6F7;height:  100%;width:20%;float:left;">
<b>Menu </b><br>
<a href = "AllRecipes.jsp">edit Recipes<br></a>
edit Users<br>
<a href = "HomePage.jsp"> Back to Homepage</a>
</div>
<div id="content" style="height:100%;width:80%;float:left;">
<table style="height: 100%;width:  100%;"border="0"  >
<tr >
	
	<td width="30%" valign="top">

	
	<p>Non Approved recipes</p>
	<ul >
	<%
		for(Dish d:c){
		
			String dish_name= d.getName();
			%><li><a><%=dish_name %>&nbsp;<input	type="submit" value="Approve" /></a><% 
	
 	}
	
 %>
 
 </ul>
  </td>
 <td width="25%" valign="top">
 	<p>User Information</p>
 	<a><%=name %></a>
 </td>
 <td width="25%" valign="top">
 <p>my recipes</p>
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
 </table></div>


</div>
</body>
</html>