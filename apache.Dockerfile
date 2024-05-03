FROM php:7.3-apache

RUN apt-get update && apt-get install -y zip libzip-dev libpng-dev
# RUN apk add --no-cache zip libzip-dev libpng libpng-dev jpeg-dev

RUN docker-php-ext-install mysqli pdo_mysql zip bcmath mbstring gd

RUN a2enmod rewrite

RUN mkdir -p /var/www/sistem-penggajian

COPY . /var/www/sistem-penggajian

ENV APACHE_DOCUMENT_ROOT=/var/www/sistem-penggajian/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/sistem-penggajian/

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install

RUN sed -i "s/DB_DATABASE=laravel/DB_DATABASE=sistem_penggajian/g" /var/www/sistem-penggajian/.env
RUN sed -i "s/DB_USERNAME=root/DB_USERNAME=penggajian_admin/g" /var/www/sistem-penggajian/.env
RUN sed -i "s/DB_PASSWORD=/DB_PASSWORD=Penggajian123!!!/g" /var/www/sistem-penggajian/.env

# RUN php artisan migrate \
#     && php artisan db:seed \
#     && php artisan key:generate

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN chown -R www-data:www-data /var/www/sistem-penggajian \
    && chmod -R 755 /var/www/sistem-penggajian
