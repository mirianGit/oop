<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All users</title>
<% ArrayList<User> users = (ArrayList<User>) request
			.getAttribute("users");%>
</head>
<style >


</style>
<script>
 function Function(key,button) {
	document.getElementById("frm1").button.value=button;
	document.getElementById("frm1").hidden.value=key;
	document.getElementById("frm1").submit();
}
</script>

<body>


<div id="container">
      <header>
        <nav>
          <ul id="nav">
            <li><a href="Home" class="current">Home</a></li>
            <li><a href=Receipts class="other">All Recipes</a></li>
             <li><a href="SearchByIngredients" class="other">Extended Search</a></li>
            <li><a href=AddNewRecipe class="other">Add New Recipe</a></li>
           
            
             <li><a class="search">
             <div id="tw-form-outer">
		<form action="SearchServlet" method="get" id="tw-form">
			<input type="text" id="tw-input-text" name="name" value='search'
				onfocus="if(this.value=='search'){this.value='';}"
				onblur="if(this.value==''){this.value='search';}" /> <input
				type="submit" id="tw-input-submit" value="" />
		</form>
	</div>
		</a>
			
          
          </ul>
        </nav>
       
<h1>All users</h1>
 <br>
 <br>
  
   <form action="allUsersServlet" method = "get">
   	<label for="name"><b>Search Users: </b><input type="text" name="name" /> 
<input class="button" Style= "width:100px;height:30px;padding-top: 2px" type = "submit" value="Search" /></label>
 
 </form>

 <div class="wrapper">
    <div class="border"></div>
    <article>
     <form id="frm1"  method="get" action="DeleteUserServlet" >

<input type="hidden" name="hidden">
<input type="hidden" name="button">


		<ul>
	<%
		for (int i = 0; i < users.size(); i++) {
			User us = users.get(i);
			String name= us.getName();
			int id=us.getId();
			%><li><a class=user ><b><%=name %></b></a>&nbsp; &nbsp;<a class=buttonUser  href="DeleteUserServlet?button=delete&hidden=<%=id%>" Style= "text-align:center; width:80px;height:25px;padding-top: 2px;position:absolute;
right:710px;" title="delete" >delete</a>
			<a class=buttonUser  href="DeleteUserServlet?button=makeAdmin&hidden=<%=id%>" Style= "text-align:center; width:120px;height:25px;padding-top: 2px;position:absolute;
right:550px;" title="make Admin" >make admin</a><br> <br>  <% 
	
 	}

 %>
 </ul>
 </form>
        </article>
        </div>
        
<br>
<br>

<br>

 <p><a href = "userServlet" Style= "font-size:25px; text-align:center; width:250px; position:absolute;right:230px;top:350px"> Back to my profile</a></p>
 
</body>
</html>