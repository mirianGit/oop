<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

blockquote {
	background: transparent url(../images/blockquote.png) no-repeat 0px 30px;
	padding: 30px;
	font-style: italic;
}

blockquote span {
	font-weight: bold;
	clear: both;
	float: right;
	margin-top: 20px;
}
.blog {
	width: 500px;
	text-align: left;
	font-size: 20px;
	padding: 10px;
	padding-left:10px;
	margin-left: 20px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	Integer id = (Integer) request.getSession().getAttribute("id");
	User us = User.getUserById(id);
	String name = us.getName();
	ArrayList<Dish> wishlist = (ArrayList<Dish>) request
			.getSession().getAttribute("wishlist");
	ArrayList<Dish> dishes = (ArrayList<Dish>) request
			.getSession().getAttribute("dishes");
%>
<title><%=name%>'s profile</title>

</head>
<body >
<jsp:include page="Header.jsp" />

 <div id="container">
      <header>
        <nav>
          <ul id="nav">
            <li><a href="Home" class="other">Home</a></li>
            <li><a href=Receipts class="other">All Recipes</a></li>
             <li><a href="SearchByIngredients" class="other">Extended Search</a></li>
            <li><a href=AddNewRecipe class="other">Add New Recipe</a></li>
           
            
             <li><a class="search">
             <div id="tw-form-outer">
		<form action="SearchServlet" method="get" id="tw-form">
			<input type="text" id="tw-input-text" name="name" value='search'
				onfocus="if(this.value=='search'){this.value='';}"
				onblur="if(this.value==''){this.value='search';}" /> <input
				type="submit" id="tw-input-submit" value="" />
		</form>
	</div>
	</nav> 
	</header>
	
	   <hgroup class="intro">
          <h1 class="title2"><%=name%>'s profile</h1>
        </hgroup>
        
        
         <div style="margin-top:20px"> <a class="buttonUser" style="position: absolute; text-align:center; width:100px;right:200px" href="LogOut" title="log out">log out</a> </div> 
				
    <footer>
     <br>
      <br>
       <br>
    <div class="border"></div>
    <div class="footer-widget">
      <h4 style="position: absolute; left:400px">Wishlist </h4>
		
       </div>
  
     
    
    <div class="footer-widget">
      <h4 style="position: absolute; right:400px">My recipes</h4>
     </div>
     
	<br><br><br>
     <div class="border2"></div>
      <div class="footer-widget">
        <ul class="blog"  style="position: absolute; text-align:centre; width:150px;left:350px">
        <%
		for (int i = 0; i < wishlist.size(); i++) {
			Dish d = wishlist.get(i);
			int dishId=d.getId();
			String dish_name= d.getName();
			%> <li><a href="DishServlet?id=<%=dishId %>"><%=dish_name %></a><br/></li><% 
	
 	}
	
 %>
  </ul>
  </div>
   <div class="footer-widget">
  <ul class="blog"  style="position: absolute; text-align:centre; width:150px;right:350px">
     
  <%
      for (int i = 0; i < dishes.size(); i++) {
			
			Dish d = dishes.get(i);
			int dishId=d.getId();
			String dish_name= d.getName();
			%> <li><a href="DishServlet?id=<%=dishId %>"><%=dish_name %></a><br/></li><% 
	
 	}
	
 %>
 
        
      </ul>
      </div>
    </div>
    </footer>
    
    <br>
	 
	<br>
	
	<br>
    
    
    
     <div class="border2" style="position: absolute; text-align:left; left:200px; right:200px;bottom:100px"></div>
  	  <span class="copyright" style="position: absolute; text-align:left; width:500px;left:200px ;bottom:50px"><span class="left"><br />
     For more information contact us <a href="AboutAs.jsp">see Information</a></span><span class="right"><br />
    <a href=#></a>  <a href=#></a>
    
	</span>
  
   






</body>
</html>