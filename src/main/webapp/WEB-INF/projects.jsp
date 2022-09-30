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
	<title>My Projects</title>
</head>
<body class="full">
	<div class="d-flex minHeight">
		<div class="sideBar col-2">
			<div class="d-flex align-items-center">
				<img class="logo mx-2" src="/image/OH.png" alt="logoPic">
				<h1 class="text-center">Welcome Bro!</h1>
			</div>
			<a class="black textCenter" href="/home"> DashBoard Home</a>
			<a class="black textCenter" href="/manageRole">Manage Role Assignment</a>
			<a class="black textCenter" href="/manageUsers">Manage Project Users</a>
			<a class="black textCenter" href="/projects">My Projects</a>
			<a class="black textCenter" href="/tickets">My Tickets</a>
			<a class="black textCenter" href="/profile">User Profile</a>
			<a class="black textCenter" href="/logout">Logout</a>
		</div>
		<div class="col-10">
			<div class="topBar">
				<h1 class="mx-2">Logged in as: ${userName}</h1>
				<div class="d-flex mx-2">
					<p>Search</p>
					<p>Notifcations</p>
					<p>User Actions</p>
				</div>
			</div>
			<div class=" form-control minHeight mx-2 my-2">
				<div class="d-flex justify-content-between">
					<h1>Projects</h1> 
					<a href="/project/new"><button class="black textCenter px-2">New Project</button></a>
				</div>
				<h3>Lead Projects</h3>
				<c:choose>
					<c:when test = "${empty projects}">
						<p>No Projects</p>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="project" items="${projects}">
								<a href="/project/${project.id}"><li>${project.title}</li></a>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
				<h3>Partnered Projects</h3>
				<c:choose>
					<c:when test = "${empty assignedProjects}">
						<p>No Partnered Projects</p>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="project" items="${assignedProjects}">
								<a href="/project/${project.id}"><li>${project.title}</li></a>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
<body>
</html>