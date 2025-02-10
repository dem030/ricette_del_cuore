FROM php:8.2-apache

# Installa l'estensione mysqli
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Copia il contenuto dell'app nella directory del server Apache
COPY ./app /var/www/html/
