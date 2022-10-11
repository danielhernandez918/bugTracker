<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/script/script.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Profile</title>
</head>
<body class="minHeight">
	<div class="d-flex ">
		<div class="sideBar">
			<div class="logoCenter">
				<img class="logo mx-2" src="/image/OH.png" alt="logoPic">
			</div>
			<h1 class="textCenter" ><a class="black" href="/home"> DashBoard Home</a></h1>
			<!-- <a class="black textCenter" href="/manageRole">Manage Role Assignment</a> -->
			<h1 class="textCenter" ><a class="black" href="/manageUsers">Manage Project Users</a></h1>
			<h1 class="textCenter" ><a class="black" href="/projects">My Projects</a></h1>
			<h1 class="textCenter" ><a class="black" href="/tickets">My Tickets</a></h1>
			<h1 class="textCenter" ><a class="black" href="/profile">User Profile</a></h1>
			<h1 class="textCenter" ><a class="black" href="/logout">Logout</a></h1>
		</div>
		<div class="top">
			<div class="topBar">
				<h1 class="mx-2">Logged in as: ${userName}</h1>
				<div class="d-flex mx-2">
					<p>Search</p>
					<p>Notifcations</p>
					<p>User Actions</p>
				</div>
			</div>
			<div class="form-control minHeight mx-2 my-2">
                <h1>Profile info for ${userName}:</h1>
                <ul>
					<form:form action="/profile/${userId}/edit" method="post" modelAttribute="user">
						<input type="hidden" name="_method" value="put" />
						<div class="form-group">
							<form:label class="bold" path="userName"> User Name</form:label>
							<form:input path="userName" class="form-control"/>
							<form:errors path="userName" class="text-danger"/>
						</div>
						<div class="form-group">
							<form:label class="bold" path="email"> Email</form:label>
							<form:input path="email" class="form-control"/>
							<form:errors path="email" class="text-danger"/>
						</div>
						<form:hidden path="password" value="${user.password}" />
						<form:errors path="password" class="text-danger"/>
						<form:hidden path="confirm" value="${user.password}" />
						<form:errors path="confirm" class="text-danger"/>
						<input class="px-2" type="submit" value="Update Name/Email"/>
					</form:form>
					<br>
					<a href="/profile/passwordChange"> Change Password ?</a>
                </ul>
			</div>
		</div>
	</div>
<body>
</html>