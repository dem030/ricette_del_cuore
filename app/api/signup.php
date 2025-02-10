<?php 
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $FirstName=$_POST['FirstName'];
    $LastName=$_POST['LastName'];
    $username=$_POST['username'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    if ($password) {
        if (!(filter_var($email, FILTER_VALIDATE_EMAIL))) {
            echo "L'email non è valida"; 
            return;
        } 
        $hashed_password = password_hash($password,PASSWORD_ARGON2ID);
        $stmt = $conn -> prepare("INSERT INTO users (FirstName, LastName,username, email, password) VALUES (?,?,?,?,?)");
        $stmt->bind_param("sssss", $FirstName, $LastName, $username, $email, $hashed_password);

        if ($stmt->execute()) {
            header("Location: ../login/login_page.php");
        }else {
            echo "Errore:" . $stmt->error;
        }
        $stmt->close();
    }else{
        echo "Le password non corrispondono";
    }
}

?>