
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Информация о пользователе</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
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
        .user-info {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .user-info p {
            margin: 10px 0;
            font-size: 18px;
        }
        .icon {
            color: #007bff;
        }
        .create-task-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
            text-decoration: none; /* Убираем подчеркивание */
        }
        .create-task-btn:hover {
            background-color: #0056b3; /* Темнее при наведении */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Информация о пользователе</h1>
    <div class="user-info">
        <p><i class="fas fa-user icon"></i> Имя: <strong><%= request.getAttribute("name") %></strong></p>
        <p><i class="fas fa-user icon"></i> Фамилия: <strong><%= request.getAttribute("surname") %></strong></p>
        <p><i class="fas fa-envelope icon"></i> Логин: <strong><%= request.getAttribute("username") %></strong></p>

        <%
            String username = (String) request.getAttribute("username");
            if ("admin".equals(username)) {
        %>
        <p><i class="fas fa-lock icon"></i> Пароль: <strong><%= request.getAttribute("password") %></strong></p>
        <%
            }
        %>
    </div>

    <a href="createTask-servlet?username=<%= request.getAttribute("username") %>" class="create-task-btn">Создать задачу</a>
</div>

</div>

</body>
</html>
