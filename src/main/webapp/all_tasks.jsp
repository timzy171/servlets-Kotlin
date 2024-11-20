<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<%
  // Получаем список задач из атрибута запроса
  List<String> tasks = (List<String>) request.getAttribute("tasks");
  String username = request.getParameter("username");
%>

<html>
<head>
  <title>Список задач</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    h1 {
      color: #333;
    }

    ul {
      list-style-type: none;
      padding: 0;
    }

    li {
      background: #fff;
      margin: 10px 0;
      padding: 10px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    form {
      margin: 0;
    }

    button {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 5px 10px;
      border-radius: 3px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #218838;
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

    .add-task-form {
      margin-top: 20px;
      background: #fff;
      padding: 15px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .add-task-form input[type="text"] {
      padding: 8px;
      width: calc(100% - 100px);
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .add-task-form button {
      margin-left: 10px;
    }
  </style>
</head>
<body>
<h1>Список существующих задач</h1>

<ul>
  <%
    // Проверяем, есть ли задачи в списке
    if (tasks != null) {
      for (String task : tasks) {
  %>
  <li>
    <%= task %>
    <form action="subscribe-Servlet?taskName=<%=task%>&username=<%=username%>" method="post" style="display:inline;">
      <input type="hidden" name="taskName" value="<%= task %>" />
      <button type="submit">Подписаться</button>
    </form>
  </li>
  <%
    }
  } else {
  %>
  <li>Нет задач для отображения.</li>
  <%
    }
  %>
</ul>

</body>
</html>
