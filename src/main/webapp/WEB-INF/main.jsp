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
	<title>Read Share</title>
	<link rel="stylesheet" href="/css/style.css"> 
</head>

<body>
	<div class="container">
		
		<div class="top1">
			<h1>Welcome, <c:out value="${user.userName}"/></h1>
			<a href="/logout">logout</a>
		</div>
		<div class="top2">
			<p>Books from everyone shelves:</p>
			<a href="/add">+ Add to my shelf</a>
		</div>
		
		<table class="index">
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
			</tr>
			<c:forEach var="book" items="${books}">
				<tr>
					<td><c:out value="${book.id}"/></td>
					<td><a href="books/${book.id}"><c:out value="${book.title}"/></a></td>
					<td><c:out value="${book.author}"/></td>
					<td><c:out value="${book.user.userName}"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>