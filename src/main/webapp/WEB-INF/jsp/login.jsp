<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-button, .register-button {
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

        .register-button {
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
    <h1>Campus Events</h1>
</header>
<main>
    <form action="login" method="post">
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login" class="login-button">
    </form>
    <c:if test="${not empty param.error}">
        <p class="error-message">${param.error}</p>
    </c:if>
    <a href="/register">
        <button class="register-button">Register</button>
    </a>
</main>
</body>
</html>