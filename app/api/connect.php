<?
$servername = "db";
$username = "root";
$password = "123";
$dbname = "ricette";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}
?>