<%@page import="Model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,address
	{
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	font-size: inherit;
}


fieldset,img {
	border: 0;
}

address,caption,cite,code,dfn,em,strong,th,var {
	font-style: normal;
	font-weight: normal;
}
addr {
	font-style: normal;
	font-weight: normal;
	text-align: ;
}


li {
	list-style: none;
}

caption,th {
	text-align: left;
}

q:before,q:after {
	content: '';
}

abbr,acronym {
	border: 0;
	font-variant: normal;
}

sup {
	vertical-align: text-top;
}

sub {
	vertical-align: text-bottom;
}

input,textarea,select {
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
}

legend {
	color: #000;
}

pre,code,kbd,samp,tt {
	font-family: monospace;
	line-height: 100%;
}

em {
	font-style: italic;
}

strong {
	font-weight: bold;
}

@font-face {
	font-family: 'Lobster13Regular';
	src: url('styles/Lobster_1.3-webfont.eot');
	src: url('styles/Lobster_1.3-webfont.eot?#iefix')
		format('embedded-opentype'), url('styles/Lobster_1.3-webfont.woff')
		format('woff'), url('Lobster_1.3-webfont.ttf') format('truetype'),
		url('Lobster_1.3-webfont.svg#Lobster13Regular') format('svg');
	font-weight: normal;
	font-style: normal;
}

body {
	background: #f5f0e0 url(images/noise.png);
	font-family: Century Gothic, sans-serif;
	color: #252525;
	font-size: 14px;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.10);
}

h1 {
	font-size: 50px;
}

h2 {
	font-size: 45px;
}

h3 {
	font-size: 40px;
}

h4 {
	font-size: 35px;
}

h1,h2,h3,h4 {
	font-family: 'Lobster13Regular', cursive;
	color: #9c5959;
	text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
	font-weight: normal;
}

a {
	color: #9c5959;
	text-decoration: none;
	border-bottom: 1px dotted #9c5959;
}

.pikachoose a,#fancybox-close,.fancyimage {
	border-bottom: 0px dotted #9c5959;
}

.clear {
	clear: both;
}

.left {
	float: left;
	margin-right: 10px;
}

.right {
	float: right;
	margin-left: 10px;
}

.title {
	font-family: 'Lobster13Regular', cursive;
	font-size: 80px;
	float: left;
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
}
.title2 {
	font-family: 'Lobster13Regular', cursive;
	font-size: 50px;
	float: left;
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
}

p.main {
width: 500px;
	float: left;
	margin-top: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
	text-align: left;

text-align:justify;
}

.title:hover {
	text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb, 0 4px 0
		#b9b9b9, 0 5px 0 #aaa, 0 6px 1px rgba(156, 89, 89, .1), 0 0 5px
		rgba(156, 89, 89, .1), 0 1px 3px rgba(156, 89, 89, .3), 0 3px 5px
		rgba(156, 89, 89, .2), 0 5px 10px rgba(156, 89, 89, .25), 0 10px 10px
		rgba(156, 89, 89, .2), 0 20px 20px rgba(156, 89, 89, .15);
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
}

.tagline {
	font-family: 'Lobster13Regular', cursive;
	clear: both;
	font-size: 2px;
	float: left;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.10);
}

.intro {
	float: left;
	width: 500px;
}

.reservations {
	float: right;
	width: 200px;
	font-family: 'Lobster13Regular', cursive;
	font-size: 20px;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.10);
	text-align: center;
	color: #9C5959;
}

.reservations-title {
	font-size: 27px;
}

.hr-solid {
	border: 0;
	border-bottom: 1px solid #9c5959;
	margin: 2px;
}

.hr-dashed {
	border: 0;
	border-bottom: 1px dotted #9c5959;
	margin: 2px;
}

.button {
	font-family: 'Lobster13Regular', cursive;
	color: #f5f5f5;
	padding: 8px 14px 10px;
	background-color: #9c5959;
	border: none;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	-webkit-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-moz-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	-moz-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-decoration: none;
	font-size: 20px;
}

a.hello {
	font-family: 'Lobster13Regular', cursive;
	border: none;
	padding: 4px 47px 9px;
	position: relative;
	right: 60px;
	text-align: left;
	text-decoration: none;
	border-bottom: 0px dotted #9c5959;
}

.reservations .button {
	display: block;
	width: 60px;
	padding: 4px 47px 9px;
}

.button:active {
	position: relative;
	top: 3px;
	-webkit-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0
		0px 3px rgba(0, 0, 0, 0.9);
	-moz-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px
		3px rgba(0, 0, 0, 0.9);
	box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px 3px
		rgba(0, 0, 0, 0.9);
}

.button:active:after {
	content: "";
	width: 100%;
	height: 3px;
	background: #fff;
	position: absolute;
	bottom: -1px;
	left: 0;
}

.date {
	float: left;
	position: relative;
	margin-right: 10px;
	padding: 44px 5px 0;
	color: #9c5959;
}

.date .month {
	text-transform: uppercase;
	font-size: 25px;
}

