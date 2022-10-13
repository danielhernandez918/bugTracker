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
				<!-- <div class="snu mx-2">
					<p class="mx-2">Search</p>
					<p class="mx-2">Notifcations</p>
					<p class="mx-2">User Actions</p>
				</div> -->
			</div>
            <div class="form-control minHeight mx-2 my-2">
                <h1>${project.title}</h1>
                <h2>Description: ${project.description}</h3>
                <h3>Leader: ${project.poster.userName}</h3>
				<h3>Partners:</h3>
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