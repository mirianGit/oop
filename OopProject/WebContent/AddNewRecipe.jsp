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
<title>New Recipe</title>
</head>
<body>

<div id="container" style="width:800px">

<div id="header" style="background-color:#FFA500;">
<h1 align="left"><a href="Home"> Homepage</a></h1>

<h1 style="margin-bottom:0;" align="center">  Add new recipe </h1></div>

<form action="AddNewRecipe" method="post">

<div id="menu" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">

<p> Name: <input type="text" name="name" /> 
<p> How to prepare:  

<p> <TEXTAREA Name="recipe" ROWS= 4 COLS= 40></TEXTAREA></p>
 Upload image  <input type="text" name="pic" />
<p>

</div>

<div id="content" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">

<div id="dynamicInput">
     Ingredient 1<br><input type="text" name="INGREDIENT1">
     <input type="text" name="amount1" value="amount"
							onclick="if(this.value=='amount'){this.value=''}"
							onblur="if(this.value==''){this.value='amount'}"> 
</div>
 <input type="button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">

</div>

</div>
<p align="center"><input type="submit" value="Add Recipe"/></p>
</form>

</body>
</html>