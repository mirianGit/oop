<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
var counter = 1;
var limit = 20;
function addInput(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Ingredient " + (counter + 1) + " <br><input type='text' name='myInputs[]'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Recipe</title>
</head>
<body>

<div id="container" style="width:800px">

<div id="header" style="background-color:#FFA500;">
<h1 align="left"><a href="Home"> Homepage</a></h1>

<h1 style="margin-bottom:0;" align="center">  Add new recipe </h1></div>

<div id="menu" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">

<form action="AddNewRecipe" method="post">
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

<form action="AddNewRecipe" method='post'>
<p align="right"><input type="submit" value="Add Recipe"/></p>

</form>
</div>

<div id="content" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">



<script  language="Javascript" type="text/javascript"></script>
<form method="POST">
     <div id="dynamicInput">
          Ingredient 1<br><input type="text" name="myInputs[]">
     </div>
     <input type="button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">
</form>

</div>

</div>
</form>

</body>
</html>