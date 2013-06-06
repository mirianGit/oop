<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body bgcolor="#FBF2EF">
<p><a href = "HomePage.jsp"> Homepage </a></p>

<h1> Create New Account
<img src="kitchenWelcome.jpg" align="right" width="200">

</h1>
<form action="RegisterServlet" method="get">
<p>User Name: <input type="text" name="name" /> </p> 

<p>Password: <input type="password" name="password" />
<p>Re-Enter Password: <input type="password" name="password" />

<input type = "submit" value="Create" /></p>

<p><a href= "Login.jsp"> Do you already have an account? </a></p>

</form>

</body>
</html>