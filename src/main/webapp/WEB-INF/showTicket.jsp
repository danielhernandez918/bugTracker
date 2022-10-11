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
				<div class="d-flex mx-2">
					<p>Search</p>
					<p>Notifcations</p>
					<p>User Actions</p>
				</div>
			</div>
            <div class="form-control minHeight mx-2 my-2">
				<c:choose>
					<c:when test="${ticket.priorityNum == 1}">
						<h1>${ticket.project.title} : High Priority</h1>
					</c:when>
					<c:when test="${ticket.priorityNum == 2}">
						<h1>${ticket.project.title} : Medium Priority</h1>
					</c:when>
					<c:otherwise>
						<h1>${ticket.project.title} : Low Priority</h1>
					</c:otherwise>
				</c:choose>
				<h2>${ticket.type} Issue</h2>
                <h2>Description: ${ticket.description}</h2>
                <h4>Ticket by ${ticket.poster.userName}</h4>
                <h4>Status ${ticket.status}</h4>
                <c:if test="${ticket.status == 'Open'}">
                    <form:form action="/tickets/${ticket.id}/update" method="post" modelAttribute="ticket">
                        <input type="hidden" name="_method" value="put" />
                        <form:hidden path="project" value="${ticket.project.id}" />
                        <form:hidden path="poster" value="${ticket.poster.id}" />
                        <form:hidden path="description" value="${ticket.description}" />
                        <form:hidden path="priorityNum" value="${ticket.priorityNum}" />
						<form:hidden path="type" value="${ticket.type}" />
                        <form:hidden path="status" value="Close" />
                        <form:errors path="status" style="color: red"/>
                        <form:errors path="priorityNum" style="color: red"/>
                        <form:errors path="description" style="color: red"/>
                        <form:errors path="poster" style="color: red"/>
                        <input class="px-2" type="submit" value="Close Ticket"/>
                    </form:form>
                </c:if>

            </div>
		</div>
	</div>
<body>
</html>