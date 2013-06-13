<%@page import="Model.User"%>
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

	
    <div id="container">
      <header>
        <nav>
          <ul id="nav">
            <li><a href="Home" class="other">Home</a></li>
            <li><a href=Receipts class="other">All Recipes</a></li>
            <li><a href="SearchByIngredients" class="current">Extended Search</a></li>
            <li><a href=AddNewRecipe class="other">Add New Recipe</a></li>
           	<li><a class="search"> 
             <div id="tw-form-outer">
		<form action="SearchServlet" method="get" id="tw-form">
			<input type="text" id="tw-input-text" name="name" value='search'
				onfocus="if(this.value=='search'){this.value='';}"
				onblur="if(this.value==''){this.value='search';}" /> <input
				type="submit" id="tw-input-submit" value="" />
		</form>
		</li>
		 <div class="reservations">
			<div style="margin-top: -40px">
				 <%
				 String name=(String)request.getSession().getAttribute("name");
				 int id= User.getIdByName(name);
				 User us=User.getUserById(id);%>
						 
					<a class="hello" href="userServlet?id=<%=us.getId() %>"> Hello, <%=us.getName()%></a></div>
				
				 <div style="margin-top:20px"> <a class="button" href="LogOut" title="log out">log out</a> </div> 
		
	</div>
	</a>
	</ul>
       </nav>
     
   
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
          newdiv.innerHTML = "Ingredient " + (counter + 1) + " <br><input type='text' name='INGREDIENT" + co + "'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}
</script>

</head>

<body>


 <form action="SearchByIngredientsServlet" >

<div id="dynamicInput">
     Ingredient 1 <br> <input type='text' name='INGREDIENT1'>
</div>
<p> <input type="button" class="button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">
</p>


<p><input type = "submit" class="button" value= "Search" /></p>

</form>



</body>
</html>