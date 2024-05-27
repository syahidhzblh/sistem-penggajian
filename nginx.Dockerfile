FROM nginx:latest

RUN apt-get update && apt install -y certbot python3-certbot-nginx

# WORKDIR /etc/nginx/conf.d

# COPY /config/nginx/laravel.conf .

# RUN mkdir /var/www/sistem_penggajian
