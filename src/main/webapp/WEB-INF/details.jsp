<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vinyl Chum - record details</title>
	<link rel="stylesheet" href="/css/style.css"> 
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Cookie&family=Kavoon&family=Life+Savers:wght@700&family=Roboto:wght@100&display=swap');
    </style>
</head>

<body>

<div class=container>
	<div class="main_box">
		<div class="cover_art">
			<img id="cover" alt="vinyl_record" src="${cover_image}" onclick="window.open('${cover_image}', '_blank')">
		</div>
	<h1 style="text-align:center; max-width: 350px;"><c:out value="${vinyl.artist}"></c:out></h1>
	<p style="font-size: 1.5rem; text-align:center; max-width: 600px;">"<c:out value="${vinyl.title}"></c:out>"<p>
			<table class="table1">
				<thead>
				</thead>
					<tr>
						<td>
							Year
						</td>
						<td style="text-align:left;">
							<c:out value="${vinyl.year}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Label
						</td>
						<td style="text-align:left;">
							<c:out value="${vinyl.label}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Catalog no.:
						</td>
						<td style="text-align:left;">
							<c:out value="${vinyl.cat_no}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							UPC no.:
						</td>
						<td style="text-align:left;">
							<c:out value="${vinyl.upc_no}"></c:out>
						</td>
					</tr>
					<tr>
						<td>
							Notes:
						</td>
						<td style="text-align:left;">
							<c:out value="${vinyl.notes}"></c:out>
						</td>
					</tr>
				</table>
			<div class="buttonrow">
				<button onclick="window.location.href='/edit/${vinyl.id}';">Edit</button>
				<button onclick="window.location.href='https://www.discogs.com/search/?q=${vinyl.artist}+${vinyl.title}';">Search</button>
				<button onclick="window.location.href='/main';">Return</button>
	       	</div>
	</div>
</div>

</body>
</html>