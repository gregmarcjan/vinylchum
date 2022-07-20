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
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
	<link rel="stylesheet" href="/css/style.css"> 
</head>

<body>

<div class=container>
	<div class="top_box">
		<img id="logo" alt="vinyl_record" src="/assets/vinyl.png">
	</div>
	<div class="bottom_box">
	<h1>Vinyl Chum</h1>
	<p>Log in to your library<p>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<table>
					<tr>
						<td>
							Email:
						</td>
						<td>
							<form:errors path="email"/>
							<form:input path="email"/>
						</td>
					</tr>
					<tr>
						<td>
							Password:
						</td>
						<td>
							<form:errors path="password"/>
							<form:input path="password"/>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
	        	<input type="submit" value="Submit"/>
	       	</div>
		</form:form>
	</div>
	<p class="register_line">New to Vinyl Chum? Register&nbsp;<a href="/registration">here.</a></p>
</div>

</body>
</html>