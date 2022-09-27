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
<body class="full">
	<div class="d-flex minHeight">
		<div class="d-flex flex-column col-2 borderShadow">
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
			<div class="d-flex justify-content-between align-items-center borderShadow">
				<h1 class="mx-2">Logged in as: Admin</h1>
				<div class="d-flex mx-2">
					<p>Search</p>
					<p>Notifcations</p>
					<p>User Actions</p>
				</div>
			</div>
			<div class="form-control minHeight mx-2 my-2">
				<div class="d-flex justify-content-between">
					<h1>Tickets</h1> 
					<a href="/ticket/new"><button class="black textCenter px-2">New Ticket</button></a>
				</div>
				<h3>My Tickets</h3>
				<c:choose>
					<c:when test = "${empty tickets}">
						<p>No Tickets</p>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="ticket" items="${tickets}">
								<c:choose>
									<c:when test="${ticket.priorityNum == 1}">
										<a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority High - Status ${ticket.status}</li></a>
									</c:when>
									<c:when test="${ticket.priorityNum == 2}">
										<a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority Medium - Status ${ticket.status}</li></a>
									</c:when>
									<c:otherwise>
										<a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority Low - Status ${ticket.status}</li></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
				<h3>Partner Tickets</h3>
				<c:choose>
					<c:when test = "${empty partneredTickets}">
						<p>No Partnered Tickets</p>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach var="ticket" items="${partneredTickets}">
								<c:choose>
									<c:when test = "${ticket.project.poster.id == ticket.poster.id}">
									<a href="/tickets/${ticket.id}"><li>${ticket.project.title} - Priority ${ticket.priorityNum} - Status ${ticket.status}</li></a>
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