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
<meta  http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String name = "Salome";
%>

<title>comment</title>
<style type="text/css">
body {
	background-color: #f0f0ee;
	font: 1em "Trebuchet MS";
}

.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: ".";
	clear: both;
	height: 0;
	line-height:
}

.clearfix {
	display: inline-block;
}

* html .clearfix {
	height: 1%;
}

.bubble-list .bubble img {
	float: left;
	width: 70px;
	height: 70px;
	border: 3px solid #ffffff;
	border-radius: 10px
}

.bubble-content {
	position: relative;
	float: left;
	margin-left: 12px;
	width: 400px;
	padding: 0px 20px;
	border-radius: 10px;
	background-color: #FFFFFF;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, .2);
}

.bubble {
	margin-top: 20px;
}

textarea#styled {
	width: 600px;
	height: 120px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-image: url(bg.gif);
	background-position: bottom right;
	background-repeat: no-repeat;
}

.point {
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
	border-right: 12px solid #FFF;
	position: absolute;
	left: -10px;
	top: 12px;
}
</style>
</head>
<body>
	<p>
		Name:<%=" " + name%></p>


	Comments:
	<br />
	<textarea name="comments" id="comments" rows="3" cols="50">
</textarea>
	<input type="submit" value="Submit" />
	<br />
	</form>
	<br />
	<div class="bubble clearfix">
	<img
		src="http://sphotos-e.ak.fbcdn.net/hphotos-ak-snc6/179920_416135301763046_1504814790_n.jpg" width="10" height="10">
	<div class="bubble-content">
		<div class="point"></div>
		<p>dsmatebuli komentari</p>
	</div>
	
		<%
		ArrayList <Comment> comments = (ArrayList<Comment>) request.getSession().getAttribute("dishComments"); 
	if(comments != null){	
		
		for(int i = 0; i < comments.size(); i++){
			out.println("<li> <a href= \"addNewComment?id=" +  comments.get(i).getAuthorName()
			+ "\">" + comments.get(i).text  + "</a>"); 
		}
	}

	%>
</body>
</html>
