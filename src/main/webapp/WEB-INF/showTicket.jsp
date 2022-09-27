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
                <h3>${ticket.description}</h3>
                <p>Ticket by ${ticket.poster.userName}</p>
                <p>Status ${ticket.status}</p>
                <c:if test="${ticket.status == 'Open'}">
                    <form:form action="/tickets/${ticket.id}/update" method="post" modelAttribute="ticket">
                        <input type="hidden" name="_method" value="put" />
                        <form:hidden path="project" value="${ticket.project.id}" />
                        <form:hidden path="poster" value="${ticket.poster.id}" />
                        <form:hidden path="description" value="${ticket.description}" />
                        <form:hidden path="priorityNum" value="${ticket.priorityNum}" />
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