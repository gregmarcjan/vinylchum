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

<div class=container>
	
	<h1>Book Club</h1>
	<p>A place for friends to share thoughts on books.<p>
	
	<div class="inner_box">
		<form:form action="/register" method="post" modelAttribute="newUser">
			<table>
				<thead>
					<tr>			
						<td class=header colspan="2">Register</td>
					</tr>
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
							<form:input path="password"/>
						</td>
					</tr>
					<tr>
						<td>
							Confirm password:
						</td>
						<td>
							<form:errors path="confirm"/>
							<form:input path="confirm"/>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
	        	<input type="submit" value="Submit"/>
	       	</div>
		</form:form>
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<table>
				<thead>
					<tr>			
						<td class="header" colspan="2">Log In</td>
					</tr>
				</thead>
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
</div>

<div>



</div>

</body>
</html>