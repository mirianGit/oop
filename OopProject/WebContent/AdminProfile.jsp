<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%;width:  100%;">
<head>
<style >


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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	Integer id = (Integer) request.getSession().getAttribute("id");
	int dish_id=-1;
	User us = User.getUserById(id);
	String name = us.getName();
	Collection<Dish> c =(Collection) request.getSession().getAttribute("notApproved");
	ArrayList<Dish> dishes = (ArrayList<Dish>) request.getSession()
			.getAttribute("dishes");
%>
<title><%=name%>'s profile</title>
</head>
<script>
 function Approve(key) {
	document.getElementById("frm1").hidden.value=key;
	document.getElementById("frm1").submit();
}
</script>





<body>
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
	</nav> </header>
	
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
      <h4>Non approved Items</h4>
      
      
       </div>
         <div class="footer-widget">
      <h4>My recipes</h4>
       </div>
        <div class="footer-widget">
      <h4>Menu</h4>
      </div>
      <div class="border2"> </div>
      <br>
      
       <div class="footer-widget">
      	<form id="frm1"  method="get" action="ApproveServlet" >
		<input type="hidden" name="hidden">
        <%	if(c.isEmpty()) %> <a Style= "font-size:22px; text-align:center; width:250px; position:absolute;left:230px;top:360px">There is nothing to approve</a>
    	 <ul class="blog">
    	
    	<%	
    		for(Dish d:c){
    		
    			String dish_name= d.getName();
    			 dish_id=d.getId();
    			%>
    			
    			<li><a href= "DishServlet?id=<%=dish_id %>"><%=dish_name %>&nbsp;</a><input type="button" value="Approve" onclick="Approve(<%=dish_id %>)" /></li><% 
    	
     	}
    	
     %>
        
        
        
	

      </ul>
      </form>
   
  </div>
   <div class="footer-widget">
      <ul class="blog">
      <%
      for (int i = 0; i < dishes.size(); i++) {
			
			Dish d = dishes.get(i);
			int dishId=d.getId();
			String dish_name= d.getName();
			int approved=d.getApproved();
			String status;
			if(approved==1) status="approved";
			else status ="not approved yet";
			%> <li><a href="DishServlet?id=<%=dishId %>"><b><%=dish_name %></b></a> <a><%=status %></a><br/></li><% 
	
 	}
	
 %>
       
        
      </ul>
      </div>
     <div class="footer-widget">
     <br>
       <p><a href = "allUsersServlet" Style= "font-size:22px; text-align:center; width:250px; position:absolute;right:230px;top:360px"> Edit Users</a></p>
     
</div>
    </footer>
    <br>
	
	<br>
    <br />
    <br />
     
 <div class="border2" style="position: absolute; text-align:left; left:200px; right:200px;bottom:100px"></div>
  	  <span class="copyright" style="position: absolute; text-align:left; width:500px;left:200px ;bottom:50px"><span class="left"><br />
     For more information contact us <a href="AboutAs.jsp">see Information</a></span><span class="right"><br />
    <a href=#></a>  <a href=#></a>
    
	</span>
</div>
</body>
</html>