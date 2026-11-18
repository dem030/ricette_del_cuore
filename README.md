# ricette_del_cuore





**Ricette del Cuore** è un progetto sviluppato per il corso di *Programmazione Web* del Corso di Laurea in Informatica (L-31) presso l'Università di Messina.

## Tecnologie Utilizzate
Il progetto sfrutta le seguenti tecnologie:
- **HTML**
- **CSS**
- **PHP**
- **MySQL**
- **Javascript**
---
All'interno della repository vi sarà tutto il necessario per inizializzare l'app:
prima di avviare l'applicazione, bisogna verificare di avere docker installato sul proprio dispositivo.
1. Copiare il file `.env.example` in `.env` e sostituire le password con valori a scelta (il file `.env` non viene mai caricato su git).
2. Dalla cartella del progetto eseguire `docker compose up --build`.
3. Aprire `localhost:8080/` per il sito e `localhost:8081/` per phpMyAdmin (accessibile solo dal computer locale, con le credenziali del file `.env`).

Al primo avvio il database viene popolato automaticamente con `ricette.sql`. Viene creato anche un utente MySQL dedicato all'app con i soli privilegi `SELECT`, `INSERT` e `UPDATE`.

> Se si aveva già un volume del database creato con la vecchia configurazione, eseguire `docker compose down -v` per ricrearlo (le ricette vengono ricaricate da `ricette.sql`).

---
## Sicurezza
Misure implementate, con riferimento alle categorie OWASP Top 10:

| Area | Misura | File |
|---|---|---|
| Password (A02, A07) | Hash **Argon2id** con salt casuale, `password_verify` a tempo costante, rehash automatico, policy minima (8 caratteri, lettere e numeri) | `api/signup.php`, `api/login.php` |
| SQL Injection (A03) | **Prepared statements** ovunque, whitelist per nomi di tabella e valori enum | `api/*.php`, `account/modifica_ricetta.php` |
| XSS (A03) | Output encoding con `htmlspecialchars`, `json_encode` sicuro nei messaggi JS, validazione degli URL delle foto (solo `http`/`https`), Content-Security-Policy | `account/account.php`, `api/auth.php`, `docker/apache-sicurezza.conf` |
| Controllo accessi (A01) | Pagine e API riservate protette da `richiedi_login()` | `api/auth.php` |
| CSRF (A01) | Token casuale di 256 bit in sessione, verificato con `hash_equals` su tutti i form POST (login, signup, logout incluso) | `api/auth.php` |
| Sessioni (A07) | Cookie `HttpOnly` + `SameSite=Strict` (+ `Secure` su HTTPS), `session_regenerate_id` al login, strict mode, scadenza dopo 30 min di inattività, logout che distrugge la sessione | `api/auth.php`, `api/logout.php` |
| Brute force (A07) | Blocco di 5 minuti dopo 5 tentativi di login falliti, messaggi d'errore generici (no user enumeration) | `api/login.php` |
| Configurazione (A05) | Credenziali fuori dal codice (`.env`), utente DB con privilegi minimi, porta MySQL non esposta, phpMyAdmin solo su `127.0.0.1`, errori solo nei log, header di sicurezza, niente directory listing, versione di PHP/Apache nascoste | `docker-compose.yaml`, `docker/` |

**Limiti noti:** le ricette non hanno un proprietario, quindi ogni utente autenticato può modificarle tutte; il limite ai tentativi di login è per sessione (in produzione andrebbe salvato lato server per IP/account); manca HTTPS (in produzione andrebbe messo un reverse proxy con TLS e attivato HSTS).

---
## Contributi
Se vuoi contribuire al progetto, sentiti libero di effettuare un fork e proporre modifiche!

**Licenza:** Questo progetto è rilasciato sotto licenza MIT.

**Autore:** Demetrio Priolo, studente del CdS in Informatica (L-31) - Università di Messina

---

**Grazie per aver visitato il progetto!** Se ti piace, lascia una stella su GitHub!

----------
# Recipes of the Heart

**Recipes of the Heart** is a project developed for the *Web Programming* course of the Bachelor's Degree in Computer Science (L-31) at the University of Messina.

## Technologies Used
The project utilizes the following technologies:
- **HTML**
- **CSS**
- **PHP**
- **MySQL**
- **Javascript**
---

Inside the repository, you will find everything needed to initialize the app.
Before starting the application, you must ensure that Docker is installed on your device.
Once you have confirmed that Docker is present, open the command prompt, navigate to the project folder, and type: "docker compose up --build".
After that, simply open a web browser and go to localhost:8080/ to view the entire website.
If you want to access phpMyAdmin, you will need to go to localhost:8081/.
---

## Contributions
If you want to contribute to the project, feel free to fork it and suggest modifications!

**License:** This project is released under the MIT license.

**Author:** Demetrio Priolo, student of the Bachelor's Degree in Computer Science (L-31) - University of Messina

---

**Thank you for visiting the project!** If you like it, leave a star on GitHub!
