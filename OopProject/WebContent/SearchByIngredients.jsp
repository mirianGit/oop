<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<SCRIPT language="javascript">
function add() {
	
       //Create an input type dynamically.
       var element = document.createElement("input");
     
       
       document.getElementById("new").innerHTML = "Ingredient:";
       
       var foo = document.getElementById("fooBar");
     
        //Append the element in page (in span).
       foo.appendChild(element);

}
</SCRIPT>
</head>
<body bgcolor="#F7F8E0">

<BODY>

<h3><a href = "HomePage.jsp"> Homepage </a></h3>


<p>Ingredient: <input type="text" name="name" /> 
<p>Ingredient: <input type="text" name="name" /> 
<p>Ingredient: <input type="text" name="name" />

<p id = "new"></p>
<p><span id="fooBar"> </span></p>






<FORM>

<INPUT type="button" value="Add More Ingredients" onclick="add()"/>

</FORM>

<form action="SearchByIngredients" method="get">

<p><input type = "submit" value= "Search" /></p>

</form>

     


</body>
</html>