FROM nginx:latest

RUN apt-get update && apt install certbot python3-cerbot-nginx

# WORKDIR /etc/nginx/conf.d

# COPY /config/nginx/laravel.conf .

# RUN mkdir /var/www/sistem_penggajian
