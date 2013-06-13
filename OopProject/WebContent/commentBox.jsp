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
Integer userId = (Integer) request.getSession().getAttribute("userId");
User us = User.getUserById(userId);
String name = us.getName();
%>

<title>comment</title>

</head>
<body>

	<form action="AddNewComment" method="post">
		<p>
			Name:<%=" " + name%></p>
		Comments: <br />
		<textarea name="comments" id="comments" rows="3" cols="50"></textarea>
		<input type="hidden" name=userId value=<%=name%>> <input
			type="submit" value="Submit" /> <br />
	</form>
	<br />
	<%
		ArrayList<Comment> comments = (ArrayList<Comment>) request
				.getSession().getAttribute("dishComments");
		if (comments != null) {

			for (int i = 0; i < comments.size(); i++) {
				out.println("<li> <a href= \"addNewComment?id="
						+ comments.get(i).getAuthorName() + "\">"
						+ comments.get(i).text + "</a>");
			}
		}
	%>
</body>
</html>
