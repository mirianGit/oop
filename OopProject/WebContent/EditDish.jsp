<%@page import="java.util.HashMap"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp" />


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Dish</title>

<link href="styles/base.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript"
	src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>


</head>
<body>
	<div id="container">
		<header> <nav>
		<ul id="nav">
			<li><a href="Home" class="other">Home</a></li>
			<li><a href=Receipts class="other">All Recipes</a></li>
			<li><a href="SearchByIngredients" class="other">Extended
					Search</a></li>
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
		</nav> <hgroup class="intro"> </hgroup> </header>
		<head>
<%
	Dish dish = (Dish)request.getAttribute("edit?");
%>
<script>
var counter = <%=dish.getIngredients().size()%>;
var limit = 20;

function addInput(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
    	  var co = counter+1;
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Ingredient " + (counter + 1) + " <br><input type='text' name='INGREDIENT" + co + "'>"+
                             "  <input type='text' name='amount"+ co +"' "+ "value=amount onclick=if(this.value=='amount'){this.value=''} onblur=if(this.value==''){this.value='amount'}"+">";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Dish</title>
		</head>
		<body>

			<div id="container" style="width: 800px">

				<div id="header">


					<h1 style="margin-bottom: 0;" align="center">Edit dish</h1>
				</div>

				<form action="EditDish" method="post">

					<div id="menu" style="height: 400px; width: 400px; float: left;">

						<%
							String name = dish.getName();
							String text = dish.getReceipt();
							String link = dish.getPicture();
						%>
						<p>
							Name: <input id=dish_name type="text" name="name" />

							<script type="text/javascript">
    document.getElementById('dish_name').value = "<%=name%>";
</script>
						<p>How to prepare:
						<p>
							<TEXTAREA Name="recipe" ROWS=4 COLS=40> <%=text%></TEXTAREA>
						</p>
						Upload image <input type="text" name="pic" value=<%=link%> />
						<p>
					</div>

					<div id="content" style="height: 400px; width: 400px; float: left;">
						<%
							HashMap<Ingredient, String> map = dish.getIngredients();
							Iterator<Ingredient> it = map.keySet().iterator();
							int i=0;
						 	while(it.hasNext()){
						 		i++;
						 		Ingredient in = it.next();
						    	out.println("Ingredient" + i + "<br><input style='width:200px' type='text' name='INGREDIENT" + i + "' value='" + in.getName() + "'>");
						%>
						<script type="text/javascript">
     document.getElementByName('INGREDIENT' + i).value = "<%=in.getName()%>";
	</script>
						<%
							out.println(" <input type='text' style='width:150px'  name='amount"
						+ i +"' value='" + map.get(in) + "'><br>");
						%>
						<script type="text/javascript">
    	document.getElementByName('amount'+i).value = "<%=map.get(in)%>";
						</script>
						<%
							}
						%>

						<div id="dynamicInput"></div>
						
						<br/><input type="button" class="button"
							value="Add another text input for another ingredient"
							onClick="addInput('dynamicInput');">

					</div>
			</div>
			<input type="hidden" name="editingDishId" value=<%=dish.getId()%> />
			<p align="center">
				<input  class="button" type="submit" value="Edit Recipe" />
			</p>
			</form>

		</body>
</html>