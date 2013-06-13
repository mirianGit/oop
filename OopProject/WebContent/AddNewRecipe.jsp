<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="Header.jsp" />
<style>

textarea {
	width: 400px;
	height: 200px;
}
input[type="text"]:active, input[type="text"]:focus {
	border: 1px dashed #9C5959;
}
textarea:active, textarea:focus {
	border: 1px dashed #9C5959;
}

input, textarea, select {
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
}
</style>

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
            <li><a href=AddNewRecipe class="current">Add New Recipe</a></li>
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

<body>

<div id="container" style="width:800px">

<div id="header" ">


<h1 style="margin-bottom:0;" align="center">  Add new recipe </h1></div>

<form action="AddNewRecipe" method="post">

<div id="menu" style="height:300px;width:400px;float:left;">

<p> Name: <input type="text" name="name" /> 
<p> How to prepare:  

<p> <TEXTAREA Name="recipe" ROWS= 3 COLS= 30 style="width: 350px"></TEXTAREA></p>
 Upload image  <input type="text" name="pic" />
<p>

</div>

<div id="content" style="height:300px;width:400px;float:left;">

<div id="dynamicInput">
     Ingredient 1<br><input type="text" name="INGREDIENT1">
     <input type="text" name="amount1" value="amount"
							onclick="if(this.value=='amount'){this.value=''}"
							onblur="if(this.value==''){this.value='amount'}"> 
</div>
 <br><input type="button" class = "button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">


</div>



<p align="center"><input class="button" type="submit" value="Add Recipe"/></p>







</form>

</body>
</html>