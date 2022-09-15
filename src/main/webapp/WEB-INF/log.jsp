<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login/Register</title>
</head>
<body>
	<div class="container my-2">
		<div class="d-flex justify-content-evenly">
			<form:form action="/register" method="post" modelAttribute="newUser">
				<h1>Register</h1>
				<div class="form-group">
					<form:label path="userName"> Name</form:label>
					<form:input path="userName" class="form-control"/>
					<form:errors path="userName" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="email"> Email</form:label>
					<form:input path="email" class="form-control"/>
					<form:errors path="email" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="password"> Password</form:label>
					<form:password path="password" class="form-control"/>
					<form:errors path="password" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="confirm"> Confirm Password</form:label>
					<form:password path="confirm" class="form-control"/>
					<form:errors path="confirm" class="text-danger"/>
				</div>
				<input type="submit" value="Register" class="btn btn-primary"/>
			</form:form>

			<form:form action="/login" method="post" modelAttribute="newLogin">
				<h1>Login</h1>
				<div class="form-group">
					<form:label path="email"> Email</form:label>
					<form:input path="email" class="form-control"/>
					<form:errors path="email" class="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="password"> Password</form:label>
					<form:password path="password" class="form-control"/>
					<form:errors path="password" class="text-danger"/>
				</div>
				<input type="submit" value="Login" class="btn btn-primary"/>
			</form:form>
		</div>
		
	</div>
	
<body>
</html>