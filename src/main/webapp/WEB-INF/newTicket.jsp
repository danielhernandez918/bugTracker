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
	<title>New Ticket</title>
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
                <form:form action="/ticket/create" method="post" modelAttribute="ticket">
                <form:hidden path="poster" value="${userId}" />
                <form:hidden path="status" value="Open" />
                <form:errors path="poster" style="color: red"/>
                    <p class="form-group d-flex align-items-center">
                        <form:label class="bold " path="project">Title: </form:label>
                        <form:select class="form-control" path="project">
                        <c:forEach var="p" items="${projects}">
							<form:option value="${p.id}">${p.title}</form:option>
						</c:forEach>
                        <c:forEach var="ap" items="${assignedProjects}">
							<form:option value="${ap.id}">${ap.title}</form:option>
						</c:forEach>
                        </form:select>
                    </p>
                    <p class="form-group d-flex align-items-center">
                        <form:label class="bold" path="description">Description: </form:label>
                        <form:textarea row="6" class="form-control" path="description"/>
                        <form:errors path="description" style="color: red"/>
                    </p>
                    <div class="form-group my-3">
                        <form:label class="bold" path="priority">Priority Level:</form:label>
                        <form:select path="priority">
                            <form:option value="High" >  High</form:option>
                            <form:option value="Medium" >Medium</form:option>
                            <form:option value="Low" >Low</form:option>
                        </form:select>
                    </div>
                    <input type="submit" value="Submit"/>	
                </form:form>
			</div>
		</div>
	</div>
<body>
</html>