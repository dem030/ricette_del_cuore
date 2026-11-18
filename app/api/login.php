<?php
require_once 'connect.php';
require_once 'auth.php';
avvia_sessione();

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: ../login/login_page.php");
    exit;
}

verifica_csrf();

// Limite di tentativi: dopo 5 errori il login è bloccato per 5 minuti.
// (Limite per sessione: in produzione andrebbe salvato lato server per IP/account.)
const MAX_TENTATIVI = 5;
const BLOCCO_SECONDI = 300;

if (($_SESSION['tentativi_login'] ?? 0) >= MAX_TENTATIVI
    && time() - ($_SESSION['ultimo_tentativo'] ?? 0) < BLOCCO_SECONDI) {
    http_response_code(429);
    die("Troppi tentativi di accesso. Riprova tra qualche minuto.");
}

function login_fallito(): void
{
    $_SESSION['tentativi_login'] = ($_SESSION['tentativi_login'] ?? 0) + 1;
    $_SESSION['ultimo_tentativo'] = time();
    // Messaggio generico: non rivela se l'email esiste (contro la user enumeration)
    die("Login fallito. Email o password non validi.");
}

$email    = trim($_POST['email'] ?? '');
$password = $_POST['password'] ?? '';

if ($email === '' || $password === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
    login_fallito();
}

$stmt = $conn->prepare("SELECT email, password, FirstName FROM users WHERE email = ?");
if (!$stmt) {
    error_log("Errore nella preparazione della query: " . $conn->error);
    die("Si è verificato un errore. Riprova più tardi.");
}
$stmt->bind_param("s", $email);
$stmt->execute();
$row = $stmt->get_result()->fetch_assoc();
$stmt->close();

// password_verify confronta in tempo costante con l'hash Argon2id salvato
if (!$row || !password_verify($password, $row['password'])) {
    login_fallito();
}

// Se i parametri di hashing sono cambiati, aggiorna l'hash salvato
if (password_needs_rehash($row['password'], PASSWORD_ARGON2ID)) {
    $nuovo = password_hash($password, PASSWORD_ARGON2ID);
    $upd = $conn->prepare("UPDATE users SET password = ? WHERE email = ?");
    $upd->bind_param("ss", $nuovo, $row['email']);
    $upd->execute();
}

// Nuovo ID di sessione dopo il login (contro la session fixation)
session_regenerate_id(true);
unset($_SESSION['tentativi_login'], $_SESSION['ultimo_tentativo']);
// Nuovo token CSRF legato alla sessione autenticata
unset($_SESSION['csrf_token']);

$_SESSION['email']     = $row['email'];
$_SESSION['FirstName'] = $row['FirstName'];

header("Location: ../account/account.php");
exit;
