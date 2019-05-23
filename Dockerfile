FROM php:7.3.0-fpm-alpine3.8

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install PHP ext
ENV NC_DEP_MODS gd zip intl mysqli pdo_mysql
ENV NC_DEPS libzip-dev zlib-dev icu-dev freetype-dev jpeg-dev libpng-dev

RUN apk add --no-cache $NC_DEPS
RUN docker-php-ext-install $NC_DEP_MODS && docker-php-ext-enable $NC_DEP_MODS

# Override with custom settings
# COPY xxxx $PHP_INI_DIR/conf.d/
