<?php
include '../api/connect.php';
if ($conn->connect_error) {
    echo "Connessione fallita: " . $conn->connect_error;
} else {
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Sign Up</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="container">
        <div class="login-container">
            <form  action= "../api/login.php" method="POST" class="login-form" id="loginForm">
                <h2>Login</h2>
                <input type="text" id="email" name="email" placeholder="email" required>
                <input type="password" id="password" name="password" placeholder="Password" required>
                <button type="submit">Log In</button>
                <a href="#" id="showSignup">Sign Up</a>

            </form>
        </div>
        <div class="signup-container">
            <form action= "../api/signup.php" method="POST"class="signup-form" id="signupForm">
                <h2>Sign Up</h2>
                <input type="text" id="FirstName" name="FirstName" placeholder="First Name" required>
                <input type="text" id="LastName" name="LastName" placeholder="Last Name" required>
                <input type="text" id="username" name="username" placeholder="username"required>
                <input type="email" id="email" name="email" placeholder="Email" required>
                <input type="password" id="password" name="password" placeholder="Password" required>
                <button type="submit">Sign Up</button>
                <a href="#" id="showlogin">Log In</a>
            </form>
        </div>
    </div>
    <script src="../js/login.js"></script>
</body>
</html>
