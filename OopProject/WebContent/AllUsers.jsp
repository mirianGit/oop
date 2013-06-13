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
reservations.a.otherClass{

border: none;
	padding: 4px 47px 9px;
	position: relative;
	width:200px;
	right: 60px;
	text-align: left;
	text-decoration: none;
	
	
}
reservations.a.otherClass.link{

border: none;
	
	text-align: left;
	text-decoration: none;
	
	
}

label {
	font-size: 22px;
	font-family: 'Lobster13Regular', cursive;
	color: #9c5959;
	text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
	font-weight: normal;
	padding-bottom: 10px;
	padding-top: 10px;
}
input[type="text"], textarea {
	font-family: Century Gothic, sans-serif;
	font-size:18px;
	outline: none;
	background: #f5f0e0;
	border: 1px dotted #9C5959;
	font-size: 14px;
	padding: 3px;
}
input[type="text"] {
	font-family: Century Gothic, sans-serif;
font-size:18px;
	width: 300px;
}
textarea {
font-size:18px;
	font-family: Century Gothic, sans-serif;
	width: 400px;
	height: 200px;
}
input[type="text"]:active, input[type="text"]:focus {
	font-size:18px;
		font-family: Century Gothic, sans-serif;
	border: 1px dashed #9C5959;
}
textarea:active, textarea:focus {
	font-family: Century Gothic, sans-serif;
font-size:18px;
	border: 1px dashed #9C5959;
}
a.user{
font-size: 18px;

	color: #9c5959;
	text-shadow: none;
}
.buttonUser {
	font-family: 'Lobster13Regular', cursive;
	color: #f5f5f5;
	padding: 8px 14px 10px;
	background-color: #9c5959;
	border: none;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	-webkit-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-moz-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	-moz-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-decoration: none;
	font-size: 20px;
}
.buttonUser:active {
	position: relative;

	-webkit-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0
		0px 3px rgba(0, 0, 0, 0.9);
	-moz-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px
		3px rgba(0, 0, 0, 0.9);
	box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px 3px
		rgba(0, 0, 0, 0.9);
}

.buttonUser:active:after {
	content: "";
	width: 100%;
	height: 3px;
	background: #fff;
	position: absolute;
	bottom: -1px;
	left: 0;
}

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