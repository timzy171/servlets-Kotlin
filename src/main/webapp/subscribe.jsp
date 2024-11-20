<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
  // Получаем имя задачи из параметров запроса
  String taskName = request.getParameter("taskName");
  String username = request.getParameter("username");
  boolean isSubscribed = Boolean.parseBoolean(request.getParameter("isSubscribed"));
%>

<html>
<head>
  <title>Подписка на задачу</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
      text-align: center;
    }

    h1 {
      color: #333;
    }

    .message {
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      display: inline-block;
      margin-top: 20px;
    }

    a {
      display: inline-block;
      margin-top: 20px;
      text-decoration: none;
      color: #007bff;
      transition: color 0.3s;
    }

    a:hover {
      color: #0056b3;
    }
  </style>
</head>
<body>

<h1>Подписка на задачу</h1>

<div class="message">
  <%
    // Проверяем, подписан ли пользователь на задачу
    // Здесь вы можете добавить логику для проверки подписки

    if (taskName != null && !taskName.isEmpty()) {
      if (isSubscribed) { // Если пользователь уже подписан на задачу
  %>
  Вы уже подписаны на задачу <strong><%= taskName %></strong>.
  <%
  } else { // Если пользователь не подписан на задачу
  %>
  Вы подписались на задачу <strong><%= taskName %></strong>.
  <%
    }
  } else {
  %>
  Ошибка: имя задачи не указано.
  <%
    }
  %>
</div>

<a href="personalAccount-Servlet?username=<%= username %>">На главную</a>

</body>
</html>
