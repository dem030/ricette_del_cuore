<?php
require_once '../api/auth.php';
avvia_sessione();
// Se l'utente ha già fatto login, va direttamente all'area riservata
if (utente_loggato()) {
    header('Location: ../account/account.php');
    exit;
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
                <?php echo campo_csrf(); ?>
                <input type="text" id="email" name="email" placeholder="email" required>
                <input type="password" id="password" name="password" placeholder="Password" required>
                <button type="submit">Log In</button>
                <a href="#" id="showSignup">Sign Up</a>

            </form>
        </div>
        <div class="signup-container">
            <form action= "../api/signup.php" method="POST"class="signup-form" id="signupForm">
                <h2>Sign Up</h2>
                <?php echo campo_csrf(); ?>
                <input type="text" id="FirstName" name="FirstName" placeholder="First Name" required>
                <input type="text" id="LastName" name="LastName" placeholder="Last Name" required>
                <input type="text" id="username" name="username" placeholder="username"required>
                <input type="email" id="email" name="email" placeholder="Email" required>
                <input type="password" id="password" name="password" placeholder="Password (min. 8 caratteri, lettere e numeri)" minlength="8" required>
                <button type="submit">Sign Up</button>
                <a href="#" id="showlogin">Log In</a>
            </form>
        </div>
    </div>
    <script src="../js/login.js"></script>
</body>
</html>
