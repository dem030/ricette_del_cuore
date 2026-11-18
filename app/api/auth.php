<?php
/**
 * auth.php - Funzioni di sicurezza condivise
 *
 * - Sessione con cookie sicuri (HttpOnly, SameSite, Secure se HTTPS)
 * - Scadenza della sessione per inattività
 * - Controllo di autenticazione per le pagine riservate (Broken Access Control)
 * - Token anti-CSRF per tutti i form che modificano dati
 */

// Minuti di inattività dopo i quali la sessione scade
const TIMEOUT_SESSIONE = 30 * 60;

/**
 * Avvia la sessione con parametri dei cookie sicuri.
 */
function avvia_sessione(): void
{
    if (session_status() === PHP_SESSION_ACTIVE) {
        return;
    }

    $https = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off';

    // Accetta solo ID di sessione generati dal server (contro session fixation)
    ini_set('session.use_strict_mode', '1');
    // L'ID di sessione viaggia solo nel cookie, mai nell'URL
    ini_set('session.use_only_cookies', '1');

    session_set_cookie_params([
        'lifetime' => 0,          // cookie di sessione: sparisce alla chiusura del browser
        'path'     => '/',
        'secure'   => $https,     // inviato solo su HTTPS quando disponibile
        'httponly' => true,       // non leggibile da JavaScript (mitiga il furto via XSS)
        'samesite' => 'Strict',   // non inviato su richieste cross-site (mitiga CSRF)
    ]);

    session_start();

    // Scadenza per inattività
    if (isset($_SESSION['ultima_attivita']) && time() - $_SESSION['ultima_attivita'] > TIMEOUT_SESSIONE) {
        termina_sessione();
        session_start();
    }
    $_SESSION['ultima_attivita'] = time();
}

/**
 * Distrugge completamente la sessione (dati lato server e cookie lato client).
 */
function termina_sessione(): void
{
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $p = session_get_cookie_params();
        setcookie(session_name(), '', [
            'expires'  => time() - 42000,
            'path'     => $p['path'],
            'domain'   => $p['domain'],
            'secure'   => $p['secure'],
            'httponly' => $p['httponly'],
            'samesite' => $p['samesite'],
        ]);
    }
    session_destroy();
}

function utente_loggato(): bool
{
    return isset($_SESSION['email']);
}

/**
 * Da chiamare in cima a ogni pagina o API riservata:
 * se l'utente non ha fatto login viene rimandato alla pagina di login.
 */
function richiedi_login(): void
{
    avvia_sessione();
    if (!utente_loggato()) {
        header('Location: ../login/login_page.php');
        exit;
    }
}

/**
 * Restituisce il token CSRF della sessione, generandolo se manca.
 * 32 byte da un generatore crittograficamente sicuro.
 */
function csrf_token(): string
{
    avvia_sessione();
    if (empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

/**
 * Campo nascosto da inserire in ogni <form method="post">.
 */
function campo_csrf(): string
{
    return '<input type="hidden" name="csrf_token" value="' . htmlspecialchars(csrf_token()) . '">';
}

/**
 * Verifica il token CSRF inviato con il form.
 * hash_equals esegue un confronto a tempo costante (contro i timing attack).
 */
function verifica_csrf(): void
{
    avvia_sessione();
    $inviato = $_POST['csrf_token'] ?? '';
    if (!is_string($inviato) || empty($_SESSION['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $inviato)) {
        http_response_code(403);
        die('Richiesta non valida (token CSRF mancante o errato). Ricarica la pagina e riprova.');
    }
}

/**
 * Accetta solo URL http/https: blocca schemi pericolosi come javascript: o data:
 */
function url_sicuro(string $url): bool
{
    if (!filter_var($url, FILTER_VALIDATE_URL)) {
        return false;
    }
    $schema = strtolower((string) parse_url($url, PHP_URL_SCHEME));
    return in_array($schema, ['http', 'https'], true);
}
