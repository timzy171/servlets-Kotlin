<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>

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

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Регистрация</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="registration-container">
  <h2>Регистрация</h2>
  <form action="signUp-Servlet" method="post">
    <div class="form-group">
      <label for="name">Имя:</label>
      <input type="text" id="name" name="name" required>
    </div>
    <div class="form-group">
      <label for="surname">Фамилия:</label>
      <input type="text" id="surname" name="surname" required>
    </div>
    <div class="form-group">
      <label for="username">Логин:</label>
      <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Пароль:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
      <button type="submit">Зарегистрироваться</button>
    </div>
  </form>
  <div class="form-group">
    <a href="signIn.jsp">Уже есть аккаунт? Войти</a>
  </div>
</div>
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

