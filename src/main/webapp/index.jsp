<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа 1</title>
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
        p {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
        }
        .start-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .start-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Лабораторная работа 1</h1>
    <p>Вариант 7: Написать простой HttpServlet, который представляет собой симуляцию авторизации и при успехе переводит на другую страницу, например, на страницу со временем.</p>
    <p>Сделать условного SuperUser, на авторизацию которого сервлет реагирует альтернативным способом (перекидывает на третью страницу).</p>
    <p>Псевдо БД можно заполнить заранее при инициализации сервлета.</p>
    <p>Выполнил: Железняк Тимур ИДБ-21-09.</p>

    <a href="hello-servlet" class="start-button">Start</a>
</div>

</body>
</html>
