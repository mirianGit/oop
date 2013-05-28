<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<p><a href = "HomePage.jsp"> Homepage </a></p>

<h1> Please log in.</h1>

<form action="Login" method="post">
<p>User Name: <input type="text" name="name" /> </p> 

<p>Password: <input type="text" name="password" />
<input type = "submit" value="Login" /></p>

<p><a href= "Login.jsp"> Do you already have an account? </a></p>
</form>


</body>
</html>