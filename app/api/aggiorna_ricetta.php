<?php
require_once 'connect.php';
require_once 'auth.php';

// Solo utenti autenticati, solo POST, solo con token CSRF valido
richiedi_login();
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../account/account.php");
    exit;
}
verifica_csrf();

function torna_ad_account(string $messaggio): void
{
    $_SESSION['message'] = $messaggio;
    header("Location: ../account/account.php");
    exit;
}

// Verifica che siano stati inviati i dati base
if (!isset($_POST['id'], $_POST['tabella'], $_POST['titolo'], $_POST['difficolta'])) {
    torna_ad_account("Dati mancanti.");
}

$id         = (int) $_POST['id'];
$tabella    = $_POST['tabella'];
$titolo     = trim($_POST['titolo']);
$difficolta = $_POST['difficolta'];

// Whitelist sui valori ammessi
if (!in_array($tabella, ['ricette', 'ricette_regione'], true)) {
    torna_ad_account("Tabella non valida.");
}
if (!in_array($difficolta, ['Facile', 'Medio', 'Difficile'], true)) {
    torna_ad_account("Difficoltà non valida.");
}

if ($tabella === 'ricette') {
    if (!isset($_POST['ingredienti'], $_POST['ricetta'], $_POST['tempo_preparazione'], $_POST['cucina'])) {
        torna_ad_account("Dati mancanti per la ricetta.");
    }

    $ingredienti        = $_POST['ingredienti'];
    $ricetta            = $_POST['ricetta'];
    $tempo_preparazione = (int) $_POST['tempo_preparazione'];
    $cucina             = $_POST['cucina'];

    $stmt = $conn->prepare("UPDATE ricette SET titolo = ?, ingredienti = ?, ricetta = ?, difficolta = ?, tempo_preparazione = ?, cucina = ? WHERE id = ?");
    $stmt->bind_param("ssssisi", $titolo, $ingredienti, $ricetta, $difficolta, $tempo_preparazione, $cucina, $id);
} else {
    if (!isset($_POST['regione'], $_POST['descrizione'])) {
        torna_ad_account("Dati mancanti per la ricetta regionale.");
    }

    $regione     = $_POST['regione'];
    $descrizione = $_POST['descrizione'];

    $stmt = $conn->prepare("UPDATE ricette_regione SET titolo = ?, difficolta = ?, regione = ?, descrizione = ? WHERE id = ?");
    $stmt->bind_param("ssssi", $titolo, $difficolta, $regione, $descrizione, $id);
}

if ($stmt->execute()) {
    torna_ad_account("Ricetta aggiornata con successo.");
}
error_log("Errore aggiornamento ricetta: " . $stmt->error);
torna_ad_account("Errore durante l'aggiornamento.");
