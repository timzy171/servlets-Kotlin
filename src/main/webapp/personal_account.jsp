...<%@ page import="java.util.List" %>
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
            position: relative; /* Для абсолютного позиционирования кнопки выхода */
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
        .create-task-btn, .logout-btn {
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
        .create-task-btn:hover, .logout-btn:hover {
            background-color: #0056b3; /* Темнее при наведении */
        }
        .task-list {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .task-list ul {
            list-style-type: none; /* Убираем маркеры списка */
            padding: 0; /* Убираем отступы */
        }
        .task-list li {
            margin-bottom: 10px; /* Отступ между задачами */
            font-size: 16px; /* Размер шрифта для задач */
        }
        .logout-btn {
            position: absolute; /* Позиционируем кнопку относительно контейнера */
            top: 20px; /* Отступ сверху */
            right: 20px; /* Отступ справа */
            width: 30px; /* Уменьшенная ширина кнопки */
            height: 30px; /* Уменьшенная высота кнопки */
            background-color: #dc3545; /* Цвет фона кнопки */
            border-radius: 50%; /* Кнопка круглая */
            border: none; /* Убираем границу */
            color: white; /* Цвет текста и иконки */
            font-size: 14px; /* Уменьшенный размер шрифта для иконки */
            display: flex; /* Используем flex для центрирования иконки */
            align-items: center; /* Центрируем по вертикали */
            justify-content: center; /* Центрируем по горизонтали */
            cursor: pointer; /* Курсор при наведении */
        }
        .logout-btn:hover {
            background-color: #c82333; /* Темнее при наведении */
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Информация о пользователе</h1>
    <a href="signIn-Servlet" class="logout-btn"><i class="fas fa-door-open"></i></a> <!-- Кнопка выхода с иконкой -->

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

    <a href="allTasks-servlet?username=<%= request.getAttribute("username") %>" class="create-task-btn">Все задачи</a>

    <!-- Отображение списка задач -->
    <div class="task-list">
        <h2>Ваши задачи:</h2>
        <ul>
            <%
                List<String> taskList = (List<String>) request.getAttribute("taskList");
                if (taskList != null && !taskList.isEmpty()) {
                    for (String task : taskList) {
                        out.println("<li>" + task + "</li>");
                    }
                } else {
                    out.println("<li>Нет задач для отображения.</li>");
                }
            %>
        </ul>
    </div>
</div>

</body>
</html>
