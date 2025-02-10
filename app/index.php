<?php
include 'api/connect.php';
if ($conn->connect_error) {
    echo "Connessione fallita: " . $conn->connect_error;
} else {
}
?>


<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Ricette del Cuore - Scopri, condividi e cucina ricette da tutto il mondo. Unisciti alla nostra community di appassionati di cucina!">
  <meta name="keywords" content="ricette, cucina, community, chef, cibo">
  <title>Ricette del Cuore</title>
  <link rel="stylesheet" href="css/front-style.css">
</head>
<body>
  <!-- Bottone per aprire il menu -->
  <button class="open-btn" aria-label="Apri menu">☰ Menu</button>
<div id="sidebar" class="sidebar" aria-hidden="true">
    <button class="close-btn">×</button>
    <a href="home/homepage.php">Specialità tipiche italiane</a>
    <a href="ricettario/pagina_ricette.php">Ricette da tutto il mondo</a>
    <a href="login/login_page.php">Area Riservata</a>
</div>


  <!-- Contenuto Principale -->
  <header class="hero" style="background: url('images/background-hero.jpg') no-repeat center center/cover;">
    <div>
      <h1>Benvenuto su <span>Ricette del Cuore</span></h1>
      <p>Scopri, condividi e cucina ricette da tutto il mondo.</p>
      <a href="#about" class="btn">Scopri di più</a>
    </div>
  </header>

  <!-- Sezione Presentazione Azienda -->
  <section id="presentation" class="presentation">
    <div class="content">
        <h2>Chi Siamo</h2>
        <p>
        "Ricette del Cuore" è una piattaforma online pensata per gli amanti della cucina di tutto il mondo. Il sito permette agli utenti di esplorare, condividere e salvare ricette uniche provenienti da chef professionisti e appassionati di cucina. Con un design semplice e accattivante, offre un'esperienza interattiva che incoraggia la comunità a scoprire nuovi piatti, creare menu personalizzati e condividere le proprie creazioni culinarie.

        Ogni ricetta è pensata per ispirare e per adattarsi a tutte le esigenze culinarie, da chi cerca piatti veloci e salutari a chi vuole sfidare la propria creatività con piatti più complessi. La piattaforma offre anche la possibilità di salvare le ricette preferite, creando così un archivio personale di piatti da riproporre ogni volta che lo si desidera.

        Con una sezione dedicata alla comunità, gli utenti possono scambiarsi consigli, idee e rispondere alle domande degli altri appassionati di cucina, creando un ambiente stimolante e positivo. In "Ricette del Cuore", ogni piatto racconta una storia, e ogni utente ha l'opportunità di lasciare il proprio segno nel mondo culinario.

      Sei pronto a scoprire nuove ricette e a far parte della nostra community? Unisciti a noi e porta la tua passione per la cucina al prossimo livello!
        </p>
    </div>
</section>

  <section id="about" class="about reveal">
    <h2>Che cos'è Ricette del Cuore?</h2>
    <p>
      Il nostro sito ti permette di trovare ricette uniche, salvare i tuoi piatti preferiti 
      e scoprire nuove ispirazioni culinarie ogni giorno.
    </p>
    <div class="features">
      <div class="feature">
        <img src="images/ricette.jpg" alt="Ricette">
        <h3>Tantissime Ricette</h3>
        <p>Esplora migliaia di ricette da chef e appassionati di cucina.</p>
      </div>
      <div class="feature">
        <img src="images/community.jpg" alt="Community">
        <h3>Scopri i piatti tipici di ogni regione</h3>
        <p>Una volta fatto l'accesso ti ritroverai a scoprire tutte le specialità tipiche delle varie regioni italiane!</p>
      </div>
    </div>
  </section>
  <footer>
    <p>&copy; 2025 Ricette del Cuore. Tutti i diritti riservati.</p>
  </footer>

  <script src="js/script.js"></script>
</body>
</html>
