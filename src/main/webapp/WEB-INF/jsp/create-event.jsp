<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Event</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 120px); /* Adjust the height based on header and footer heights */
        }

        form {
            background-color: #f2f2f2;
            color: #1a1a1a;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            width: 50%; /* Increased the width of the form */
        }

        label, input, textarea {
            display: block;
            width: 98%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
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

        .error-message {
            color: #d11a2a;
            font-weight: bold;
        }

    </style>
</head>
<body>
<header>
    <h1>Create Event</h1>
</header>
<main>
    <form:form action="/event/create" method="post" modelAttribute="event">
        <form:errors path="*" cssClass="error-message" />
        <label for="name">Name:</label>
        <form:input path="name" id="name" />
        <br>

        <label for="description">Description:</label>
        <form:textarea path="description" id="description" />
        <br>

        <label for="startDateTime">Start Date Time:</label>
        <form:input path="startDateTime" type="datetime-local" id="startDateTime" />
        <br>

        <label for="endDateTime">End Date Time:</label>
        <form:input path="endDateTime" type="datetime-local" id="endDateTime" />
        <br>

        <input type="submit" value="Create Event">
    </form:form>
</main>
</body>
</html>