<?php
require_once 'auth.php';

// Il logout avviene solo via POST con token CSRF:
// così un sito esterno non può disconnettere l'utente con un semplice link.
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../index.php');
    exit;
}

verifica_csrf();
termina_sessione();

header('Location: ../index.php');
exit;
