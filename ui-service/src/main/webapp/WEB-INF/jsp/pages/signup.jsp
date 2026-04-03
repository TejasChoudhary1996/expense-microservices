<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <title>Signup</title>
    <style>
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
            background: #22c55e;
            color: white;
            border: none;
            border-radius: 5px;
        }
        a {
            color: #3b82f6;
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

.toggle-password:hover {
    color: #000;
}
    </style>
    <script>
    
    function togglePassword(inputId, el) {
        const input = document.getElementById(inputId);
        const icon = el.querySelector("i");

        if (input.type === "password") {
            input.type = "text";
            icon.classList.replace("bi-eye", "bi-eye-slash");
        } else {
            input.type = "password";
            icon.classList.replace("bi-eye-slash", "bi-eye");
        }
    }
    
    

/*     function validatePassword() {
        const password = document.getElementById("signupPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        const error = document.getElementById("passwordError");
        const success = document.getElementById("passwordSuccess");

        // If confirm is empty → hide both
        if (confirmPassword === "") {
            error.classList.add("d-none");
            success.classList.add("d-none");
            return;
        }

        if (password === confirmPassword) {
            error.classList.add("d-none");      // 🔥 hide error
            success.classList.remove("d-none"); // 🔥 show success
        } else {
            success.classList.add("d-none");    // 🔥 hide success
            error.classList.remove("d-none");   // 🔥 show error
        }
    } */


function checkPasswordMatch() {
    const password = document.getElementById("signupPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return false;
    }
    
    if (password !== confirmPassword) {
        alert("Passwords do not match");
        return false;
    }
    return true;
}

</script>
</head>
<body>

<div class="card">
    <h2>Signup</h2>

<c:if test="${not empty sessionScope.loginPageMsg}">
    <div class="alert error">
        ${sessionScope.loginPageMsg}
    </div>
    <c:remove var="loginPageMsg" scope="session"/>
</c:if>

<form action="/signup" method="post" onsubmit="return checkPasswordMatch()">
    <input name="username" placeholder="Username" required/>
<div class= "mb-3">

				<input type="password" class="form-control" id="signupPassword" name="password" placeholder="Password">
				 <span	class="toggle-password" onclick="togglePassword('signupPassword', this)">
				  <i class="bi bi-eye"></i>
				</span>

			</div>
<div class="mb-3">

    <input type="password"
           class="form-control"
           id="confirmPassword"
           name="confirmPassword"
           placeholder="Confirm Password">

    <span class="toggle-password"
          onclick="togglePassword('confirmPassword', this)">
        <i class="bi bi-eye"></i>
    </span>

</div>
<!-- <small id="passwordError" class="text-danger d-none">
    Passwords do not match
</small>

<small id="passwordSuccess" class="text-success d-none">
    Passwords match
</small> -->
    <input name="email" placeholder="email" required/>
    <input name="mobileNo" placeholder="Mobile Number" required/>
    <button type="submit">Create Account</button>
</form>

<p>Already have an account? <a href="/login">Login</a></p>


</div>

</body>
</html>
