FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    unzip \
    libonig-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip bcmath mbstring

RUN mkdir -p /var/www/sistem-penggajian

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/sistem-penggajian/

COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install

RUN cp .env.example .env
RUN sed -i "s/DB_HOST=127.0.0.1/DB_HOST=db/g" /var/www/sistem-penggajian/.env
RUN sed -i "s/DB_DATABASE=laravel/DB_DATABASE=sistem_penggajian/g" /var/www/sistem-penggajian/.env
RUN sed -i "s/DB_USERNAME=root/DB_USERNAME=penggajian_admin/g" /var/www/sistem-penggajian/.env
RUN sed -i "s/DB_PASSWORD=/DB_PASSWORD=Penggajian123!!!/g" /var/www/sistem-penggajian/.env


RUN chown -R www-data:www-data /var/www/sistem-penggajian \
    && chmod -R 755 /var/www/sistem-penggajian


# COPY wait-for-mysql.sh /usr/local/bin/

# RUN chmod +x /usr/local/bin/wait-for-mysql.sh

EXPOSE 9000

CMD ["php-fpm"]
