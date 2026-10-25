<?php
// Vercel Serverless Function entrypoint for Frontend
$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
$path = parse_url($requestUri, PHP_URL_PATH);

// Clean path
$path = trim($path, '/');

if ($path === '' || $path === 'index.php') {
    require __DIR__ . '/../index.php';
    exit;
}

$file = __DIR__ . '/../' . $path;

// Check if direct .php exists
if (file_exists($file) && !is_dir($file) && pathinfo($file, PATHINFO_EXTENSION) === 'php') {
    require $file;
    exit;
}

// Check with .php appended
if (file_exists($file . '.php')) {
    require $file . '.php';
    exit;
}

// Fallback to index.php
require __DIR__ . '/../index.php';
