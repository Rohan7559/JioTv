FROM php:8.1-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    unzip \
    libxml2-dev \
    libcurl4-openssl-dev \
    && docker-php-ext-install curl xml

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy app to Apache directory
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
