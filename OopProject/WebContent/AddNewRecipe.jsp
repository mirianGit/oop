<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Recipe</title>
</head>
<body>

<h1> Add new recipe</h1>



<p> Name: <input type="text" name="name" /> 

<% for (int i = 0; i < 3; i++){ %>
	<p>Ingredient: <input type="text" name="name" + i /> 
<% } %>


<% Integer num = (Integer)request.getSession().getAttribute("numAdded");
	if(num != null){ 
		int a = 3;%>
		<% for(int j = 0; j < num; j++){
		%>
			<p>Ingredient: <input type="text" name="name" + (a++) />
		<% }
	}
%>

<form action="AddMoreIngredients" method="post" >
<input name="jsp" type="hidden" value= "AddNewRecipe.jsp"/>
<input type = "submit" value= "Add more ingredients" />
</form>

<p> How to prepare:  


<TEXTAREA Name="recipe" ROWS= 4 COLS= 50></TEXTAREA>





</body>
</html>