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
	<title>Vinyl Chum - your vinyl record library!</title>
	<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>
	<div class="container">
		<div class="main_box">
			<a href="/logout">logout</a>
			<a href="/add">add a new record</a>
			<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
			<p>Vinyl records on your shelf:</p>
		</div>
		
		<table class="table2">
			<tr>
				<th>ID</th>
				<th>Artist</th>
				<th>Title</th>
				<th>Released in</th>
				<th>Label</th>
				<th>Catalog no.:</th>
				<th>UPC no.:</th>
			</tr>
			<c:forEach var="vinyl" items="${vinyls}">
				<tr>
					<td><c:out value="${vinyl.id}"/></td>
					<td><c:out value="${vinyl.artist}"/></td>
					<td><a href="vinyls/${vinyl.id}"><c:out value="${vinyl.title}"/></a></td>
					<td><c:out value="${vinyl.year}"/></td>
					<td><c:out value="${vinyl.label}"/></td>
					<td><c:out value="${vinyl.cat_no}"/></td>
					<td><c:out value="${vinyl.upc_no}"/></td>
					<td><a href="/edit/${vinyl.id}">Edit</a></td>
					<td><a href="/delete/${vinyl.id}">Remove</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>