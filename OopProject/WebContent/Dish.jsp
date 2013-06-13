<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.HashMap"%>
<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="Header.jsp" />



<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Dish</title>
	
	<link href="styles/base.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
	<script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>

	</head>
	<body>
    <div id="container">
      <header>
        <nav>
          <ul id="nav">
            <li><a href="Home" class="other">Home</a></li>
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
       <hgroup class="intro">
        </hgroup>
        
   
      </header>
<%
	int signed = (Integer) request.getAttribute("signed");
	int id = (Integer) request.getAttribute("id");
	boolean alreadyInWishlist = false;

	int isAdmin = (Integer) request.getAttribute("isAdmin");
	int contains = (Integer) request.getAttribute("contains");

	int dish_id = Integer.parseInt(request.getParameter("id"));
	String dish_name = Dish.getName(dish_id);
	Dish curr_dish = Dish.getDish(dish_name);
	String text = curr_dish.getReceipt();
%>


	<h1 align="center">
		<a><%=dish_name%></a>
	</h1>
	<br>
	<div class="border"></div>
	
	<div
		class="post-1450 post type-post status-publish format-standard hentry category-59"
		id="post-1450">
		
		
		<div id="guan-page-code-top"></div>
		
		<article class="menu">
		
		<p>
			<img src=<%=curr_dish.getPicture()%> alt="Smiley face" height="200"
				width="200" align="left">
		</p>
		
		
		
		<h4 align="center">
			 ingredients 
		</h4>
		<blockquote>
			<p align="center">
			<table border="0" cellpadding="10"  style="line-height: 2.5; " align="center">
				<th>
					
						<%
							HashMap<Ingredient, String> ingredients = curr_dish
									.getIngredients();
							Iterator<Ingredient> it = ingredients.keySet().iterator();
							if (ingredients != null) {
							out.print("<ul>");
								while (it.hasNext() ) {
									Ingredient ing = it.next();
									out.print("<li> <a>&nbsp &nbsp" + ing.getName() 
											+ "&nbsp &nbsp&nbsp &nbsp</a>");
								}
							}
							
						%>
					</th>
					<th>
						<%
							Iterator<String> it2 = ingredients.values().iterator();
							if (ingredients != null) {
								while (it2.hasNext()) {
									out.print("<li> <a  >" + it2.next()
											+  " </a>  ");
								}
							}
							out.print("</ul>");
						%>
					</th>
			</table>
			
		
	<h4 > recipe: </h4>
	
		<p align="left" ><%=text%></p>
		
		<% String authorName = User.getUserById(curr_dish.getAuthorId()).getName(); %>
	
	<h4>author: <%=authorName %></h4>
		
		
	<jsp:include page="commentBox.jsp" >
    <jsp:param name="author_id" value=<%=curr_dish.getName() %> />
	</jsp:include>
	
	</blockquote>
	</div>
	
	
	<form action="wishlistOrDeleteServlet" method="get">
		<input type=hidden name=id value=<%=id%>>
		<%
			if (signed == 1) {
				if (isAdmin == 0 && contains == 0) {
		%>
		<p>
			
			<div style="margin-top:20px"><a href="wishlistOrDeleteServlet?id=<%=id%>&button=add" type=submit name="button" value="add to wishlist"
			 class="button"> Add To WishList</a></div>
			 
		</p>
		<%
			} else if (isAdmin == 0) {
		%>
		<p>added to wishlist</p>
		<%
			} else {
		%>
		<p>
			
			<div style="margin-top:20px"><a href="wishlistOrDeleteServlet?id=<%=id%>&button=delete" name="button" value ="Delete recipe"
			 class="button"> Delete Recipe</a></div>
		</p>
		<%
			}
			}
		%>
	</form>
	
	
    
	
	<p align="justify">
		<% 
		if(isAdmin == 1){
		request.getSession().setAttribute("dish_id", dish_id); %>
			<div style="margin-top:20px"><a href="EditDish" class="button"> Edit Recipe</a></div>		<%} %>
			
		</p>
	
	</article>
	
</body>
</html>
