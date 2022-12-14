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
                <form:form action="/ticket/create" method="post" modelAttribute="ticket">
                <form:hidden path="poster" value="${userId}" />
                <form:hidden path="status" value="Open" />
                <form:errors path="poster" style="color: red"/>
                    <p class="form-group d-flex align-items-center">
                        <form:label class="bold " path="project">Project Title: </form:label>
                        <form:select class="form-control" path="project">
                        <c:forEach var="p" items="${projects}">
							<form:option value="${p.id}">${p.title}</form:option>
						</c:forEach>
                        <c:forEach var="ap" items="${assignedProjects}">
							<form:option value="${ap.id}">${ap.title}</form:option>
						</c:forEach>
                        </form:select>
                    </p>
					<div class="form-group my-3">
                        <form:label class="bold" path="type">Type:</form:label>
                        <form:select path="type">
                            <form:option value="Front End" >UI/UX</form:option>
							<form:option value="Back End" >Back End</form:option>
                            <form:option value="Database" >Database</form:option>
							<form:option value="Security" >Security</form:option>
                            <form:option value="Other" >Other</form:option>
                        </form:select>
                    </div>
                    <p class="form-group d-flex align-items-center">
                        <form:label class="bold" path="description">Description: </form:label>
                        <form:textarea row="6" class="form-control" path="description"/>
                        <form:errors path="description" style="color: red"/>
                    </p>
                    <div class="form-group my-3">
                        <form:label class="bold" path="priorityNum">Priority Level:</form:label>
                        <form:select path="priorityNum">
                            <form:option value="1" >  High</form:option>
                            <form:option value="2" >Medium</form:option>
                            <form:option value="3" >Low</form:option>
                        </form:select>
                    </div>
                    <input type="submit" class="black px-2" value="Submit"/>	
                </form:form>
			</div>
		</div>
	</div>
<body>
</html>