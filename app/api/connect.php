<?php
// Le credenziali NON sono scritte nel codice: arrivano da variabili d'ambiente
// impostate in docker-compose.yaml a partire dal file .env (escluso da git).
$servername = getenv('DB_HOST') ?: 'db';
$username   = getenv('DB_USER');
$password   = getenv('DB_PASSWORD');
$dbname     = getenv('DB_NAME') ?: 'ricette';

mysqli_report(MYSQLI_REPORT_OFF);
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    // Il dettaglio dell'errore va solo nel log del server, non all'utente
    error_log('Connessione al database fallita: ' . $conn->connect_error);
    http_response_code(500);
    die('Servizio momentaneamente non disponibile. Riprova più tardi.');
}
$conn->set_charset('utf8mb4');
