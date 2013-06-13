<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Recipes</title>

</head>
<body>
<jsp:include page="Header.jsp" />
	<div id="container">
		<header> <nav>
		<ul id="nav">
			<li><a href="Home" class="other">Home</a></li>
			<%
				if (request.getAttribute("show") == null
						|| request.getAttribute("show").equals("All")) {
			%>
			<li><a href="Receipts" class="current">all recipes</a></li>
			<%
				} else {
			%>
			<li><a href="Receipts" class="other">all recipes</a></li>
			<%
				}
			%>
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
		</nav> </header>
		<hgroup class="intro"> <%
 	if (request.getAttribute("show") == null
 			|| request.getAttribute("show").equals("All")) {
 %>
		<h1 class="title2">All Recipes</h1>
		<%
			} else {
		%>
		<h1 class="title2">Search Results</h1>
		
		<%
			}
		%> </hgroup>
		<div class="reservations">
			<br />


			<div style="margin-top: 20px">


				<a> </a>
			</div>
		</div>
		<br /> <br /> <br /> <br /> <br />

		<div class="wrapper">
			<div class="border"></div>

			<article class="menu"> <%
 	int pageNum = 1;

 	if (request.getParameter("page") != null)
 		pageNum = Integer.parseInt((String) request
 				.getParameter("page"));
 	ArrayList<Dish> allApprovedDishes = (ArrayList<Dish>) request
 			.getAttribute("alldishes");
 	request.getSession().setAttribute("alldishes", allApprovedDishes);
 	request.getSession().setAttribute("pageName",
 			request.getAttribute("show"));
 	if (allApprovedDishes != null) {

 		for (int i = (pageNum - 1) * 10; i < (pageNum - 1) * 10 + 10; i++) {

 			if (i == allApprovedDishes.size())
 				break;
 			Dish d = allApprovedDishes.get(i);
 			int dish_id = d.getId();
 			String dish_name = d.getName();
 			String text = d.getReceipt();
 			if (text.length() > 450)
 				text = text.substring(0, 450);
 %>

			<div class="left">
				<h3>
					<a href="DishServlet?id=<%=dish_id%>"><%=dish_name%></a>
				</h3>
			</div>

			<div class="right menu-order"></div>
			<img src="images/menu/pizza2.jpeg" class="left clear item"
				width="150" alt="">
			<p class="left"><%=text%>
				<a href="DishServlet?id=<%=d.getId()%>"> See Full Recipe</a>
			</p>



			<div class="border3"></div>


			<%
				}

				}
			%> </article>
			<div class="border2"></div>
			<br>


		</div>

		<footer>
		<div class="border2"></div>

		<br />
		<%
			String  link;

			
			if (request.getAttribute("show") == null
					|| request.getAttribute("show").equals("All")) {
				link = "Receipts?page=";
				
			} else if (request.getAttribute("show").equals("Found")) {
				link = "SearchServlet?page=";
				
			} else {
				link = "SearchByIngredientsServlet?page=";
			}
			if (pageNum == 1) {
		%> <a href="<%=link%><%=pageNum%>"> prev</a> <%
 	} else {
 %> <a href="<%=link%><%=pageNum-1%>">
			prev</a> <%
 	}
 	for (int i = 1; i <= allApprovedDishes.size() / 10 + 1; i++) {
 %> <a href="<%=link%><%=i%>"><%=i%></a> <%
 	}

 	if (pageNum == allApprovedDishes.size() / 10 + 1) {
 %> <a href="<%=link%><%=pageNum%>">
			next</a> <%
 	} else {
 %> <a href="<%=link%><%=pageNum+1%>"> next</a> <%
 	}
 %> <br />
		<br />
		</footer>

		<br /> <br />

	</div>
</body>









</body>
</html>
