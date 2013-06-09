<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Recipe</title>
</head>
<body>

<div id="container" style="width:800px">

<div id="header" style="background-color:#FFA500;">
<h1 align="left"><a href="HomePage.jsp"> Homepage</a></h1>
<h1 style="margin-bottom:0;" align="center">  Add new recipe </h1></div>

<div id="menu" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">


<p> Name: <input type="text" name="name" /> 
<p> How to prepare:  

<p> <TEXTAREA Name="recipe" ROWS= 4 COLS= 40></TEXTAREA></p>

<p>

Upload Image: <br />
<form action="UploadServlet" method="post"
                        enctype="multipart/form-data">
<input type="file" name="file" size="40" />
<br />
<input type="submit" value="Upload Image" />
</form>

</div>

<div id="content" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">

<% for (int i = 0; i < 3; i++){ %>
	<p>Ingredient: <input type="text" name="name" + i /> 
<% } %>


<% Integer num = (Integer)request.getSession().getAttribute("numAdded");
	if(num != null){ 
		int a = 3;%>
		<% for(int j = 0; j < num; j++){
		%>
			<p> Ingredient: <input type="text" name="name" + (a++) />
		<% }
	}
%>

<form action="AddMoreIngredients" method="post" >
<input name="jsp" type="hidden" value= "AddNewRecipe.jsp"/>
<p><input type = "submit" value= "Add more ingredients" /></p>
</form>

</div>

</div>

</body>
</html>