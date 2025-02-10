document.addEventListener('DOMContentLoaded', function() {
    // Seleziona tutte le aree della mappa (il tag <area> all'interno della mappa "italia")
    const areas = document.querySelectorAll('map[name="italia"] area');
  
    areas.forEach(function(area) {
      area.addEventListener('click', function(e) {
        e.preventDefault(); // Impedisci il comportamento di default
        
        // Leggi il valore della regione dall'attributo data-region
        const region = this.getAttribute('selected_region');
        // Costruisci l'URL per la richiesta AJAX (assicurati che il parametro ajax=1 sia presente)
        const url = 'homepage.php?ajax=1&region=' + encodeURIComponent(region);
  
        // Effettua la richiesta AJAX
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
  