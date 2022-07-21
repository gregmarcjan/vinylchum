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
	<title>Vinyl Chum</title>
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
	<p>New user registration<p>
				<form:form action="/register" method="post" modelAttribute="newUser">
			<table class="table1">
				<thead>
				</thead>
					<tr>
						<td>
							User Name:
						</td>
						<td>
							<form:errors path="userName"/>
							<form:input path="userName"/>
						</td>
					</tr>
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
							<form:input type="password" path="password"/>
						</td>
					</tr>
					<tr>
						<td>
							Confirm password:
						</td>
						<td>
							<form:errors path="confirm"/>
							<form:input type="password" path="confirm"/>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
	        	<input type="submit" value="Submit"/>
	       	</div>
		</form:form>
	</div>
	<p class="register_line">Already a user? Login&nbsp;<a href="/">here.</a></p>
</div>

</body>
</html>