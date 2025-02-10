<?php
include '../api/connect.php';
session_start();

// Verifica che i parametri siano presenti
if (!isset($_GET['id'], $_GET['tabella'])) {
    header("Location: account.php");
    exit;
}

$id = (int) $_GET['id'];
$tabella = $_GET['tabella'];

// Verifica che la tabella sia valida
if (!in_array($tabella, ['ricette', 'ricette_regione'])) {
    header("Location: account.php");
    exit;
}

// Verifica che la connessione sia valida
if (!isset($conn) || !($conn instanceof mysqli)) {
    die("Errore: connessione al database non disponibile.");
}

// Prepara la query per recuperare la ricetta
$query = "SELECT id, titolo, ingredienti, ricetta, tempo_preparazione, difficolta, cucina FROM $tabella WHERE id = ?";
$stmt = $conn->prepare($query);

if (!$stmt) {
    die("Errore nella preparazione della query: ");
}

$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$recipe = $result->fetch_assoc();
$stmt->close();

// Se la ricetta non esiste, reindirizza
if (!$recipe) {
    header("Location: account.php?message=Ricetta non trovata");
    exit;
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Modifica Ricetta</title>
    <link rel="stylesheet" href="../css/modifica_ricetta.css">
</head>
<body>
    <div class="container">
        <h1>Modifica Ricetta</h1>
        <form action="../api/aggiorna_ricetta.php" method="post">
            <input type="hidden" name="id" value="<?php echo htmlspecialchars($recipe['id']); ?>">
            <input type="hidden" name="tabella" value="<?php echo htmlspecialchars($tabella); ?>">

            <div class="form-group">
                <label for="titolo">Titolo:</label>
                <input type="text" id="titolo" name="titolo" value="<?php echo htmlspecialchars($recipe['titolo']); ?>" required>
            </div>

            <div class="form-group">
                <label for="tempo_preparazione">Tempo di Preparazione (minuti):</label>
                <input type="number" id="tempo_preparazione" name="tempo_preparazione" value="<?php echo htmlspecialchars($recipe['tempo_preparazione']); ?>" required>

                <label for="difficolta">Difficoltà:</label>
                <select id="difficolta" name="difficolta" required>
                    <option value="Facile" <?php echo ($recipe['difficolta'] == 'Facile') ? 'selected' : ''; ?>>Facile</option>
                    <option value="Medio" <?php echo ($recipe['difficolta'] == 'Medio') ? 'selected' : ''; ?>>Medio</option>
                    <option value="Difficile" <?php echo ($recipe['difficolta'] == 'Difficile') ? 'selected' : ''; ?>>Difficile</option>
                </select>
            </div>

            <div class="form-group">
                <label for="cucina">Cucina:</label>
                <input type="text" id="cucina" name="cucina" value="<?php echo htmlspecialchars($recipe['cucina']); ?>" required>
            </div>

            <div class="form-group">
                <label for="ingredienti">Ingredienti:</label>
                <textarea id="ingredienti" name="ingredienti" rows="5" required><?php echo htmlspecialchars($recipe['ingredienti']); ?></textarea>
            </div>

            <div class="form-group">
                <label for="ricetta">Ricetta:</label>
                <textarea id="ricetta" name="ricetta" rows="5" required><?php echo htmlspecialchars($recipe['ricetta']); ?></textarea>
            </div>

            <button type="submit">Salva</button>
            <a href="account.php">Annulla</a>
        </form>
    </div>
</body>

</html>
