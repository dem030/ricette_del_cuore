<?php
// homepage.php

include '../api/connect.php'; 


if (isset($_GET['region']) && !empty($_GET['region'])) {
  $region = trim($_GET['region']);
  
  // Query per recuperare le ricette per la regione scelta dalla tabella "ricette_regione"
  $sql = "SELECT titolo, foto, difficolta, descrizione FROM ricette_regione WHERE regione = ?";
  $stmt = $conn->prepare($sql);
  if ($stmt) {
      $stmt->bind_param("s", $region);
      $stmt->execute();
      $result = $stmt->get_result();
      $piatti = $result->fetch_all(MYSQLI_ASSOC);
      $stmt->close();
  } else {
      $piatti = [];
  }
  $conn->close();
  
  // Output delle ricette in formato HTML
  if (!empty($piatti)) {
      foreach ($piatti as $piatto) {
          ?>
          <div class="piatto">
            <h2><?php echo htmlspecialchars($piatto['titolo']); ?></h2>
            <img src="<?php echo htmlspecialchars($piatto['foto']); ?>" alt="<?php echo htmlspecialchars($piatto['titolo']); ?>">
            <p><strong>Difficoltà:</strong> <?php echo htmlspecialchars($piatto['difficolta']); ?></p>
            <p><?php echo nl2br(htmlspecialchars($piatto['descrizione'])); ?></p>
          </div>
          <?php
      }
  } else {
      echo "<p>Nessuna ricetta trovata per la regione " . htmlspecialchars($region) . ".</p>";
  }
  exit();
}


?>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Homepage</title>
  <link rel="stylesheet" href="../css/homepage.css">
