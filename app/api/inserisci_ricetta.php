<?php
include 'connect.php';
session_start();

// Verifica che i dati base siano presenti
if (!isset($_POST['tabella'], $_POST['titolo'], $_POST['difficolta'])) {
    $_SESSION['message'] = "Dati mancanti.";
    header("Location: ../account/account.php");
    exit;
}

$tabella   = $_POST['tabella'];
$titolo    = $conn->real_escape_string($_POST['titolo']);
$difficolta= $conn->real_escape_string($_POST['difficolta']);

// Controlla che la tabella sia valida
if (!in_array($tabella, ['ricette', 'ricette_regione'])) {
    $_SESSION['message'] = "Tabella non valida.";
    header("Location: ../account/account.php");
    exit;
}

if ($tabella === 'ricette') {
    // Inserimento per ricetta internazionale
    if (!isset($_POST['ingredienti'], $_POST['ricetta'], $_POST['tempo_preparazione'], $_POST['cucina'])) {
        $_SESSION['message'] = "Dati mancanti per la ricetta internazionale.";
        header("Location: ../account/account.php");
        exit;
    }
    
    $ingredienti        = $conn->real_escape_string($_POST['ingredienti']);
    $ricetta            = $conn->real_escape_string($_POST['ricetta']);
    $tempo_preparazione = (int) $_POST['tempo_preparazione'];
    $cucina             = $conn->real_escape_string($_POST['cucina']);
    
    $query = "INSERT INTO ricette (titolo, ingredienti, ricetta, difficolta, tempo_preparazione, cucina) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $_SESSION['message'] = "Errore nella preparazione della query.";
        header("Location: ../account/account.php");
        exit;
    }
    $stmt->bind_param("ssssis", $titolo, $ingredienti, $ricetta, $difficolta, $tempo_preparazione, $cucina);
    
} elseif ($tabella === 'ricette_regione') {
    // Inserimento per ricetta regionale
    if (!isset($_POST['foto'], $_POST['regione'], $_POST['descrizione'])) {
        $_SESSION['message'] = "Dati mancanti per la ricetta regionale.";
        header("Location: ../account/account.php");
        exit;
    }
    
    $foto        = $conn->real_escape_string($_POST['foto']);
    $regione     = $conn->real_escape_string($_POST['regione']);
    $descrizione = $conn->real_escape_string($_POST['descrizione']);
    
    $query = "INSERT INTO ricette_regione (foto, titolo, regione, difficolta, descrizione) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    if (!$stmt) {
        $_SESSION['message'] = "Errore nella preparazione della query.";
        header("Location: ../account/account.php");
        exit;
    }
    $stmt->bind_param("sssss", $foto, $titolo, $regione, $difficolta, $descrizione);
}

// Esegui la query
if ($stmt->execute()) {
    $_SESSION['message'] = "Ricetta inserita con successo!";
    header("Location: ../account/account.php");
    exit;
} else {
    $_SESSION['message'] = "Errore durante l'inserimento della ricetta.";
    header("Location: ../account/account.php");
    exit;
}
?>
