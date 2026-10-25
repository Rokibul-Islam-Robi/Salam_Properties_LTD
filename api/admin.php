<?php
// Vercel Serverless Function entrypoint for Admin
$requestUri = $_SERVER['REQUEST_URI'] ?? '/admin/';
$path = parse_url($requestUri, PHP_URL_PATH);

// Remove leading '/admin'
$subPath = preg_replace('#^/admin/?#', '', $path);
$subPath = trim($subPath, '/');

if ($subPath === '' || $subPath === 'index.php') {
    require __DIR__ . '/../admin/index.php';
    exit;
}

$target = __DIR__ . '/../admin/' . $subPath;

if (file_exists($target) && !is_dir($target)) {
    require $target;
    exit;
}

if (file_exists($target . '.php')) {
    require $target . '.php';
    exit;
}

require __DIR__ . '/../admin/index.php';
