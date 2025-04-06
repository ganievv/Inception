<?php

$db_name = getenv('DB_NAME');
$db_host = getenv('DB_HOST');
$db_user = getenv('DB_USER');
$db_password_file = getenv('DB_PASSWORD_FILE');

if (!$db_name || !$db_user || !$db_password_file || !$db_host) {
	die("error: missing env var: DB_NAME, DB_HOST, DB_USER or DB_PASSWORD_FILE");
}

if (!file_exists($db_password_file) || !is_readable($db_password_file)) {
    die("error: file '$db_password_file' doesn't exists or not readable");
}

$db_password = trim(file_get_contents($db_password_file));

if (!$db_password) {
	die("error: password file '$db_password_file' is empty");
}

define( 'DB_NAME', $db_name );

/** Database username */
define( 'DB_USER', $db_user );

/** Database password */
define( 'DB_PASSWORD', $db_password );

/** Database hostname */
define( 'DB_HOST', $db_host );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

define( 'FS_METHOD', 'direct' );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
