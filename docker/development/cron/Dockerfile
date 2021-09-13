FROM php:7-fpm-alpine

ARG PHP_ENV

ENV PHP_ENV $PHP_ENV

RUN mkdir -p /etc/periodic/minutely

RUN echo "*	*	*	*	*	run-parts /etc/periodic/minutely" >> /var/spool/cron/crontabs/root

COPY ./docker/${PHP_ENV}/cron/minutely/* /etc/periodic/minutely/
COPY ./docker/${PHP_ENV}/cron/15min/* /etc/periodic/15min/
COPY ./docker/${PHP_ENV}/cron/hourly/* /etc/periodic/hourly/
COPY ./docker/${PHP_ENV}/cron/daily/* /etc/periodic/daily/

WORKDIR /app

# Production:
# mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN set -ex \
 && apk add --update --no-cache \
    bash \
    tini \
    wget \
 && rm -rf /var/cache/apk/* \
 && chmod a+x /etc/periodic/minutely/* \
 && chmod a+x /etc/periodic/15min/* \
 && chmod a+x /etc/periodic/hourly/* \
 && chmod a+x /etc/periodic/daily/*

# Possible values for ext-name:
# bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer xml xmlreader xmlrpc xmlwriter xsl zend_test zip

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/crond", "-f"]
