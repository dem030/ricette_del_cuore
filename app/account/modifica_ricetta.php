<?php
require_once '../api/connect.php';
require_once '../api/auth.php';
richiedi_login();

// Verifica che i parametri siano presenti
if (!isset($_GET['id'], $_GET['tabella'])) {
    header("Location: account.php");
    exit;
}

$id = (int) $_GET['id'];
$tabella = $_GET['tabella'];

// Whitelist: il nome della tabella non può essere parametrizzato,
// quindi viene accettato solo se è uno dei due valori previsti
$colonne = [
    'ricette'         => 'id, titolo, ingredienti, ricetta, tempo_preparazione, difficolta, cucina',
    'ricette_regione' => 'id, titolo, regione, difficolta, descrizione',
];
if (!isset($colonne[$tabella])) {
    header("Location: account.php");
    exit;
}

$stmt = $conn->prepare("SELECT {$colonne[$tabella]} FROM $tabella WHERE id = ?");
if (!$stmt) {
    error_log("Errore nella preparazione della query: " . $conn->error);
    die("Si è verificato un errore. Riprova più tardi.");
}
$stmt->bind_param("i", $id);
$stmt->execute();
$recipe = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$recipe) {
    header("Location: account.php?message=" . urlencode("Ricetta non trovata"));
    exit;
}

function e($valore): string
{
    return htmlspecialchars((string) $valore, ENT_QUOTES, 'UTF-8');
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
            <?php echo campo_csrf(); ?>
            <input type="hidden" name="id" value="<?php echo e($recipe['id']); ?>">
            <input type="hidden" name="tabella" value="<?php echo e($tabella); ?>">

            <div class="form-group">
                <label for="titolo">Titolo:</label>
                <input type="text" id="titolo" name="titolo" value="<?php echo e($recipe['titolo']); ?>" required>
            </div>

            <div class="form-group">
                <?php if ($tabella === 'ricette'): ?>
                <label for="tempo_preparazione">Tempo di Preparazione (minuti):</label>
                <input type="number" id="tempo_preparazione" name="tempo_preparazione" value="<?php echo e($recipe['tempo_preparazione']); ?>" required>
                <?php endif; ?>

                <label for="difficolta">Difficoltà:</label>
                <select id="difficolta" name="difficolta" required>
                    <?php foreach (['Facile', 'Medio', 'Difficile'] as $d): ?>
                    <option value="<?php echo $d; ?>" <?php echo ($recipe['difficolta'] === $d) ? 'selected' : ''; ?>><?php echo $d; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <?php if ($tabella === 'ricette'): ?>
            <div class="form-group">
                <label for="cucina">Cucina:</label>
                <input type="text" id="cucina" name="cucina" value="<?php echo e($recipe['cucina']); ?>" required>
            </div>

            <div class="form-group">
                <label for="ingredienti">Ingredienti:</label>
                <textarea id="ingredienti" name="ingredienti" rows="5" required><?php echo e($recipe['ingredienti']); ?></textarea>
            </div>

            <div class="form-group">
                <label for="ricetta">Ricetta:</label>
                <textarea id="ricetta" name="ricetta" rows="5" required><?php echo e($recipe['ricetta']); ?></textarea>
            </div>
            <?php else: ?>
            <div class="form-group">
                <label for="regione">Regione:</label>
                <input type="text" id="regione" name="regione" value="<?php echo e($recipe['regione']); ?>" required>
            </div>

            <div class="form-group">
                <label for="descrizione">Descrizione:</label>
                <textarea id="descrizione" name="descrizione" rows="5" required><?php echo e($recipe['descrizione']); ?></textarea>
            </div>
            <?php endif; ?>

            <button type="submit">Salva</button>
            <a href="account.php">Annulla</a>
        </form>
    </div>
</body>

</html>
