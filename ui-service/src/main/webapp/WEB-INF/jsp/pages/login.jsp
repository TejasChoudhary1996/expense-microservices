<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <title>Login</title>
    <style>
.password-wrapper {
    position: relative;
}

.password-wrapper input {
    padding-right: 40px; /* space for icon */
}

.toggle-password {
    position: absolute;
    top: 50%;
    right: 12px;
    transform: translateY(-50%);
    cursor: pointer;
    color: #6c757d;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100%;
}

.toggle-password i {
    font-size: 16px;
}
        body {
            font-family: Arial;
            background: #0f172a;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: white;
        }
        .card {
            background: #1e293b;
            padding: 30px;
            border-radius: 10px;
            width: 300px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #3b82f6;
            color: white;
            border: none;
            border-radius: 5px;
        }
        a {
            color: #3b82f6;
        }
        .alert {
    padding: 12px;
    border-radius: 6px;
    margin-bottom: 15px;
    text-align: center;
    font-weight: 500;
}

.alert.error {
    background-color: #fee2e2;
    color: #b91c1c;
}

.alert.success {
    background-color: #dcfce7;
    color: #166534;
}
    </style>
    <script>
    function togglePassword(inputId, el) {
        const input = document.getElementById(inputId);
        const icon = el.querySelector("i"); 
        if (input.type === "password") {
            input.type = "text";
            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");
        } else {
            input.type = "password";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");
        }
    }
</script>
</head>
<body>

<div class="card">
    <h2>Login</h2>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>

  
    <c:when test="${not empty sessionScope.loginPageMsg}">
        <div class="alert error">
            ${sessionScope.loginPageMsg}
        </div>
        <c:remove var="loginPageMsg" scope="session"/>
    </c:when>

  
    <c:when test="${param.loginPageMsg == 'logout'}">
        <div class="alert success">
            You have been logged out successfully.
        </div>
    </c:when>

</c:choose>

<form action="/login" method="post">
    <input name="username" placeholder="Username" required/>

<div class="password-wrapper mb-3">

    <input type="password"
           class="form-control"
           id="loginPassword"
           name="password"
           placeholder="Password">

    <span class="toggle-password"
          onclick="togglePassword('loginPassword', this)">
        <i class="bi bi-eye"></i>
    </span>

</div>
    <button type="submit">Login</button>
</form>

<p>Don't have an account? <a href="/signup">Sign up</a></p>

</div>

</body>
</html>
