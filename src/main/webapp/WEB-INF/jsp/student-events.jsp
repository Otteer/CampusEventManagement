<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Campus Events</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1a1a1a;
            color: #f2f2f2;
        }

        /* Header Styles */
        header {
            background-color: #333;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        /* Main Content Styles */
        main {
            padding: 20px;
        }

        .event-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f2f2f2;
            color: #1a1a1a;
        }

        .event-table th, .event-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .event-table th {
            background-color: #333;
            color: #f2f2f2;
        }

        .add-event-button {
            margin-bottom: 20px;
            text-align: right;
        }

        .logout-button, .register-button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .logout-button {
            background-color: #d11a2a;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #f2f2f2;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <h1>Campus Events</h1>
</header>
<main>
    <div class="add-event-button">
        <a class="logout-button" href="<spring:url value='/logout' />">Logout</a>
    </div>
    <table class="event-table">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Start Date Time</th>
            <th>End Date Time</th>
            <th>Registered Students</th>
            <th>Register</th>
        </tr>
        <c:forEach items="${events}" var="event">
            <tr>
                <td>${event.name}</td>
                <td>${event.description}</td>
                <td>${event.startDateTime}</td>
                <td>${event.endDateTime}</td>
                <td>${event.registeredStudents}</td>
                <td>
                    <a class="register-button" href="<spring:url value='/event/${event.id}/register' />">Register</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</main>
<footer>
    <p>&copy; 2023 My Web Application</p>
</footer>
</body>
</html>