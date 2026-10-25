<?php
// Fallback redirect for built-in PHP development server or direct browser visits
$requestUri = $_SERVER['REQUEST_URI'] ?? '';
$path = parse_url($requestUri, PHP_URL_PATH);

if (preg_match('#^/(about|services|project|news|contact)\.html$#i', $path, $m)) {
    header("Location: /" . strtolower($m[1]) . ".php", true, 301);
    exit;
}
if (preg_match('#^/index\.html$#i', $path)) {
    header("Location: /index.php", true, 301);
    exit;
}

// Serve static files directly if they exist
$file = __DIR__ . $path;
if ($path !== '/' && file_exists($file) && !is_dir($file)) {
    return false; // let built-in server handle static asset
}

// Check for dynamic custom page: e.g. /my-new-page.php or /my-new-page
if (preg_match('#^/([a-zA-Z0-9_-]+)(\.php)?$#', $path, $pm)) {
    $slugCandidate = strtolower($pm[1]);
    $dynamicPhpFile = __DIR__ . '/' . $slugCandidate . '.php';
    if (file_exists($dynamicPhpFile)) {
        require $dynamicPhpFile;
        exit;
    }
}

// Otherwise route through index.php
require __DIR__ . '/index.php';