</head>
<body>
  <h1>Benvenuto</h1>
  <h2>Cliccando una delle regioni sottostanti scoprirai tutte le specialità tipiche di quella regione con annesse foto e descrizioni.</h2>
  <a class="return-btn" href="../index.php">home</a>
  <!-- Mappa interattiva -->
  <img src="../images/italy-map.jpg" alt="Mappa d'Italia" usemap="#italia">
  
  <!-- Definizione della mappa -->
  <map name="italia">
  <area target="" alt="piemonte" title="piemonte" href="#" selected_region="Piemonte" coords="303,342,290,328,281,334,277,343,260,341,240,345,216,350,199,372,199,393,177,393,144,396,84,369,81,321,94,289,67,254,111,238,127,206,182,195,203,175,205,144,225,105,259,92,273,136,260,157,252,184,268,205,264,233,250,237,248,275,267,282,283,292,300,313,305,330,309,334,263,339,235,299" shape="poly">
    <area target="" alt="valle-d-aosta" title="valle-d-aosta" href="#" selected_region="Valle-d-Aosta" coords="123,210,108,194,100,175,95,158,116,148,129,148,159,147,182,152,196,168,185,185,176,195" shape="poly">
    <area target="" alt="lombardia" title="lombardia" href="#" selected_region="Lombardia" coords="453,91,413,81,417,134,339,90,313,148,295,167,280,140,259,159,268,199,280,227,261,241,252,266,268,279,308,322,325,282,348,272,374,273,403,288,428,298,456,303,507,306,518,304,482,279,457,248,449,216,461,192,444,183,441,154,449,135,450,112" shape="poly">
    <area target="" alt="trentino-alto-adige" title="trentino-alto-adige" href="#" selected_region="Trentino-Alto-Adige" coords="489,201,473,178,447,179,448,143,459,116,464,91,457,50,533,37,618,32,629,74,597,82,572,109,581,136,565,152,553,165,522,169,504,202" shape="poly">
    <area target="" alt="veneto" title="veneto" href="#" selected_region="Veneto" coords="618,333,605,316,561,309,533,315,490,275,456,232,470,190,497,204,515,190,525,173,540,173,556,169,575,148,585,132,582,108,603,87,625,85,646,90,618,128,630,144,619,173,635,188,672,193,683,235,636,242,611,243,597,273,605,301" shape="poly">
    <area target="" alt="friuli-venezia-giulia" title="friuli-venezia-giulia" href="#" selected_region="Friuli-Venezia-Giulia" coords="684,223,680,200,674,189,659,188,641,187,629,167,633,155,637,145,628,135,627,123,634,112,644,104,654,98,662,95,684,95,704,104,733,115,745,116,724,133,710,140,713,158,725,158,736,166,731,183,740,193,740,211,752,220,754,231,746,231,733,222,722,223,716,233,700,217,712,222" shape="poly">
    <area target="" alt="emilia-romagna" title="emilia-romagna" href="#" selected_region="Emilia-Romagna" coords="355,378,345,371,334,371,334,361,335,347,326,342,315,339,319,325,324,310,324,298,330,287,340,280,355,280,367,280,385,281,404,292,420,299,445,305,476,312,509,313,528,315,576,314,594,318,620,334,610,345,603,371,608,399,619,428,632,450,630,460,621,452,611,458,595,448,583,457,572,464,571,472,552,466,534,447,545,432,533,417,510,413,492,418,467,418,444,418,423,399,396,385,378,368,369,367,360,366" shape="poly">
    <area target="" alt="liguria" title="liguria" href="#" selected_region="Liguria" coords="130,441,163,434,184,425,198,416,209,401,222,389,237,369,261,365,291,374,311,391,341,410,356,420,375,427,368,406,352,380,333,372,322,363,325,347,303,337,282,339,268,347,247,345,216,353,205,369,196,389,176,399,152,397,147,417,133,429" shape="poly">
    <area target="" alt="toscana" title="toscana" href="#" selected_region="Toscana" coords="336,372,354,378,372,408,386,440,389,491,352,549,340,617,391,680,455,685,472,665,492,655,504,655,508,636,525,626,525,606,528,596,541,596,541,570,545,551,557,540,561,517,561,502,566,488,577,480,546,461,524,440,531,427,515,417,480,418,450,423,419,407,389,382,372,373,361,372" shape="poly">
    <area target="" alt="marche" title="marche" href="#" selected_region="Marche" coords="575,496,586,482,575,463,596,454,623,464,644,454,728,536,748,601,693,623,650,597,634,549,622,521,592,506" shape="poly">
    <area target="" alt="umbria" title="umbria" href="#" selected_region="Umbria" coords="674,621,613,661,587,658,557,628,546,600,552,556,570,538,570,505,586,503,612,518,628,543,640,590,659,606" shape="poly">
    <area target="" alt="lazio" title="lazio" href="#" selected_region="Lazio" coords="653,839,615,802,559,738,498,669,522,642,532,615,541,610,550,636,567,644,581,661,596,672,615,669,631,660,645,650,663,642,672,633,683,628,694,638,678,647,673,669,677,690,686,703,672,703,658,710,663,725,688,739,694,753,707,759,716,762,724,757,748,771,753,797,749,807,741,823,736,833,716,836,693,830,674,829,660,826" shape="poly">
    <area target="" alt="abruzzo" title="abruzzo" href="#" selected_region="Abruzzo" coords="744,609,699,622,690,646,681,670,690,695,671,709,665,723,689,739,695,750,714,758,733,753,743,763,754,763,770,746,791,749,798,759,822,724,827,710,794,691,763,652" shape="poly">
    <area target="" alt="molise" title="molise" href="#" selected_region="Molise" coords="753,773,757,795,788,803,809,812,839,809,846,802,843,788,852,778,860,765,860,744,844,728,832,723,818,741,807,757,791,760,781,751,768,761" shape="poly">
    <area target="" alt="campania" title="campania" href="#" selected_region="Campania" coords="752,805,740,813,733,834,733,853,748,889,720,899,734,918,758,906,784,906,760,936,820,928,839,938,839,972,865,994,886,1010,907,1000,921,972,908,943,887,906,885,884,897,879,902,866,878,861,868,848,868,835,853,820,853,809,830,812,813,818,796,813,769,804" shape="poly">
    <area target="" alt="puglia" title="puglia" href="#" selected_region="Puglia" coords="874,850,894,859,912,857,933,853,953,866,970,883,989,901,1017,905,1024,936,1038,951,1071,937,1087,953,1110,967,1148,976,1156,990,1160,1017,1190,1033,1199,1038,1201,1011,1213,998,1194,961,1173,935,1146,914,1103,890,1063,863,1008,840,961,812,938,795,968,767,970,745,946,740,912,744,882,742,873,742,865,744,861,761,856,778,851,782,849,798,864,823" shape="poly">
    <area target="" alt="basilicata" title="basilicata" href="#" selected_region="Basilicata" coords="909,1005,930,973,919,958,909,938,903,922,895,907,890,891,901,878,906,861,921,855,935,853,943,862,949,869,960,882,979,899,993,906,1012,905,1020,915,1019,932,1034,950,1032,963,1029,973,1024,982,1007,985,996,986,983,995,987,1003,983,1010,971,1017,954,1018,954,1008,943,1003,933,1008,923,1015" shape="poly">
    <area target="" alt="calabria" title="calabria" href="#" selected_region="Calabria" coords="1018,987,999,990,990,999,985,1009,981,1018,960,1020,950,1009,939,1008,931,1011,924,1020,932,1045,942,1066,949,1082,954,1108,961,1129,971,1154,973,1176,956,1178,937,1186,935,1201,941,1214,931,1226,921,1243,911,1249,903,1269,918,1284,932,1290,953,1287,967,1271,981,1246,1000,1228,1010,1219,1011,1186,1007,1168,1033,1159,1060,1155,1070,1151,1071,1118,1071,1098,1062,1077,1037,1065,1012,1057,1002,1044,1006,1024,1013,1015,1012,1003" shape="poly">
    <area target="" alt="sicilia" title="sicilia" href="#" selected_region="Sicilia" coords="907,1244,880,1293,851,1348,861,1389,882,1417,844,1465,765,1455,694,1394,638,1350,574,1332,553,1303,510,1252,639,1237,882,1155" shape="poly">
    <area target="" alt="sardegna" title="sardegna" href="#" selected_region="Sardegna" coords="173,1125,115,1102,111,995,135,802,169,785,259,785,292,795,322,858,313,931,295,979,295,1052,261,1103,218,1081,219,1111" shape="poly">
  </map>
  
 
  <div id="recipe-container">
  </div>
  
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
    // Seleziona tutte le aree della mappa (il tag <area> all'interno della mappa "italia")
    const areas = document.querySelectorAll('map[name="italia"] area');
  
    areas.forEach(function(area) {
      area.addEventListener('click', function(e) {
        e.preventDefault(); // Impedisci il comportamento di default
        
        // Leggi il valore della regione dall'attributo data-region
        const region = this.getAttribute('selected_region');
       
        const url = 'homepage.php?region=' + encodeURIComponent(region);
  
        
        fetch(url)
          .then(response => {
            if (!response.ok) {
              throw new Error('Errore nella risposta del server');
            }
            return response.text();
          })
          .then(html => {
            // Inserisci il contenuto HTML restituito nel div con id "recipe-container"
            document.getElementById('recipe-container').innerHTML = html;
          })
          .catch(error => {
            console.error('Errore:', error);
            document.getElementById('recipe-container').innerHTML = '<p>Errore nel caricamento delle ricette. Riprova.</p>';
          });
      });
    });
  });
  
  </script>
</body>
</html>
