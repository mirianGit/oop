<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.Comment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
User us = null;
String name = "";
int userId = -1;
if(request.getSession().getAttribute("signed") != null){
	userId = User.getIdByName((String)request.getSession().getAttribute("name"));
	us = User.getUserById(userId);
	name = us.getName();
}
System.out.println(userId);
int dish_id = (Integer)request.getSession().getAttribute("dish_id");
ArrayList<Integer> comments = (ArrayList)Comment.getDishComments(dish_id);
%>


<title>comment</title>

</head>
<body>
	<%if(us != null){ %>
	<form action="AddNewComment" method="post">
		<p>
			Name:<%=" " + name%></p>
		Comments: <br />
		<textarea name="comment" id="comments" rows="3" cols="50"></textarea>
		<input type="hidden" name="dish_id" value="<%=dish_id%>">
		<input type="hidden" name=userId value=<%=userId%>> <input
			type="submit" value="Submit" Style= "text-align:center; width:100px;height:25px;padding-top: 2px;"  /> <br />
	</form>
	<br />
	<%} %>
	<%
		if (comments != null) {
			for (int i=0;i<comments.size();i++) {
				if(us != null){
					if(us.isAdmin()){
						out.println("<form action='DeleteComment'>");
						out.println("<input type='hidden' name='comment_id' value="+ comments.get(i) +">");
						out.println("<input type='hidden' name='dish_id' value="+ dish_id +">");
						out.println("<a class='buttonUser' href=DeleteComment?comment_id="+comments.get(i)+"&dish_id="+dish_id+" Style='text-align:center; font_size:10px; width:80px;height:20px;padding-top: 2px;position:absolute;right:710px;' type='submit' value='x'<a> Delete </a>");
						out.println("</form>");
					}
				}
				System.out.println(comments.get(i));
				out.println(Comment.getCommentByID(comments.get(i)).getAuthorName() + " : <p>" + Comment.getCommentByID(comments.get(i)).getText() + "</p>");
			}
		}
	%>
	<br>
	<br>
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