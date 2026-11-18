<?php
require_once 'connect.php';
require_once 'auth.php';
avvia_sessione();

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../login/login_page.php");
    exit;
}

verifica_csrf();

$FirstName = trim($_POST['FirstName'] ?? '');
$LastName  = trim($_POST['LastName'] ?? '');
$username  = trim($_POST['username'] ?? '');
$email     = trim($_POST['email'] ?? '');
$password  = $_POST['password'] ?? '';

if ($FirstName === '' || $LastName === '' || $username === '') {
    die("Compila tutti i campi.");
}
if (mb_strlen($FirstName) > 100 || mb_strlen($LastName) > 100 || mb_strlen($username) > 100) {
    die("Uno dei campi è troppo lungo.");
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("L'email non è valida.");
}

// Policy minima sulla password
if (strlen($password) < 8
    || !preg_match('/[A-Za-z]/', $password)
    || !preg_match('/[0-9]/', $password)) {
    die("La password deve avere almeno 8 caratteri e contenere almeno una lettera e un numero.");
}

// Impedisce account duplicati con la stessa email o lo stesso username
$check = $conn->prepare("SELECT 1 FROM users WHERE email = ? OR username = ?");
$check->bind_param("ss", $email, $username);
$check->execute();
if ($check->get_result()->fetch_row()) {
    die("Email o username già registrati.");
}
$check->close();

// Argon2id: hash lento e memory-hard, con salt casuale incluso nell'hash
$hashed_password = password_hash($password, PASSWORD_ARGON2ID);

$stmt = $conn->prepare("INSERT INTO users (FirstName, LastName, username, email, password) VALUES (?,?,?,?,?)");
$stmt->bind_param("sssss", $FirstName, $LastName, $username, $email, $hashed_password);

if ($stmt->execute()) {
    header("Location: ../login/login_page.php");
    exit;
}

// Il dettaglio tecnico va nel log, all'utente un messaggio generico
error_log("Errore durante la registrazione: " . $stmt->error);
die("Registrazione non riuscita. Riprova più tardi.");
