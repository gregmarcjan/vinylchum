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
<title>Read Share</title>
<link rel="stylesheet" href="/css/style.css"> 
</head>
<body>
	<div class="container">
		<div class="top1">
			<h1><c:out value="${book.title}"/></h1>
			<a href="/main">Back to Shelves</a>
		</div>
		
		<div class="container">
			<h3><span style="color: red;"><c:out value="${book.user.userName}"/></span> read 
			<span style="color: darkviolet;"><c:out value="${book.title}"/></span> by 
			<span style="color: darkgreen;"><c:out value="${book.author}"/></span></h3>
		</div>
		
		<div class="container2">
			<h4>Here are <c:out value="${book.user.userName}"/>'s thoughts:</h4>
			<hr />
			<p><c:out value="${book.thoughts}"/></p>
			<hr />
		
		</div>
	</div>

</body>
</html>