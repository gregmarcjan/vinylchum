<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit record entry</title>
	<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>

<div class=container>
	<div class="main_box">
	<h1>Vinyl Chum</h1>
	<p>Edit this entry:<p>
				<form:form action="/edit/${vinyl.id}" method="post" modelAttribute="vinyl">
				<input type="hidden" name="_method" value="put">
			<table class="table1">
				<thead>
				</thead>
					<tr>
						<td>
							Artist:
						</td>
						<td>
							<form:errors path="artist"/>
							<form:input path="artist"/>
						</td>
					</tr>
					<tr>
						<td>
							Title
						</td>
						<td>
							<form:errors path="title"/>
							<form:input path="title"/>
						</td>
					</tr>
					<tr>
						<td>
							Year
						</td>
						<td>
							<form:errors path="year"/>
							<form:input path="year"/>
						</td>
					</tr>
					<tr>
						<td>
							Label
						</td>
						<td>
							<form:errors path="label"/>
							<form:input path="label"/>
						</td>
					</tr>
					<tr>
						<td>
							Catalog no.:
						</td>
						<td>
							<form:errors path="cat_no"/>
							<form:input path="cat_no"/>
						</td>
					</tr>
					<tr>
						<td>
							UPC no.:
						</td>
						<td>
							<form:errors path="upc_no"/>
							<form:input path="upc_no"/>
						</td>
					</tr>
										<tr>
						<td>
							Notes:
						</td>
						<td>
							<form:errors path="notes"/>
							<form:textarea path="notes" rows="4" style="width: 100%;"/>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
	        	<input type="submit" value="Submit"/>
	        	<form:input type="hidden" path="user" value="${user.id}"/>
	       	</div>
		</form:form>
	</div>
	<p class="register_line"><a href="/main">Return</a></p>
</div>

</body>
</html>