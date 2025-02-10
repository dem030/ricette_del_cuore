<?php
// updateRecipe.php
include 'connect.php';
session_start();

// Verifica che siano stati inviati i dati base
if (!isset($_POST['id'], $_POST['tabella'], $_POST['titolo'])) {
    header("Location: account.php?message=Dati mancanti");
    exit;
}

$id      = (int) $_POST['id'];
$tabella = $_POST['tabella'];
$titolo  = $conn->real_escape_string($_POST['titolo']);

// Controllo che la tabella sia una delle due ammesse
if (!in_array($tabella, ['ricette', 'ricette_regione'])) {
    header("Location: account.php?message=Tabella non valida");
    exit;
}

try {
    if ($tabella === 'ricette') {
        if (!isset($_POST['ingredienti'], $_POST['ricetta'], $_POST['difficolta'], $_POST['tempo_preparazione'], $_POST['cucina'])) {
            header("Location: account.php?message=Dati mancanti per la ricetta");
            exit;
        }
        
        $ingredienti        = $conn->real_escape_string($_POST['ingredienti']);
        $ricetta            = $conn->real_escape_string($_POST['ricetta']);
        $difficolta         = $conn->real_escape_string($_POST['difficolta']);
        $tempo_preparazione = (int) $_POST['tempo_preparazione'];
        $cucina             = $conn->real_escape_string($_POST['cucina']);
        
        $query = "UPDATE ricette SET titolo = ?, ingredienti = ?, ricetta = ?, difficolta = ?, tempo_preparazione = ?, cucina = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("ssssisi", $titolo, $ingredienti, $ricetta, $difficolta, $tempo_preparazione, $cucina, $id);
    } elseif ($tabella === 'ricette_regione') {
        if (!isset($_POST['ingredienti'], $_POST['difficolta'], $_POST['regione'])) {
            header("Location: account.php?message=Dati mancanti per la ricetta regione");
            exit;
        }
        
        $ingredienti = $conn->real_escape_string($_POST['ingredienti']);
        $difficolta  = $conn->real_escape_string($_POST['difficolta']);
        $regione     = $conn->real_escape_string($_POST['regione']);
        
        $query = "UPDATE ricette_regione SET titolo = ?, ingredienti = ?, difficolta = ?, regione = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("ssssi", $titolo, $ingredienti, $difficolta, $regione, $id);
    }

    if ($stmt->execute()) {
        echo "<script>alert('Ricetta aggiornata con successo'); window.location.href='../account/account.php';</script>";
        exit;
    } else {
        header("Location: account.php?message=Errore durante l'aggiornamento");
        exit;
    }
} catch (Exception $e) {
    header("Location: account.php?message=Errore: " . urlencode($e->getMessage()));
    exit;
}
?>