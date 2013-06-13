<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home Page/About as</title>

<link href="styles/base.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript"
	src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pikame").PikaChoose();
	});
</script>
</head>
<body>
	<div id="container">
		<jsp:include page="Header.jsp" />
	<div id="container">
		<header> <nav>
		<ul id="nav">
			<li><a href="Home" class="current">Home</a></li>
			<li><a href=Receipts class="other">all recipes</a></li>
			<li><a href="SearchByIngredients" class="other">extended
					Search</a></li>
			<li><a href=AddNewRecipe class="other">add New recipe</a></li>


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

		<head>
		<p>
			<img src="connect.png" alt="Smiley face" height="400" width="400"
				align="left">
		</p>
		<h3 style="text-align: center;">connect as</h3>

		<div class="address">
			<p>country:</p>
		<p>city:</p>
		<p>street:</p>
	<p>mail:</p>
	<p>phone:</p>
		
</div>
		
		 <footer>
        <div class="border"></div>
        <div class="footer-widget">
          
        </div>
       </footer>
</body>
</html>
