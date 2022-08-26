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
				<a id=nav1 href="/logout" style="float:left">logout</a>
				<a href="/add" style="float:right">add a new record</a>
			</div>
			<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
			<p>Vinyl records on your shelf:</p>
		</div>
		
		<table class="table2">
			<tr>
				<th>Artist - Title</th>
				<th>Year</th>
				<th>Country</th>
				<th>Label</th>
				<th>Cat No.</th>
				<th>Art</th>
			</tr>
			<c:forEach var="lp" items="${results}">
				<tr>
					<td style="max-width: 400px">${lp.getString("title")}"></td>
					<td style="max-width: 100px">${lp.getString("year")}"></td>
					<td style="max-width: 100px">${lp.getString("country")}"></td>
<%-- 					<td style="max-width: 100px">${lp.getString("label")}"></td> --%>
<%-- 					<td style="max-width: 100px">${lp.getString("catno")}"></td> --%>
					<td style="max-width: 50px"><img alt="edit" title="Edit" src="/assets/pencil.png"></td>
					<td style="max-width: 50px"><img alt="remove" role="button" title="Remove" src="/assets/delete.png"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<script>

</script>
	
</body>
</html>