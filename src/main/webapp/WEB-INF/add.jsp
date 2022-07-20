<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Share</title>
<link rel="stylesheet" href="/css/style.css"> 
</head>

<body>

<div class="container">
	<div class="top1">
		<h1>Add to Your Book Shelf!</h1>
		<a href="/main">Back to Shelves</a>
	</div>
	<div class="inner-box">
		<form:form action="/books" modelAttribute="book" class="form" method="post">
		<table>
			<tr>
				<td>
					Title:
				</td>
				<td>
					<form:errors path="title" class="error"/>
					<form:input type="text" path="title"/>
				</td>
			</tr>
			 <tr>
				<td>
					Author:
				</td>
				<td>
					<form:errors path="author" class="error"/>
					<form:input type="text" path="author"/>
				</td>
				</tr>
			<tr>
				<td>
					Thoughts:
				</td>
				<td>
					<form:errors path="thoughts" class="error"/>
					<form:textarea path="thoughts"/>
				</td>
			</tr>
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}"/>
		</table>
			<div class="buttonrow">
				<input type="submit" value="Submit"/>
			</div>
			
		</form:form>
	</div>
</div>
</body>
</html>