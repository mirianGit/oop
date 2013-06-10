<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body bgcolor="#F7F8E0">

<BODY>


<h3><a href = "Home"> Homepage </a></h3>


<form action="AddMoreIngredients" method="post" >
<input name="jsp" type="hidden" value= "SearchByIngredients.jsp"/>

<input type = "submit" value= "Add more ingredients" />
</form>

 <form action="SearchByIngredientsServlet" >
<% for (int i = 0; i < 3; i++){ 
	String fieldname = "ingredient" + i;%>
	<p>Ingredient: <input type="text" name= <%=fieldname %>/> 
<% } %>




<% Integer num = (Integer)request.getSession().getAttribute("numAdded");
	if(num != null){%>
		<% for(int j = 0; j < num; j++){
			String fieldname = "ingredient" + (3 + j);
		%>
			<p>Ingredient: <input type="text" name=<%=fieldname %> />
		<% }
	}
%>


<p><input type = "submit" value= "Search" /></p>

</form>



</body>
</html>