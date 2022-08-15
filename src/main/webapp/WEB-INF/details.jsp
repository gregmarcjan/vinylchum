<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Record Details</title>
	<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>

<div class=container>
	<div class="main_box">
		<div class="cover_art">
			<img id="logo" alt="vinyl_record" src="/assets/vinyl.png">
		</div>
	<h1><c:out value="${vinyl.artist}"></c:out></h1>
	<p>"<c:out value="${vinyl.title}"></c:out>"<p>
			<table class="table1 details">
				<thead>
				</thead>
					<tr>
						<td>
							Year
						</td>
						<td>
							<c:out value="${vinyl.year}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Label
						</td>
						<td>
							<c:out value="${vinyl.label}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Catalog no.:
						</td>
						<td>
							<c:out value="${vinyl.cat_no}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							UPC no.:
						</td>
						<td>
							<c:out value="${vinyl.upc_no}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Notes:
						</td>
						<td>
							<c:out value="${vinyl.notes}"></c:out>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
				<button onclick="window.location.href='/edit/${vinyl.id}';">Edit</button>
				<button onclick="window.location.href='/main';">Return</button>
	       	</div>
	</div>
	<p class="register_line"><a href="/main">Return</a></p>
</div>

</body>
</html>