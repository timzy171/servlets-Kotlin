<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание задачи</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #0056b3; /* Темнее при наведении */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Создание задачи</h1>
    <form action="createTask-servlet" method="post">
        <div class="form-group">
            <label for="taskName">Название задачи:</label>
            <input type="text" id="taskName" name="taskName" required>
        </div>
        <button type="submit" class="submit-btn">Создать задачу</button>
    </form>
</div>

<style>
    #notification {
        border-radius: 4px;
        background-color: #000000;
        color: #ffffff;
        position: fixed;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        z-index: 1000;
        transition: opacity 0.5s ease;
    }
</style>

</body>

<% if (request.getAttribute("errorMessage") != null) { %>
<div id="notification" class="alert alert-danger" style="display: none;">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var notification = document.getElementById('notification');
        if (notification) {
            notification.style.display = 'block';
            setTimeout(function() {
                notification.style.opacity = '0';
                setTimeout(function() {
                    notification.style.display = 'none';
                }, 500);
            }, 3000);
        }
    });
</script>

</html>
