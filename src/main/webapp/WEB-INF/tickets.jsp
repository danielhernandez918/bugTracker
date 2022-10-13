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
	<title>Tickets</title>
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
				<div class="d-flex justify-content-between">
					<h1>Tickets</h1> 
					<a href="/ticket/new"><button class="black textCenter px-2">New Ticket</button></a>
				</div>
				<h3>My Tickets</h3>
				<c:choose>
					<c:when test = "${empty tickets}">
						<h3>No Tickets</h3>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="ticket" items="${tickets}">
								<c:choose>
									<c:when test="${ticket.priorityNum == 1}">
										<h3><a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority High - Status ${ticket.status} - Ticket ${ticket.type}</li></a></h3>
									</c:when>
									<c:when test="${ticket.priorityNum == 2}">
										<h3><a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority Medium - Status ${ticket.status} - Ticket ${ticket.type}</li></a></h3>
									</c:when>
									<c:otherwise>
										<h3><a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority Low - Status ${ticket.status} - Ticket ${ticket.type}</li></a></h3>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
				<h3>Partner Tickets</h3>
				<c:choose>
					<c:when test = "${empty partneredTickets}">
						<h3>No Partnered Tickets</h3>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="ticket" items="${partneredTickets}">
								<c:choose>
									<c:when test = "${ticket.project.poster.id == ticket.poster.id}">
										<h3><a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority ${ticket.priorityNum} - Status ${ticket.status} - Ticket ${ticket.type}</li></a></h3>
									</c:when>
									<c:otherwise>
									<!-- display nothing if project belongs to poster -->
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
<body>
</html>