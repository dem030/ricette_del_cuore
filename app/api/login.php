<?php
include 'connect.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Controlla se i campi email e password sono stati inviati
    if (empty($_POST['email']) || empty($_POST['password'])) {
        die("Email e password sono obbligatorie.");
    }

    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // Valida il formato dell'email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Formato email non valido.");
    }

    // Prepara la query per recuperare i dati dell'utente
    $sql = "SELECT email, password, FirstName FROM users WHERE email = ?";
    if ($stmt = $conn->prepare($sql)) {
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        if ($row) {
            // Verifica la password inserita con quella memorizzata
            if (password_verify($password, $row['password'])) {
                // Rigenera l'ID della sessione per prevenire attacchi di session fixation
                session_regenerate_id(true);

                // Salva il nome dell'utente nella sessione (puoi salvare anche altri dati se necessario)
                $_SESSION['FirstName'] = $row['FirstName'];

                // Assicurati che non ci sia output prima del reindirizzamento
                header("Location: ../account/account.php");
                exit(); // Ensure the script stops after redirection
            } else {
                // Messaggio di errore generico per sicurezza
                echo "Login failed. Invalid password or username";
            }
        } else {
            // Messaggio di errore generico per sicurezza
            echo "Login failed. Invalid password or username";
        }

        $stmt->close();
    } else {
        // Gestione dell'errore nella preparazione della query
        error_log("Errore nella preparazione della query: " . $conn->error);
        die("Si è verificato un errore. Riprova più tardi.");
    }
}
?>
