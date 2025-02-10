<?php
// Includi il file per la connessione al database
include '../api/connect.php';

// Recupera i parametri dal POST (se esistono)
$ingredienti = isset($_POST['ingredienti']) ? trim($_POST['ingredienti']) : '';
$ricetta = isset($_POST['ricetta']) ? trim($_POST['ricetta']) : '';
$tempo = isset($_POST['tempo']) ? trim($_POST['tempo']) : '';
$difficolta = isset($_POST['difficolta']) ? trim($_POST['difficolta']) : '';
$cucina = isset($_POST['cucina']) ? trim($_POST['cucina']) : '';

// Costruzione della query di base
$sql = "SELECT titolo,ingredienti, ricetta, tempo_preparazione, difficolta, cucina FROM ricette WHERE 1=1";
$params = [];
$types = "";

// Aggiungi i filtri se i campi sono stati compilati
if (!empty($ingredienti)) {
    $sql .= " AND ingredienti LIKE ?";
    $params[] = "%" . $ingredienti . "%";
    $types .= "s";
}
if (!empty($ricetta)) {
    $sql .= " AND titolo LIKE ?";
    $params[] = "%" . $ricetta . "%";
    $types .= "s";
}
if (!empty($tempo)) {
    $sql .= " AND tempo_preparazione <= ?";
    $params[] = $tempo;
    $types .= "i";
}
if (!empty($difficolta)) {
    $sql .= " AND difficolta LIKE ?";
    $params[] = "%" . $difficolta . "%";
    $types .= "s";
}
if (!empty($cucina)) {
    $sql .= " AND cucina LIKE ?";
    $params[] = "%" . $cucina . "%";
    $types .= "s";
}

// Prepariamo ed eseguiamo la query
$stmt = $conn->prepare($sql);
if ($stmt) {
    if (!empty($params)) {
        $stmt->bind_param($types, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
    $ricette = $result->fetch_all(MYSQLI_ASSOC);
    $stmt->close();
} else {
    $ricette = [];
}
$conn->close();

// Genera l'output HTML per ciascuna ricetta
echo '<div class="recipes">';
if (!empty($ricette)) {
    foreach ($ricette as $row) {
        echo '<div class="recipe">';
        echo '<h2>' . htmlspecialchars($row['titolo']) . '</h2>';
        if (!empty($row['foto'])) {
            echo '<img src="' . htmlspecialchars($row['foto']) . '" alt="' . htmlspecialchars($row['titolo']) . '">';
        }
        echo '<p><strong>Ingredienti:</strong> ' . htmlspecialchars($row['ingredienti']) . '</p>';
        echo '<p><strong>Tempo di preparazione:</strong> ' . htmlspecialchars($row['tempo_preparazione']) . ' minuti</p>';
        echo '<p><strong>Difficoltà:</strong> ' . htmlspecialchars($row['difficolta']) . '</p>';
        echo '<p><strong>Cucina:</strong> ' . htmlspecialchars($row['cucina']) . '</p>';
        echo '<p>' . nl2br(htmlspecialchars($row['ricetta'])) . '</p>';
        echo '</div>';
    }
} else {
    echo "<p class='no-results'>Nessuna ricetta trovata.</p>";
}
echo '</div>';
?>
