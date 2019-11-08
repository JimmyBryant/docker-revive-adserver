FROM nginx:alpine
MAINTAINER bitterg <bitterg@163.com>

WORKDIR /data/www/

RUN apk --update upgrade && apk update && apk add curl ca-certificates && update-ca-certificates --fresh && apk add openssl

RUN apk --update add \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        gzip \
        php7 \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-xml \
        php7-iconv \
        php7-phar \
        php7-openssl \
        php7-zlib \
        php7-zip \
        php7-memcached \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/local/bin/

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN addgroup -S  www &&  adduser -D -h /data/www -S www -G www \
    && mkdir -p /run/nginx

RUN wget -qO- https://github.com/JimmyBryant/revive-adserver-installed/archive/v5.0.0.tar.gz | tar xz --strip 1 \
    && chown -R www:www . \
    && chmod -R a+w /data/www/var \
    && chmod -R a+w /data/www/plugins \
    && chmod -R a+w /data/www/www/admin/plugins \
    && chmod -R a+w /data/www/www/images \
    && rm -rf /var/cache/apk/* \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["docker-entrypoint.sh"]
