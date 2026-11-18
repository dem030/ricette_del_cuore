<?php
require_once '../api/connect.php';
require_once '../api/auth.php';
// Pagina riservata: senza login si viene rimandati alla pagina di accesso
richiedi_login();

$messaggio = $_SESSION['message'] ?? null;
unset($_SESSION['message']);


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
    error_log("Errore caricamento ricette: " . $e->getMessage());
    die("Si è verificato un errore. Riprova più tardi.");
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Account personale</title>
    <link rel="stylesheet" href="../css/account.css">
    <?php if ($messaggio !== null): ?>
    <script>
        // json_encode con i flag JSON_HEX_* produce una stringa JavaScript sicura:
        // apici, < e > vengono codificati, quindi il testo non può uscire dalla stringa (no XSS)
        alert(<?php echo json_encode($messaggio, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP); ?>);
    </script>
    <?php endif; ?>
</head>
<body> 
<div class="header_account">
    <h1> Modifica Ricette</h1>
    <div >
    <a href="../account/inserisci_ricetta.php">aggungi una nuova ricetta</a>
    <!-- Logout via POST + token CSRF: distrugge davvero la sessione lato server -->
    <form action="../api/logout.php" method="post" class="logout-form">
        <?php echo campo_csrf(); ?>
        <button type="submit">Logout</button>
    </form>
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
                    <a class="modify-btn" href="modifica_ricetta.php?id=<?php echo (int) $recipe['id']; ?>&amp;tabella=<?php echo urlencode($recipe['tabella']); ?>">Modifica</a>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>Nessuna ricetta trovata.</p>
        <?php endif; ?>
    </div>
</body>
</html>