.date .day {
	font-size: 35px;
	line-height: 45px;
	position: absolute;
	left: 5px;
	top: 0;
}

.date .year {
	display: block;
	position: absolute;
	right: -5px;
	top: 15px;
	-webkit-transform: rotate(-90deg);
	-moz-transform: rotate(-90deg);
	-o-transform: rotate(-90deg);
	-ms-transform: rotate(-90deg);
	transform: rotate(-90deg);
}

#container {
	background: url(images/bg.png) center top repeat-x;
	width: 960px;
	margin-left: auto;
	margin-right: auto;
}

ul#nav {
	font-family: 'Lobster13Regular', cursive;
	width: 1000px;
	margin: 0 auto;
	text-align: center;
	overflow: hidden;
	font-size: 21px;
	letter-spacing: 1px;
}

ul#nav li {
	float: left;
	list-style: none;
}

ul#nav li a.search {
	letter-spacing: 2px;
	display: block;
	width: 300px;
	height: 100px;
	padding: 65px 0 0 0;
	margin: 0 32px 0 32px;
	color: #9c5959;
	text-decoration: none;
	border-bottom: 0px dotted #9c5959;
}

#tw-form {
	font-family: Tahoma, Geneva, sans-serif;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border: #aaa 1px solid;
	background: #DDDDDD;
	background: -moz-linear-gradient(top, #C4C4C4 0%, #EAEAEA 0%, #D3D3D3 100%);
	/* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #C4C4C4),
		color-stop(0%, #EAEAEA), color-stop(100%, #D3D3D3)); /* webkit */
	filter: progid:DXImageTransform.Microsoft.gradient(   startColorstr='#C4C4C4',
		endColorstr='#D3D3D3', GradientType=0); /* ie */
	width: 175px;
	float: left;
	padding: 0 4px;
	border-top-left-radius: 4px 4px;
	border-top-right-radius: 4px 4px;
	border-bottom-right-radius: 4px 4px;
	border-bottom-left-radius: 4px 4px;
}

#tw-form #tw-input-text {
	width: 145px;
	float: left;
	border: 0;
	background: #DDDDDD;
	background: -moz-linear-gradient(top, #C4C4C4 0%, #EAEAEA 0%, #D3D3D3 100%);
	/* firefox */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #C4C4C4),
		color-stop(0%, #EAEAEA), color-stop(100%, #D3D3D3)); /* webkit */
	filter: progid:DXImageTransform.Microsoft.gradient(   startColorstr='#C4C4C4',
		endColorstr='#D3D3D3', GradientType=0); /* ie */
	color: #777;
	line-height: 100%;
	font-size: 12px;
	font-family: Tahoma, Geneva, sans-serif;
	margin-top: 3px;
	margin-bottom: 3px;
	height: 20px;
}

#tw-form #tw-input-text:focus {
	outline: none;
	color: #333;
}

#tw-form #tw-input-submit {
	background: url(search-zoom-icon.png) no-repeat 8px 5px;
	border: 0;
	float: left;
	width: 22px;
	z-index: 100;
	cursor: pointer;
}

ul#nav li a.other {
	letter-spacing: 2px;
	display: block;
	width: 95px;
	height: 85px;
	padding: 65px 0 0 0;
	margin: 0 32px 0 32px;
	color: #9c5959;
	text-decoration: none;
	background: url('images/label.png') 0 -149px no-repeat;
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
	border-bottom: 0px dotted #9c5959;
}

ul#nav li a.current {
	letter-spacing: 2px;
	display: block;
	width: 95px;
	height: 85px;
	padding: 65px 0 0 0;
	margin: 0 32px 0 32px;
	text-decoration: none;
	background: url(images/label.png) 0 0 no-repeat;
	color: #eee9d9;
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
	border-bottom: 0px dotted #9c5959;
}

ul#nav li a.other:hover {
	background: url(images/label.png) 0 0 no-repeat;
	color: #eee9d9;
	-webkit-transition: all .20s ease-out;
	-moz-transition: all .20s ease-out;
	-o-transition: all .20s ease-out;
	-ms-transition: all .20s ease-out;
	transition: all .20s ease-out;
}

.border {
	height: 3px;
	border-top: 1px solid #9c5959;
	border-bottom: 1px dashed #9c5959;
}

.border2 {
	height: 3px;
	clear: both;
	border-bottom: 1px solid #9c5959;
	border-top: 1px dashed #9c5959;
}

.border3 {
	height: 3px;
	clear: both;
	border-bottom: 1px dotted #9c5959;
}

.wrapper {
	margin-top: 30px;
}

p {
	font-size: 14px;
	font-family: Century Gothic, sans-serif;
	padding: 10px;
}

article {
	width: 630px;
	float: left;
	padding: 10px;
	border-right: 1px dashed #9c5959;
}

.fullwidth {
	border-right: 0px dashed #9c5959;
	width: 960px;
}

.sidebar {
	width: 280px;
	height: 100%;
	float: right;
	padding: 10px;
}

