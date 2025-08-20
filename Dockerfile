FROM php:8.2-apache

# Ativa o mod_rewrite
RUN a2enmod rewrite

# Permite uso de .htaccess na configuração global do Apache
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Instala PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Define o DocumentRoot como /var/www/html/public
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public


# Ajusta os arquivos de configuração do Apache
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf \
    /etc/apache2/conf-available/*.conf

# Cria uma configuração de diretório para permitir acesso
RUN echo '<Directory /var/www/html/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    </Directory>' > /etc/apache2/conf-available/public.conf \
    && a2enconf public

# Copia o código da aplicação
COPY ./src /var/www/html

