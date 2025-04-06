#!/usr/bin/env bash

WP_PASSWORD=$(cat "${WP_PASSWORD_FILE}")
WP_ROOT_PASSWORD=$(cat "${WP_ROOT_PASSWORD_FILE}")

if ! wp core is-installed --path=/wordpress --allow-root ; then
	wp core install \
	--url="https://${DOMAIN_NAME}" \
	--title="${TITLE}" \
	--admin_user="${WP_ROOT_USER}" \
	--admin_password="${WP_ROOT_PASSWORD}" \
	--admin_email="${WP_ROOT_USER_EMAIL}" \
	--path=/wordpress \
	--allow-root

	wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
	--user_pass="${WP_PASSWORD}" \
	--role=editor \
	--path=/wordpress \
	--allow-root
fi

chown -R www-data:www-data /wordpress

exec php-fpm7.4 -F
