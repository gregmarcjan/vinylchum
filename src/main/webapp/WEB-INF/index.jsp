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

<!-- MAIN CONTAINER -->

<div class="container">

	<!-- LOGO CONTAINER START -->

	<div class="index_logo">
		<img id="logo" alt="vinyl_record" src="/assets/vinyl.png">
	</div>
	
	<!-- DIALOG BOX CONTAINER Start -->
	
	<div class="index_box">
		<h1>Vinyl Chum</h1>
		<p>Log in to your library<p>
		<form:form action="/login" method="post" modelAttribute="newLogin">
		<form:errors path="email" cssClass="error-messages"/>
		<form:errors path="password" cssClass="error-messages"/>
			<table class="table1">
				<tr>
					<td>
						Email:
					</td>
					<td>
						<form:input path="email" type="email" cssErrorClass="error-input" />
					</td>
				</tr>
				<tr>
					<td>
						Password:
					</td>
					<td>
						<form:input type="password" path="password" cssErrorClass="error-input" />
					</td>
				</tr>
			</table>
				
			<!-- BUTTON ROW CONTAINER -->
				
			<div class="buttonrow">
		        <input type="submit" value="Submit"/>
		    </div>
		</form:form>
	</div>
	<p class="register_line">New to Vinyl Chum? Register&nbsp;<a href="/registration">here.</a></p>
</div>

</body>
</html>