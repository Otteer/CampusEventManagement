<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
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
            flex-direction: column;
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
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"], input[type="email"], select {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .register-button, .login-button {
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

        .login-button {
            background-color: #2196F3;
        }

        .error-message {
            color: #d11a2a;
            font-weight: bold;
        }

    </style>
</head>
<body>
<header>
    <h1>Register</h1>
</header>
<main>
    <form action="/register" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="student">Student</option>
            <option value="admin">Admin</option>
        </select><br>

        <input type="submit" value="Register" class="register-button">
    </form>

    <c:if test="${not empty param.error}">
        <p class="error-message">Registration failed. Please try again.</p>
    </c:if>
    <a href="/login">
        <button class="login-button">Login</button>
    </a>
</main>

</body>
</html>