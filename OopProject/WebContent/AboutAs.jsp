<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%
	ArrayList<Dish> randomDishes = (ArrayList<Dish>) request
						.getSession().getAttribute("randomDishes");
%>

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
			<img src="we.jpg" alt="Smiley face" height="200" width="240"
				align="left">
		</p>
		<h1 style="text-align: center;">Hello and welcome to Simply Recipes</h1>

		<p></p>

		<div class="p.main">
			<p>If you are unfamiliar with Simply Recipes, please allow me to
				take a moment to introduce you to the site. The first thing you
				should know is that Simply Recipes is a blog or a personal website,
				created and maintained by me, Elise Bauer. Unlike most of the large
				recipe sites that you might find on the Internet with tens of
				thousands of recipes, Simply Recipes is my personal website, with
				only a few hundred recipes, all tested by me, my family or my
				friends. We invite you to try the recipes, and if you would like,
				leave constructive feedback in the comments. Do you have a recipe
				binder or box of recipe index cards? Think of this site as our
				family sharing the recipes in our recipe binder with you. As we cook
				the recipes multiple times, we often think of improvements and
				update the recipes. So keep in mind that what you see here is a work
				in progress.</p>
		</div>
		
		 <footer>
        <div class="border"></div>
        <div class="footer-widget">
          
        </div>
       </footer>
</body>
</html>