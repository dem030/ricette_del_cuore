<?php
// Includi la connessione al database se necessario per altre operazioni (opzionale)
// include '../api/connect.php';
?>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ricette</title>
  <link rel="stylesheet" href="../css/ricette.css">
  <script>
    // Funzione per effettuare la ricerca dinamica
    function searchRecipes() {
      // Crea un FormData partendo dal form
      let form = document.getElementById("searchForm");
      let formData = new FormData(form);

      
      fetch("../api/ricerca_ricette.php", {
        method: "POST",
        body: formData
      })
      .then(response => response.text())
      .then(data => {
        // Aggiorna il contenitore dei risultati con il contenuto restituito
        document.getElementById("recipeResults").innerHTML = data;
      })
      .catch(error => console.error("Errore:", error));
    }

    // Esegue la ricerca dinamica al variare dei campi
    document.addEventListener('DOMContentLoaded', function(){
      // Se si modifica uno dei campi, viene chiamata la funzione searchRecipes()
      let inputs = document.querySelectorAll("#searchForm input");
      inputs.forEach(function(input) {
        input.addEventListener("input", searchRecipes);
      });
    });
  </script>
</head>
<body>
<a class="return-btn" href="../index.php">home</a>
  <div class="container">
    <h1>Ricette</h1>
    <form id="searchForm" class="search-form" method="POST" action="../api/ricerca_ricette.php">
      <input type="text" name="ingredienti" placeholder="Ingredienti...">
      <input type="text" name="ricetta" placeholder="Ricetta...">
      <input type="number" name="tempo" placeholder="Tempo max (minuti)">
      <input type="text" name="difficolta" placeholder="Difficoltà...">
      <input type="text" name="cucina" placeholder="Cucina...">
    </form>

    <!-- Sezione in cui vengono mostrati i risultati -->
    <div id="recipeResults">
      <?php
     
      include '../api/ricerca_ricette.php';
      ?>
    </div>
  </div>
</body>
</html>
