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
			<div class="main_nav">
				<a id=nav1 href="/logout" style="float:left">logout</a>
				<a href="/add" style="float:right">add a new record</a>
			</div>
			<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
			<p>Vinyl records on your shelf:</p>
		</div>
		
		<table class="table2">
			<tr>
				<th>Artist</th>
				<th>Title</th>
				<th>Year</th>
				<th>Label</th>
				<th>Cat No.</th>
			</tr>
			<c:forEach var="vinyl" items="${user.vinyls}">
				<tr>
					<td style="max-width: 275px"><c:out value="${vinyl.artist}"/></td>
					<td style="max-width: 275px"><a style="font-size:1rem" href="vinyls/${vinyl.id}"><c:out value="${vinyl.title}"/></a></td>
					<td style="max-width: 100px"><c:out value="${vinyl.year}"/></td>
					<td style="max-width: 100px"><c:out value="${vinyl.label}"/></td>
					<td style="max-width: 100px"><c:out value="${vinyl.cat_no}"/></td>
					<td style="max-width: 50px"><a href="/edit/${vinyl.id}"><img alt="edit" title="Edit" src="/assets/pencil.png"></a></td>
					<td style="max-width: 50px"><a href="/delete/${vinyl.id}" onclick="return confirm('${user.userName}, are you sure you want to delete ${vinyl.title}?')"><img alt="remove" role="button" title="Remove" src="/assets/delete.png"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<script>

</script>
	
</body>
</html>