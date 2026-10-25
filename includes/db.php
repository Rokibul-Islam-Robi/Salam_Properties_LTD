<?php

if (!defined('DB_HOST'))   define('DB_HOST',   'localhost');
if (!defined('DB_NAME'))   define('DB_NAME',   'salam_properties');
if (!defined('DB_USER'))   define('DB_USER',   'root');
if (!defined('DB_PASS'))   define('DB_PASS',   '');
if (!defined('DB_CHARSET'))define('DB_CHARSET','utf8mb4');

function db_pdo()
{
    static $pdo = null;
    static $failed = false;

    if ($pdo instanceof PDO) return $pdo;
    if ($failed) return null;

    try {
        $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET;
        $pdo = new PDO($dsn, DB_USER, DB_PASS, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);
        return $pdo;
    } catch (Throwable $e) {
        $failed = true;
        return null;
    }
}

function db_available()
{
    return db_pdo() instanceof PDO;
}
