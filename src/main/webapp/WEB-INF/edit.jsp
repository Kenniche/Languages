<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
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
			<form action="/languages/${language.id}" method="post">
	    			<input type="hidden" name="_method" value="delete">
	    			<input type="submit" value="Delete" class="btn btn-sm btn-outline-danger ">
					</form> 
			<a href="/languages" class="ml-3">Back to Dashboard</a>
		</div>
		<h5>Edit Language</h5>
    		<form:form action="/languages/${language.id}/edit" method="post" modelAttribute="Language">
    		<input type="hidden" name="_method" value="put">
	      		<p>
	      			<form:label path="name" class="form-label">Name</form:label>
		      		<form:errors path="name" class="text-danger" />
		      		<form:input path="name" placeholder="Language Name" class="form-control"/>
	      		</p>
	      		<p>
	      			<form:label path="creator" class="form-label">Creator</form:label>
		      		<form:errors path="creator" class="text-danger" />
		      		<form:input path="creator" placeholder="Language Creator" class="form-control"/>
	      		</p>
	      		<p>
	      			<form:label path="currentVersion" class="form-label">Current Version</form:label>
		      		<form:errors path="currentVersion" class="text-danger" />
		      		<form:input path="currentVersion" placeholder="Version Number" class="form-control"/>
	      		</p>
	      		<div class="d-flex justify-content-end">
		    		<input type="submit" value="Edit Language" class="btn btn-sm btn-primary mt-3" />
	      		</div>
    		</form:form>
	</div>
</body>
</html>