<?php
// Legacy redirect — all editing is now via pages.php
require_once __DIR__ . '/../config.php';
require_admin();
$page = $_GET['page'] ?? '';
header('Location: pages.php?page=' . urlencode($page));
exit;
