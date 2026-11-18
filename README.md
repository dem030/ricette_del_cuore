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
1. Copiare il file `.env.example` in `.env` e sostituire le password con valori a scelta.
2. Dalla cartella del progetto eseguire `docker compose up --build`.
3. Aprire `localhost:8080/` per il sito e `localhost:8081/` per phpMyAdmin (accessibile solo dal computer locale, con le credenziali del file `.env`).

Al primo avvio il database viene popolato automaticamente con `ricette.sql`. Viene creato anche un utente MySQL dedicato all'app con i soli privilegi `SELECT`, `INSERT` e `UPDATE`.





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
