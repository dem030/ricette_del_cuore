FROM php:8.2-apache

# Estensione mysqli e modulo Apache per gli header di sicurezza
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && a2enmod headers

# Configurazione di sicurezza di PHP e Apache
COPY docker/php-sicurezza.ini /usr/local/etc/php/conf.d/sicurezza.ini
COPY docker/apache-sicurezza.conf /etc/apache2/conf-available/sicurezza.conf
RUN a2enconf sicurezza

# Copia il contenuto dell'app nella directory del server Apache
COPY ./app /var/www/html/
