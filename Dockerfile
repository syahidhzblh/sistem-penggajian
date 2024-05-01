FROM php:7.3-fpm-alpine

RUN docker-php-ext-install mysqli pdo_mysql zip bcmath mbstring \
    && docker-php-ext-enable pdo_mysql mysqli zip bcmath mbstring

COPY . /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/sistem-penggajian

RUN composer install

RUN sed -i 's/DB_DATABASE=laravel/DB_DATABASE=sistem_penggajian/g /var/www/sistem_penggajian/.env'
RUN sed -i 's/DB_USERNAME=root/DB_USERNAME=penggajian_admin/g /var/www/sistem_penggajian/.env'
RUN sed -i 's/DB_PASSWORD=/DB_PASSWORD=Penggajian123!!!/g /var/www/sistem_penggajian/.env'

RUN php artisan migrate \
    && php artisan db:seed \
    && php artisan key:generate

RUN chown -R www-data:www:data /var/www/sistem-penggajian \
    && chmod -R 755 /var/www/sistem-penggajian
