<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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
<body bgcolor="#F7F8E0">

<BODY>


<h3><a href = "Home"> Homepage </a></h3>


 <form action="SearchByIngredientsServlet" >

<div id="dynamicInput">
     Ingredient 1 <br><input type='text' name='INGREDIENT1'>
</div>
 <input type="button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">


<p><input type = "submit" value= "Search" /></p>

</form>



</body>
</html>