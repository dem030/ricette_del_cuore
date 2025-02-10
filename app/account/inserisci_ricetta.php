<?php
session_start();

?>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Inserisci Nuova Ricetta</title>
    <link rel="stylesheet" href="../css/inserisci_ricetta.css">
    <script>
      // Funzione per mostrare/nascondere i campi a seconda del tipo di ricetta scelto
      function toggleFields() {
          var tipo = document.getElementById("tipo_ricetta").value;
          if (tipo === "ricette") {
              // Ricetta Internazionale
              document.getElementById("internazionale-fields").style.display = "block";
              document.getElementById("regionale-fields").style.display = "none";
              // Imposto come obbligatori i campi internazionali...
              document.getElementById("ingredienti").required = true;
              document.getElementById("ricetta").required = true;
              document.getElementById("tempo_preparazione").required = true;
              document.getElementById("cucina").required = true;
              // ...e rimuovo l'obbligatorietà dei campi regionali
              document.getElementById("foto").required = false;
              document.getElementById("regione").required = false;
              document.getElementById("descrizione").required = false;
          } else if (tipo === "ricette_regione") {
              // Ricetta per Regione
              document.getElementById("internazionale-fields").style.display = "none";
              document.getElementById("regionale-fields").style.display = "block";
              // Rimuovo l'obbligatorietà dei campi internazionali
              document.getElementById("ingredienti").required = false;
              document.getElementById("ricetta").required = false;
              document.getElementById("tempo_preparazione").required = false;
              document.getElementById("cucina").required = false;
              // Imposto come obbligatori i campi regionali
              document.getElementById("foto").required = true;
              document.getElementById("regione").required = true;
              document.getElementById("descrizione").required = true;
          }
      }
      
      window.onload = toggleFields;
    </script>
</head>
<body>
    <div class="container">
        <h1>Inserisci Nuova Ricetta</h1>
        
        <form action="../api/inserisci_ricetta.php" method="post">
            <!-- Selezione del tipo di ricetta -->
            <div class="form-group">
                <label for="tipo_ricetta">Tipo di Ricetta:</label>
                <select id="tipo_ricetta" name="tabella" onchange="toggleFields()" required>
                    <option value="ricette">Internazionale</option>
                    <option value="ricette_regione">Per Regione</option>
                </select>
            </div>

            <!-- Campo Titolo (comune a entrambi) -->
            <div class="form-group">
                <label for="titolo">Titolo:</label>
                <input type="text" id="titolo" name="titolo" required>
            </div>

            <!-- Campo Difficoltà (comune a entrambi) -->
            <div class="form-group">
                <label for="difficolta">Difficoltà:</label>
                <select id="difficolta" name="difficolta" required>
                    <option value="Facile">Facile</option>
                    <option value="Medio">Medio</option>
                    <option value="Difficile">Difficile</option>
                </select>
            </div>

            <!-- Campi per la ricetta internazionale -->
            <div id="internazionale-fields">
                <div class="form-group">
                    <label for="ingredienti">Ingredienti:</label>
                    <textarea id="ingredienti" name="ingredienti" rows="5"></textarea>
                </div>
                <div class="form-group">
                    <label for="ricetta">Ricetta:</label>
                    <textarea id="ricetta" name="ricetta" rows="5"></textarea>
                </div>
                <div class="form-group">
                    <label for="tempo_preparazione">Tempo di Preparazione (minuti):</label>
                    <input type="number" id="tempo_preparazione" name="tempo_preparazione">
                </div>
                <div class="form-group">
                    <label for="cucina">Cucina:</label>
                    <input type="text" id="cucina" name="cucina">
                </div>
            </div>

            <!-- Campi per la ricetta regionale -->
            <div id="regionale-fields" style="display:none;">
                <div class="form-group">
                    <label for="foto">URL della Foto:</label>
                    <input type="url" id="foto" name="foto">
                </div>
                <div class="form-group">
                    <label for="regione">Regione:</label>
                    <input type="text" id="regione" name="regione">
                </div>
                <div class="form-group">
                    <label for="descrizione">Descrizione:</label>
                    <textarea id="descrizione" name="descrizione" rows="5"></textarea>
                </div>
            </div>

            <button type="submit">Inserisci Ricetta</button>
            <a href="account.php">Annulla</a>
        </form>
    </div>
</body>
</html>
