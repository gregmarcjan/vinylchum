<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Vinyl Chum - search online</title>
	<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>
	<div class="container">
		<div class="main_box">
			<div class="main_nav">
				<a id=nav1 href="/main" style="float:left">return</a>
				<a href="/add" style="float:right">add a new record</a>
			</div>
			<h1>Search for LPs!</h1>
			<p>Enter your query here:</p>
		<form:form action="https://www.discogs.com/search/?q=artist&=title&format_exact" class="form" method="get" target="_blank">
		<table class="table1">
			<tr>
				<td>
					Artist:
				</td>
				<td>
					<input type="text" name="artist"/>
				</td>
			</tr>
			<tr>
				<td>
					Album:
				</td>
				<td>
					<input type="text" name="title"/>
					<input type=hidden name="format_exact" value="LP"/>
				</td>
			</tr>
		</table>
			<div class="buttonrow">
				<input type="submit" value="Search"/>
			</div>
		</form:form>
		</div>
	</div>
	
<script>

</script>
	
</body>
</html>