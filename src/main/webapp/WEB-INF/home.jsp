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
			<div class="minHeight">
				<div class="upperGap">
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Tickets by Priority</p>
						<ul class="ulSize">
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
						<ul class="ulSize">
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
				<div class="upperGap">
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Closed Tickets</p>
						<ul class="ulSize">
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
									<!-- display nothing if ticket is open-->
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a href="/tickets"><li class="noBullets">See All Tickets</li></a>
						</ul>
					</div>
					<div class="boxSize ">
						<p class="white textCenter bg-dark">Tickets by User</p>
						<ul class="ulSize">
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