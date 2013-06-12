<%@page import="java.util.HashMap"%>
<%@page import="Model.Ingredient"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

<div id="container" style="width:800px">

<div id="header" style="background-color:#FFA500;">
<h1 align="left"><a href="Home"> Homepage</a></h1>

<h1 style="margin-bottom:0;" align="center">  Edit dish </h1></div>

<form action="EditDish" method="post">

<div id="menu" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">

<%
	String name = dish.getName();
	String text = dish.getReceipt();
%>
<p> Name: <input id=dish_name type="text" name="name" /> 

<script type="text/javascript">
    document.getElementById('dish_name').value = "<%=name%>";
</script>

<p> How to prepare:  

<p> <TEXTAREA Name="recipe" ROWS= 4 COLS= 40> <%=text%></TEXTAREA></p>
 Upload image  <input type="file" name="pic" />
<p>

</div>

<div id="content" style="background-color:#EEEEEE;height:400px;width:400px;float:left;">
<%
	HashMap<Ingredient, String> map = dish.getIngredients();
	Iterator<Ingredient> it = map.keySet().iterator();
	int i=0;
 	while(it.hasNext()){
 		i++;
 		Ingredient in = it.next();
    	out.println("Ingredient" + i + "<br><input type='text' name='INGREDIENT" + i + "' value='" + in.getName() + "'>"); 
	%>	
	<script type="text/javascript">
     document.getElementByName('INGREDIENT' + i).value = "<%=in.getName()%>";
	</script>
    <% 	out.println(" <input type='text' name='amount"+ i +"' value='" + map.get(in) + "'><br>");	%>
    <script type="text/javascript">
    	document.getElementByName('amount'+i).value = "<%=map.get(in)%>";
	</script>
 	<%}
%>

<div id="dynamicInput">
     
</div>
 <input type="button" value="Add another text input for another ingredient" onClick="addInput('dynamicInput');">

</div>

</div>
<input type="hidden" name="editingDishId" value=<%=dish.getId() %> />
<p align="center"><input type="submit" value="Edit Recipe"/></p>
</form>

</body>
</html>