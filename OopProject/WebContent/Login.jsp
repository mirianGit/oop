<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body bgcolor="#E0F8F7">

<p><a href = "HomePage.jsp"> Homepage </a></p>

<h1 style="color:#FF8000"> Please log in. <img src="happy-chicken.jpg" align="right" width="200">
</h1>

<form action="LoginServlet" method="get">

 <% String cout = (String)request.getAttribute("problem");
 if(cout != null){%>
	 <h4><%= cout %>!!! Please Try Again! :) </h4>
<%  } %>

<p>User Name: <input type="text" name="name" /> </p>

<p>Password: <input type="password" name="password"  />
<input type = "submit" value="Login" /></p>


 

<p><a href= "Register.jsp"> You don't have an account? Register now! :) </a></p>

</form>


</body>
</html>