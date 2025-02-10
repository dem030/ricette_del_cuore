<?php
include '../api/connect.php';
session_start();
if (isset($_SESSION['message'])) {
    echo "<script>alert('" . $_SESSION['message'] . "');</script>";
    unset($_SESSION['message']); 
}


try {
    // Recupera le ricette dalla tabella 'ricette'
    $query1 = "SELECT id, titolo, ingredienti, ricetta, tempo_preparazione, difficolta, cucina FROM ricette";
    $result1 = $conn->query($query1);
    $ricette = [];
    while ($row = $result1->fetch_assoc()) {
        $row['tabella'] = 'ricette';
        $ricette[] = $row;
    }

    // Recupera le ricette dalla tabella 'ricette_regione'
    $query2 = "SELECT id, titolo, regione, difficolta, descrizione FROM ricette_regione";
    $result2 = $conn->query($query2);
    $ricette_regione = [];
    while ($row = $result2->fetch_assoc()) {
        $row['tabella'] = 'ricette_regione';
        $ricette_regione[] = $row;
    }

    // Unisce le due serie di ricette
    $recipes = array_merge($ricette, $ricette_regione);
} catch (Exception $e) {
    die("Errore di connessione: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Account personale</title>
    <link rel="stylesheet" href="../css/account.css">
</head>
<body> 
<div class="header_account">
    <h1> Modifica Ricette</h1>
    <div >
    <a href="../account/inserisci_ricetta.php">aggungi una nuova ricetta</a>
    <a href="../index.php">Logout</a>
    </div>    
</div>
    <!-- Visualizza eventuali messaggi (es. aggiornamento riuscito) -->
    <?php if (isset($_GET['message'])): ?>
        <p class="message"><?php echo htmlspecialchars($_GET['message']); ?></p>
    <?php endif; ?>

    <div id="recipes-container">
        <?php if (!empty($recipes)): ?>
            <?php foreach ($recipes as $recipe): ?>
                <div class="recipe-box">
                    <h2><?php echo htmlspecialchars($recipe['titolo']); ?></h2>
                    <?php if ($recipe['tabella'] == 'ricette'): ?>
                        <p><strong>Ingredienti:</strong> <?php echo nl2br(htmlspecialchars($recipe['ingredienti'])); ?></p>
                        <p><strong>Ricetta:</strong> <?php echo nl2br(htmlspecialchars($recipe['ricetta'])); ?></p>
                        <p><strong>Tempo di Preparazione:</strong> <?php echo htmlspecialchars($recipe['tempo_preparazione']); ?> minuti</p>
                        <p><strong>Difficoltà:</strong> <?php echo htmlspecialchars($recipe['difficolta']); ?></p>
                        <p><strong>Cucina:</strong> <?php echo htmlspecialchars($recipe['cucina']); ?></p>
                    <?php else: ?>
                        <p><strong>Regione:</strong> <?php echo htmlspecialchars($recipe['regione']); ?></p>
                        <p><strong>Difficoltà:</strong> <?php echo htmlspecialchars($recipe['difficolta']); ?></p>
                        <p><strong>Descrizione:</strong> <?php echo nl2br(htmlspecialchars($recipe['descrizione'])); ?></p>
                    <?php endif; ?>
                    <!-- Link per modificare la ricetta; vengono passati id e tabella via GET -->
                    <a class="modify-btn" href="modifica_ricetta.php?id=<?php echo $recipe['id']; ?>&tabella=<?php echo $recipe['tabella']; ?>">Modifica</a>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Nessuna ricetta trovata.</p>
        <?php endif; ?>
    </div>
</body>
</html>
