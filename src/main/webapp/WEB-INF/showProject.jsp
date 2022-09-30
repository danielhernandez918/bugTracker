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
	<title>Add Partners</title>
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
            <div class="form-control minHeight mx-2 my-2">
                <h1>${project.title}</h1>
                <h3>${project.description}</h3>
                <p>Leader: ${project.poster.userName}</p>
				<p>Partners:</p>
				<c:forEach var="partner" items="${project.partners}">
					<p>${partner.userName}</p> 
				</c:forEach>
				<c:choose>
					<c:when test = "${userId == project.poster.id}">
						<form action="/project/${project.id}" method="post" >
							<select name="userId" id="userId" >
									<c:forEach var="user" items="${unassignedUsers}">
										<c:choose>
											<c:when test = "${user.id != project.poster.id}">
												<option value ="${user.id}" >${user.userName}</option>
											</c:when>
											<c:otherwise>
											<!-- display nothing if project belongs to poster -->
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select>
							<input class="px-2" type="submit" value="Add Partner"/>
						</form>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
            </div>
		</div>
	</div>
<body>
</html>