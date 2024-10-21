<!DOCTYPE html>
<html>
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

    <title>Sign In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 50px;
        }
        .login-container {
            max-width: 300px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Sign In</h2>
    <form action="signIn-Servlet" method="post">
        <div class="form-group">
            <label for="username">Login: </label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password: </label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Sign In</button>
        </div>
    </form>

    <div class="form-group">
        <a href="signUp-Servlet">
            <button type="button">Sign Up</button>
        </a>
    </div>
</div>


<% if (request.getAttribute("errorMessage") != null) { %>
<div id="notification" class="alert alert-danger" style="display: none;">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>



</body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var notification = document.getElementById('notification');
        if (notification) {
            notification.style.display = 'block'; // Показываем уведомление
            setTimeout(function() {
                notification.style.opacity = '0'; // Уменьшаем прозрачность
                setTimeout(function() {
                    notification.style.display = 'none'; // Скрываем уведомление
                }, 500); // Ждем 500мс перед скрытием
            }, 3000); // Уведомление будет показано 3000мс (3 секунды)
        }
    });
</script>




