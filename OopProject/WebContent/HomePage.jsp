<%@page import="Model.User"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<% ArrayList<Dish> randomDishes = (ArrayList<Dish>) request
								.getSession().getAttribute("randomDishes");%>

	<head>
	<jsp:include page="Header.jsp" />
	
	
	
	</head>
	<body>
    <div id="container">
      <header>
        <nav>
          <ul id="nav">
            <li><a href="Home" class="current">Home</a></li>
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
             
							</a>
			
          
          </ul>
        </nav>
        <hgroup class="intro">
          <h1 class="title">Recipes</h1>
        </hgroup>
        <div class="reservations"><br />
         				<%
					if (request.getSession().getAttribute("signed") == null ){
				%>

				<div style="margin-top:20px"> <a class="button" href="Register.jsp" title="Register">Register</a> </div>
          <div style="margin-top:20px"> <a class="button" href="Login.jsp" title="sign in">sign in</a> </div> <%
 	} else {
 %>

				 <div style="margin-top:20px">
				 <%
				 String name=(String)request.getSession().getAttribute("name");
				 int id=User.getIdByName(name);
						 User us=User.getUserById(id);%>
						 
					<a class=hello href="userServlet?id=<%=us.getId() %>"> Hello, <%=us.getName()%></a></div>
				
				 <div style="margin-top:20px"> <a class="button" href="LogOut" title="log out">log out</a> </div> <%
				
 	}
 %>
          
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
      </header>
      <div class="wrapper">
        <div class="pikachoose">
          <ul id="pikame">
            <li><a href=""><img src="images/home/1.jpg" alt="" /></a></li>
            <li><a href=""><img src="images/home/2.jpg" alt="" /></a></li>
            <li><a href=""><img src="images/home/3.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div class="clear"></div>
        <div class="border"></div>
        <%for(int i=0;i<3;i++){
        	if(i==randomDishes.size())break;
        	 Dish d=randomDishes.get(i);
        	 String text=d.getReceipt();
        	 if(text.length()>250)  text=text.substring(0, 250);
        	%> <div class="home-widget">
        		  <h3><a href= "DishServlet?id=<%=d.getId() %>"><%=d.getName() %></a></h3>
        		    <img src="<%=d.getPicture()%>"  width="300" height="200" alt="" />
        		    <p><%=text %> 
        		    <a href= "DishServlet?id=<%=d.getId() %>">  See Full Recipe</a></p>
        		     </div>
        	<% 
        	
        }%>
        
        
      <footer>
        <div class="border"></div>
        <div class="footer-widget">
          <h4>Top recipes</h4>
           <ul class=blog>
            <%  
 	ArrayList <Dish> topTen = (ArrayList<Dish>) request.getSession().getAttribute("topTen"); 
  	if(topTen != null){	
  	 	if(topTen.size() > 10){ 
 	for(int i = 0; i < 10; i++){ 
 	 			out.println("<li> <a href= \"DishServlet?id=" + topTen.get(i).getId()
 				+ "\">" +  topTen.get(i).getName()  + "</a>"); 
 	 		}
  		}else{
  			for(int i = 0; i < topTen.size(); i++){
  				out.println("<li> <a href= \"DishServlet?id=" + topTen.get(i).getId()
 				+ "\">" +  topTen.get(i).getName()  + "</a>"); 
  			}
  		}
  	}
 %>
          </ul>
        </div>
        <div class="footer-widget">
          <h4>random Recipes</h4>
          <ul class="blog">
               	<%
						
						if (randomDishes != null) {
							if (randomDishes.size() > 10) {
								for (int i = 0; i < 10; i++) {
									out.println("<li> <a href= \"DishServlet?id="
											+ randomDishes.get(i).getId() + "\">"
											+ randomDishes.get(i).getName() + "</a>");
								}
							} else {
								for (int i = 0; i < randomDishes.size(); i++) {
									out.println("<li> <a href= \"DishServlet?id="
											+ randomDishes.get(i).getId() + "\">"
											+ randomDishes.get(i).getName() + "</a>");
								}
							}
						}
					%>
          </ul>
        </div>
        <div class="footer-widget">
          <h4>new Recipes</h4>
           <ul class="blog">
           
           	<%
						ArrayList<Dish> lastApprovedDishes = (ArrayList<Dish>) request
								.getSession().getAttribute("lastApprovedDishes");

						if (lastApprovedDishes != null) {
							if (lastApprovedDishes.size() > 10) {
								for (int i = 0; i < 10; i++) {
									out.println("<li> <a href= \"DishServlet?id="
											+ lastApprovedDishes.get(i).getId() + "\">"
											+ lastApprovedDishes.get(i).getName() + "</a>");
								}
							} else {
								for (int i = 0; i < lastApprovedDishes.size(); i++) {
									out.println("<li> <a href= \"DishServlet?id="
											+ lastApprovedDishes.get(i).getId() + "\">"
											+ lastApprovedDishes.get(i).getName() + "</a>");
								}
							}
						}
					%>
           
           
		
             </ul>
        </div>
        
       </footer>
	</div>
	<div class="border2">
	<br></div>
	<br>
	<br>
	<br>
	 <br />
    <span class="copyright"><span class="left"><br />
     For more information contact us <a href="AboutAs.jsp">see Information</a></span><span class="right"><br />
    <a href=#></a>  <a href=#></a><br />
    <br />
    <br />
    </span></span></footer>
</body>
</html>