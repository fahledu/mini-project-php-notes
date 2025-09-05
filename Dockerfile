FROM php:8.2-apache

# Ativa mod_rewrite e outras configs do Apache
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN docker-php-ext-install pdo pdo_mysql

# Instala Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia código
COPY ./src /var/www/html

# Define document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Ajustes Apache
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf \
    /etc/apache2/conf-available/*.conf

# Configura diretório público
RUN echo '<Directory /var/www/html/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    </Directory>' > /etc/apache2/conf-available/public.conf \
    && a2enconf public

# Workdir e instalação de dependências
WORKDIR /var/www/html
RUN composer install
