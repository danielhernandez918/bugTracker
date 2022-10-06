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
	<title>Home</title>
</head>
<body class="full">
	<div class="d-flex minHeight">
		<div class="sideBar">
			<div class="logoCenter">
				<img class="logo mx-2" src="/image/OH.png" alt="logoPic">
			</div>
			<a class="black textCenter" href="/home"> DashBoard Home</a>
			<a class="black textCenter" href="/manageRole">Manage Role Assignment</a>
			<a class="black textCenter" href="/manageUsers">Manage Project Users</a>
			<a class="black textCenter" href="/projects">My Projects</a>
			<a class="black textCenter" href="/tickets">My Tickets</a>
			<a class="black textCenter" href="/profile">User Profile</a>
			<a class="black textCenter" href="/logout">Logout</a>
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
			<div class="minHeight">
				<div class="d-flex justify-content-around space">
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Tickets by Priority</p>
						<ul>
							<c:forEach var="ticket" items="${tickets}">
								<c:choose>
									<c:when test = "${ticket.priorityNum == 1}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority High - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 2}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Medium - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 3}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Low - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:otherwise>
									<!-- display nothing if ticket is closed-->
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="/tickets"><li class="noBullets">See All Tickets</li></a>
						</ul>
					</div>
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Tickets by Type</p>
						<ul>
							<c:forEach var="ticket" items="${typeTickets}">
								<c:choose>
									<c:when test = "${ticket.priorityNum == 1}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority High - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 2}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Medium - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 3}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Low - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:otherwise>
									<!-- display nothing if ticket is closed-->
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="/tickets"><li class="noBullets">See All Tickets</li></a>
						</ul>
					</div>
				</div>
				<div class="d-flex justify-content-around space">
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Closed Tickets</p>
						<ul>
							<c:forEach var="ticket" items="${closeTickets}">
								<c:choose>
									<c:when test = "${ticket.priorityNum == 1}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority High - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 2}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Medium - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 3}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Low - Status ${ticket.status} - ${ticket.type} Issue</li></a>
									</c:when>
									<c:otherwise>
									<!-- display nothing if ticket is closed-->
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="/tickets"><li class="noBullets">See All Tickets</li></a>
						</ul>
					</div>
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Tickets by User</p>
						<ul>
							<c:forEach var="ticket" items="${userTickets}">
								<c:choose>
									<c:when test = "${ticket.priorityNum == 1}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority High - Status ${ticket.status} - Posted by ${ticket.poster.userName}</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 2}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Medium - Status ${ticket.status} - Posted by ${ticket.poster.userName}</li></a>
									</c:when>
									<c:when test = "${ticket.priorityNum == 3}">
										<a href="/tickets/${ticket.id}"><li class="noBullets">${ticket.project.title} - Priority Low - Status ${ticket.status} - Posted by ${ticket.poster.userName}</li></a>
									</c:when>
									<c:otherwise>
									<!-- display nothing if ticket is closed-->
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="/tickets"><li class="noBullets">See All Tickets</li></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<body>
</html>