aside h3,.footer-widget h4 {
	text-align: center;
}

.home-widget,.footer-widget {
	width: 310px;
	float: left;
	margin-top: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
	text-align: left;
}


.content-widget,.content-menu {
	margin-right: 10px;
	margin-bottom: 50px;
}

.home-widget h3 {
	text-align: center;
	margin-bottom: 10px;
}

.content-widget h1,.content-menu h1 {
	text-align: center;
	margin-bottom: 10px;
}

.home-widget img {
	background: #9C5959;
	padding: 1px;
	margin-left: 4px;
	-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.pikachoose img,article img,aside img {
	background: #9C5959;
	padding: 1px;
	-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.50);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.noeffects {
	background: none;
	padding: 0;
	margin-left: 0;
	-webkit-box-shadow: 0 0 0 rgba(0, 0, 0, 0.50);
	-moz-box-shadow: 0 0 0 rgba(0, 0, 0, 0.50);
	box-shadow: 0 0 0 rgba(0, 0, 0, 0.50);
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
}

.content-widget img {
	float: right;
	padding: 10px;
	margin: 10px;
	-webkit-box-shadow: 0 0 5px #000;
	-moz-box-shadow: 0 0 5px #000;
	box-shadow: 0 0 5px #000;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.img-left {
	float: left;
	padding: 1px;
	margin-right: 10px;
	-webkit-box-shadow: 0 0 5px #000;
	-moz-box-shadow: 0 0 5px #000;
	box-shadow: 0 0 5px #000;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}

.img-right {
	float: right;
	padding: 1px;
	margin-left: 10px;
	-webkit-box-shadow: 0 0 5px #000;
	-moz-box-shadow: 0 0 5px #000;
	box-shadow: 0 0 5px #000;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
}
textarea {
	width: 400px;
	height: 200px;
}
input[type="text"]:active, input[type="text"]:focus {
	border: 1px dashed #9C5959;
}
textarea:active, textarea:focus {
	border: 1px dashed #9C5959;
}

input, textarea, select {
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
}

footer p {
	font-size: 14px;
	margin-right: 5px;
}

footer {
	clear: both;
	height: auto;
	padding-bottom: 2px;
}
reservations.a.otherClass{

border: none;
	padding: 4px 47px 9px;
	position: relative;
	width:200px;
	right: 60px;
	text-align: left;
	text-decoration: none;
	
	
}
reservations.a.otherClass.link{

border: none;
	
	text-align: left;
	text-decoration: none;
	
	
}

label {
	font-size: 22px;
	font-family: 'Lobster13Regular', cursive;
	color: #9c5959;
	text-shadow: 0px 1px 1px rgba(0, 0, 0, 0.2);
	font-weight: normal;
	padding-bottom: 10px;
	padding-top: 10px;
}

input[type="text"], textarea {
	font-family: Century Gothic, sans-serif;
	font-size:18px;
	outline: none;
	background: #f5f0e0;
	border: 1px dotted #9C5959;
	font-size: 14px;
	padding: 3px;
}
input[type="text"] {
	font-family: Century Gothic, sans-serif;
font-size:18px;
	width: 300px;
}
textarea {
font-size:18px;
	font-family: Century Gothic, sans-serif;
	width: 400px;
	height: 200px;
}
input[type="text"]:active, input[type="text"]:focus {
	font-size:18px;
		font-family: Century Gothic, sans-serif;
	border: 1px dashed #9C5959;
}
textarea:active, textarea:focus {
	font-family: Century Gothic, sans-serif;
font-size:18px;
	border: 1px dashed #9C5959;
}
a.user{
font-size: 18px;

	color: #9c5959;
	text-shadow: none;
}
.buttonUser {
	font-family: 'Lobster13Regular', cursive;
	color: #f5f5f5;
	padding: 8px 14px 10px;
	background-color: #9c5959;
	border: none;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	-webkit-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-moz-box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	box-shadow: inset 0px -3px 1px rgba(0, 0, 0, 0.45), 0px 2px 2px
		rgba(0, 0, 0, 0.25);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	-moz-text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	text-decoration: none;
	font-size: 20px;
}
.buttonUser:active {
	position: relative;

	-webkit-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0
		0px 3px rgba(0, 0, 0, 0.9);
	-moz-box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px
		3px rgba(0, 0, 0, 0.9);
	box-shadow: inset 0px -3px 1px rgba(255, 255, 255, 1), inset 0 0px 3px
		rgba(0, 0, 0, 0.9);
}

.buttonUser:active:after {
	content: "";
	width: 100%;
	height: 3px;
	background: #fff;
	position: absolute;
	bottom: -1px;
	left: 0;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home Page</title>

<link href="styles/base.css" rel="stylesheet" type="text/css"
	media="screen" />
<script type="text/javascript"
	src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#pikame").PikaChoose();
	});
</script>
</head>
<body>
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>header</title>
		</head>
		<body>

		</body>
</html>

<%@page import="Model.User"%>
