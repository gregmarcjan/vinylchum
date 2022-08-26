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
<title>Vinyl Chum - add a new record to your collection</title>
<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>

<div class="container">
	<div class="main_box">
		<a href="/main">Back to Shelves</a>
		<a href="/searchbox">Search on Discogs.com</a>
		<h1>Add to your collection:</h1>	
		<form:form action="/vinyls" modelAttribute="vinyl" class="form" method="post">
		<table class="table1">
			<tr>
				<td>
					Artist:
				</td>
				<td>
					<form:errors path="artist" class="error"/>
					<form:input type="text" path="artist"/>
				</td>
			</tr>
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
					Year:
				</td>
				<td>
					<form:errors path="year" class="error"/>
					<form:input type="text" path="year"/>
				</td>
			</tr>
			<tr>
				<td>
					Label:
				</td>
				<td>
					<form:errors path="label" class="error"/>
					<form:input type="text" path="label"/>
				</td>
			</tr>
			<tr>
				<td>
					Catalog no.:
				</td>
				<td>
					<form:errors path="cat_no" class="error"/>
					<form:input type="text" path="cat_no"/>
				</td>
			</tr>
			<tr>
				<td>
					UPC no.:
				</td>
				<td>
					<form:errors path="upc_no" class="error"/>
					<form:input type="text" path="upc_no"/>
				</td>
			<tr>
				<td>
					Notes:
				</td>
				<td>
					<form:errors path="notes" class="error"/>
					<form:textarea path="notes" rows="4" style="width: 100%;"/>
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