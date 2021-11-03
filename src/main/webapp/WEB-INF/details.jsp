<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Languages</title>
</head>
<body>	
	<div class = "container mt-5">
		<div class="d-flex justify-content-end">
			<a href="/languages">Back to Dashboard</a>
		</div>
		<div class="card">
		<h1 class="card-header">${language.name}</h1>
		<div class="card-body">
		<h5 class="card-subtitle mb-2 text-muted">${language.creator}</h5>
		<p class="card-text">${language.currentVersion}</p>
		<p><a href="#" class="card-link">Delete</a></p>
		<p><a href="#" class="card-link">Edit</a></p>
		</div>
		</div> 
	</div>
</body>
</html>>