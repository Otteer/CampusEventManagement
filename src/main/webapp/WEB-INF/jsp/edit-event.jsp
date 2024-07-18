<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
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

    </style>
</head>
<body>
<header>
    <h1>Edit Event</h1>
</header>
<main>
    <form action="/event/edit" method="post">
        <input type="hidden" name="id" value="${event.id}">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${event.name}" required>
        <br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${event.description}</textarea>
        <br>

        <label for="startDateTime">Start Date and Time:</label>
        <input type="datetime-local" id="startDateTime" name="startDateTime" value="${event.startDateTime}" required>
        <br>

        <label for="endDateTime">End Date and Time:</label>
        <input type="datetime-local" id="endDateTime" name="endDateTime" value="${event.endDateTime}" required>
        <br>

        <input type="submit" value="Update Event">
    </form>
</main>
</body>
</html>