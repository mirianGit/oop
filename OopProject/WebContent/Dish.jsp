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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dish</title>
</head>
<%
	int signed = (Integer) request.getAttribute("signed");
	int id = (Integer) request.getAttribute("id");
	boolean alreadyInWishlist = false;

	int isAdmin = (Integer) request.getAttribute("isAdmin");
	int contains = (Integer) request.getAttribute("contains");
%>
<body style="height: 100%;" bgcolor="#FFF8F0">
	<form action="wishlistOrDeleteServlet" method="get">
		<input type=hidden name=id value=<%=id%>>
		<%
			if (signed == 1) {
				if (isAdmin == 0 && contains == 0) {
		%>
		<p>
			<input type=submit name="button" value="add to wishlist">
		</p>
		<%
			} else if (isAdmin == 0) {
		%>
		<p>added to wishlist</p>
		<%
			} else {
		%>
		<p>
			<input type=submit name="button" value="Delete recipe">
		</p>
		<%
			}
			}
		%>
	</form>
	<h4>
		<a href="Receipts"> All recipes </a>
	</h4>
	<div
		class="post-1450 post type-post status-publish format-standard hentry category-59"
		id="post-1450">
		<%
			int dish_id = Integer.parseInt(request.getParameter("id"));
			String dish_name = Dish.getName(dish_id);
			Dish curr_dish = Dish.getDish(dish_name);
			String text = curr_dish.getReceipt();
		%>
		<h1 class="entry-title">
			<%=dish_name%></h1>

		<p align="justify">
			<a href=EditDish class="other"><font size="2" color="blue">edit</font>
			<input type=hidden name=dish_id value=<%=id%>>
			</a>
			
			
		</p>
		<div id="guan-page-code-top"></div>
		<p>
			<img src=<%=curr_dish.getPicture()%> alt="Smiley face" height="200"
				width="200" align="left">
		</p>
		<p>
			<strong>ingredients</strong>
		</p>
		<blockquote>
			<p align="left">
			<table border="0" cellpadding="10">
				<tr>
					<th>INGREDIENT NAME</th>
					<th>quantity
					<th>
				</tr>
				<tr>
					<th>
						<%
							HashMap<Ingredient, String> ingredients = curr_dish
									.getIngredients();
							Iterator<Ingredient> it = ingredients.keySet().iterator();
							if (ingredients != null) {
								while (it.hasNext() ) {
									Ingredient ing = it.next();
									out.print("<li> <a  >" + ing.getName() 
											+ "</a>");
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
											+ "</a>");
								}
							}
						%>
					</th>
					
				</tr>
				<tr>

				</tr>
			</table>


		</blockquote>

		<p align="left"><%=text%></p>
	</div>
	<jsp:include page="commentBox.jsp" />
</body>
</html>
