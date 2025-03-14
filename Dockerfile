FROM php:7.4-cli

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    libzip-dev \
    && docker-php-ext-install zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --optimize-autoloader

CMD ["php", "-S", "0.0.0.0:10000"]