// Funzione debounce per migliorare le prestazioni
function debounce(func, delay) {
    let timer;
    return function (...args) {
        clearTimeout(timer);
        timer = setTimeout(() => func.apply(this, args), delay);
    };
}

// Funzione per aggiungere la classe "active" quando l'elemento è visibile
function revealOnScroll() {
    const reveals = document.querySelectorAll('.reveal');

    reveals.forEach((reveal) => {
        const windowHeight = window.innerHeight;
        const revealTop = reveal.getBoundingClientRect().top;
        const revealPoint = 150;

        if (revealTop < windowHeight - revealPoint) {
            reveal.classList.add('active');
        } else {
            reveal.classList.remove('active');
        }
    });
}

// Aggiungi evento scroll con debounce
window.addEventListener('scroll', debounce(revealOnScroll, 50));

// Script per gestire il toggle della sidebar e la chiusura cliccando all'esterno
document.addEventListener('DOMContentLoaded', () => {
    const menuButton = document.querySelector('.open-btn');
    const closeButton = document.querySelector('.close-btn');
    const sidebar = document.getElementById('sidebar');

    // Funzione per aprire/chiudere la sidebar
    function toggleSidebar() {
        const isOpen = sidebar.classList.contains('active');
        sidebar.classList.toggle('active');
        sidebar.setAttribute('aria-hidden', isOpen ? 'true' : 'false');
    }

    // Evento per il pulsante di apertura
    menuButton.addEventListener('click', () => {
        toggleSidebar();
    });

    // Evento per il pulsante di chiusura
    closeButton.addEventListener('click', () => {
        toggleSidebar();
    });

    // Chiudi la sidebar cliccando al di fuori
    document.addEventListener('click', (e) => {
        if (
            sidebar.classList.contains('active') &&
            !sidebar.contains(e.target) &&
            e.target !== menuButton
        ) {
            sidebar.classList.remove('active');
            sidebar.setAttribute('aria-hidden', 'true');
        }
    });

    // Accessibilità: chiusura con il tasto ESC
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && sidebar.classList.contains('active')) {
            sidebar.classList.remove('active');
            sidebar.setAttribute('aria-hidden', 'true');
        }
    });
});