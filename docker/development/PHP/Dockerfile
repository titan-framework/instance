FROM php:7-fpm-alpine

ARG PHP_ENV

ENV PHP_ENV $PHP_ENV

COPY ./docker/${PHP_ENV}/PHP/php.ini $PHP_INI_DIR/conf.d/99-${PHP_ENV}.ini

COPY ./docker/${PHP_ENV}/PHP/opcache.ini $PHP_INI_DIR/conf.d/30-opcache.ini

COPY ./docker/${PHP_ENV}/PHP/msmtprc /etc/msmtprc

WORKDIR /app

COPY . /app

# Production:
# mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN set -ex \
 && apk add --update --no-cache \
    antiword \
    autoconf \
    bash \
    bzip2-dev \
    curl-dev \
    freetype \
    freetype-dev \
    g++ \
    git \
    imagemagick \
    imagemagick-libs \
    imagemagick-dev \
    jpeg-dev \
    libbz2 \
    libjpeg \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng \
    libpng-dev \
    libtool \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    make \
    msmtp \
    oniguruma-dev \
    openjdk11-jre \
    openldap-dev \
    pcre-dev \
    poppler-utils \
    postgresql-dev \
    openssh-client \
    zlib-dev \
 && docker-php-ext-configure gd \
    --with-freetype=/usr/lib/ \
    --with-jpeg=/usr/lib/ \
    --with-webp=/usr/lib/ \
    --with-xpm=/usr/lib/ \
 && docker-php-ext-install \
    bz2 \
    curl \
    gd \
    ldap \
    mbstring \
    pdo \
    pdo_pgsql \
    opcache \
 && pecl install imagick mcrypt \
 && docker-php-ext-enable imagick mcrypt \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer create-project titan-framework/install /titan \
 && composer install --no-interaction -d /app \
 && docker-php-source delete \
 && apk del --no-cache \
    autoconf \
    g++ \
    libtool \
    make \
    pcre-dev \
 && rm -rf /var/cache/apk/*

# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlrpc xmlwriter xsl zend_test zip
