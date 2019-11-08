#!/bin/sh
conf_file="/data/www/var/localhost.conf.php"
set_config() {
    key="$1"
    value="$2"

    sed -ri -e "s/$key/$value/g" $conf_file
}

if [ -e $conf_file ];then
		: "${REVIVE_DB_HOST:=revive}"
		: "${REVIVE_DB_USER:=root}"
		: "${REVIVE_DB_PASSWORD:=}"
		: "${REVIVE_DB_NAME:=revive}"
		: "${REVIVE_DB_CHARSET:=utf8}"
		: "${REVIVE_DB_COLLATE:=utf8_unicode_ci}"
        : "${REVIVE_WEB_DOMAIN:=localhost}"
    set_config "REVIVE_DB_HOST" "$REVIVE_DB_HOST"
    set_config "REVIVE_DB_USER" "$REVIVE_DB_USER"
    set_config "REVIVE_DB_PASSWORD" "$REVIVE_DB_PASSWORD"
    set_config "REVIVE_DB_NAME" "$REVIVE_DB_NAME"
    set_config "REVIVE_WEB_DOMAIN" "$REVIVE_WEB_DOMAIN"
fi
php-fpm7 && nginx -g 'daemon off;'
