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

// Verifica che i dati base siano presenti
if (!isset($_POST['tabella'], $_POST['titolo'], $_POST['difficolta'])) {
    torna_ad_account("Dati mancanti.");
}

// Nota: con i prepared statements non serve real_escape_string
// (anzi, salverebbe nel DB dei backslash in più).
$tabella    = $_POST['tabella'];
$titolo     = trim($_POST['titolo']);
$difficolta = $_POST['difficolta'];

// Whitelist: tabella e difficoltà possono assumere solo valori previsti
if (!in_array($tabella, ['ricette', 'ricette_regione'], true)) {
    torna_ad_account("Tabella non valida.");
}
if (!in_array($difficolta, ['Facile', 'Medio', 'Difficile'], true)) {
    torna_ad_account("Difficoltà non valida.");
}

if ($tabella === 'ricette') {
    // Inserimento per ricetta internazionale
    if (!isset($_POST['ingredienti'], $_POST['ricetta'], $_POST['tempo_preparazione'], $_POST['cucina'])) {
        torna_ad_account("Dati mancanti per la ricetta internazionale.");
    }

    $ingredienti        = $_POST['ingredienti'];
    $ricetta            = $_POST['ricetta'];
    $tempo_preparazione = (int) $_POST['tempo_preparazione'];
    $cucina             = $_POST['cucina'];

    $stmt = $conn->prepare("INSERT INTO ricette (titolo, ingredienti, ricetta, difficolta, tempo_preparazione, cucina) VALUES (?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        torna_ad_account("Errore nella preparazione della query.");
    }
    $stmt->bind_param("ssssis", $titolo, $ingredienti, $ricetta, $difficolta, $tempo_preparazione, $cucina);

} else {
    // Inserimento per ricetta regionale
    if (!isset($_POST['foto'], $_POST['regione'], $_POST['descrizione'])) {
        torna_ad_account("Dati mancanti per la ricetta regionale.");
    }

    $foto        = trim($_POST['foto']);
    $regione     = $_POST['regione'];
    $descrizione = $_POST['descrizione'];

    // Solo URL http/https: blocca javascript:, data:, ecc.
    if (!url_sicuro($foto)) {
        torna_ad_account("L'URL della foto non è valido (deve iniziare con http:// o https://).");
    }

    $stmt = $conn->prepare("INSERT INTO ricette_regione (foto, titolo, regione, difficolta, descrizione) VALUES (?, ?, ?, ?, ?)");
    if (!$stmt) {
        torna_ad_account("Errore nella preparazione della query.");
    }
    $stmt->bind_param("sssss", $foto, $titolo, $regione, $difficolta, $descrizione);
}

if ($stmt->execute()) {
    torna_ad_account("Ricetta inserita con successo!");
}
error_log("Errore inserimento ricetta: " . $stmt->error);
torna_ad_account("Errore durante l'inserimento della ricetta.");
