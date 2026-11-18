#!/bin/bash
# Crea l'utente MySQL usato dall'applicazione, con il MINIMO dei privilegi:
# può solo leggere, inserire e modificare righe nel database dell'app.
# Niente DROP, DELETE, ALTER, GRANT né accesso ad altri database.
# (Principio del minimo privilegio: se l'app venisse compromessa, i danni sono limitati.)
# Eseguito solo alla prima inizializzazione del volume del database.
set -e

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<SQL
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT SELECT, INSERT, UPDATE ON \`${MYSQL_DATABASE}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
SQL
