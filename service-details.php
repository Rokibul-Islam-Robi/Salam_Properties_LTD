<?php
/**
 * service-details.php — Dynamic Service Details page.
 * URL: service-details.php?slug=real-estate-development
 *
 * Lookup order (prepared statements only, never string interpolation):
 *   1. database  -> services.slug = :slug  (active rows)
 *   2. CMS       -> data/content.json "service_details"
 *   3. neither   -> in-page "Service not found" notice with HTTP 404
 */
require_once __DIR__ . '/config.php';
require_once BASE_PATH . '/includes/detail_repo.php';
require_once BASE_PATH . '/includes/detail_view.php';

$rawSlug = isset($_GET['slug']) ? (string)$_GET['slug'] : '';
$hasSlug = trim($rawSlug) !== '';
$sdSlug  = detail_slug($rawSlug);
// A slug was supplied but nothing usable survived sanitising (e.g. "<script>").
$slugBad = $hasSlug && $sdSlug === '';

$jsonList = detail_json_list('service_details');
$dbList   = services_all();

$serviceDb  = null;
$serviceCms = null;

if ($hasSlug && !$slugBad) {
    $serviceDb  = service_by_slug($sdSlug);          // PDO, prepared
    $serviceCms = detail_find_json($jsonList, $sdSlug);
} elseif (!$hasSlug) {
    // No slug at all: keep the historic default (first CMS record),
    // otherwise fall back to the first active database row.
    if ($jsonList) $serviceCms = $jsonList[0];
    elseif ($dbList) $serviceDb = $dbList[0];
}

if ($serviceDb) {
    $view = svc_view_from_db($serviceDb);
} elseif ($serviceCms) {
    $view = svc_view_from_json($serviceCms);
} else {
    $view = detail_not_found_view('service', $hasSlug ? ($sdSlug !== '' ? $sdSlug : trim($rawSlug)) : '', 'services.php');
}

$currentSlug = $serviceDb ? (string)$serviceDb['slug']
             : ($serviceCms ? (string)($serviceCms['slug'] ?? '') : $sdSlug);

// --- Shared header/footer (same injection pattern as includes/render.php) ---
ob_start(); include BASE_PATH . '/includes/header.php'; $sharedHeader = ob_get_clean();
ob_start(); include BASE_PATH . '/includes/footer.php'; $sharedFooter = ob_get_clean();

$settings = cms_data()['settings'] ?? [];
$sitePhoneDisplay = e($settings['company_phone'] ?? '01796000000');
$sitePhoneHref    = e(preg_replace('/[^0-9+]/', '', $settings['company_phone'] ?? '01796000000'));

// --- Sidebar follows the source of the record being displayed ---------------
$sidebarList = [];
if (($view['source'] ?? '') === 'db')       $sidebarList = $dbList;
elseif (($view['source'] ?? '') === 'cms')  $sidebarList = $jsonList;
else                                        $sidebarList = $jsonList ?: $dbList;

$sidebarItems = '';
foreach ($sidebarList as $s) {
    $sSlug  = (string)($s['slug'] ?? '');
    if ($sSlug === '') continue;
    $isActive = ($sSlug === $currentSlug);
    $sidebarItems .= '<a class="sd-service-item' . ($isActive ? ' active' : '') . '" href="service-details.php?slug=' . e($sSlug) . '">'
        . '<span>' . e($s['title'] ?? '') . '</span>'
        . '<i class="bi bi-arrow-up-right"></i>'
        . '</a>';
}

// --- Render template --------------------------------------------------------
$file = BASE_PATH . '/templates/service-details.html';
if (!file_exists($file)) { http_response_code(404); exit('Page not found'); }
$html = file_get_contents($file);

$html = detail_apply_view($html, $view);
$html = str_replace(
    ['{{MORE_SERVICES}}', '{{PHONE_DISPLAY}}', '{{PHONE_HREF}}'],
    [$sidebarItems, $sitePhoneDisplay, $sitePhoneHref],
    $html
);
$html = str_replace(['<!--HEADER-->', '<!--FOOTER-->'], [$sharedHeader, $sharedFooter], $html);

if (!empty($view['not_found'])) http_response_code(404);

// Settings-driven tel:/mailto:/address links (mirrors render.php behaviour)
$html = preg_replace('/href="tel:[^"]*"/i', 'href="tel:' . $sitePhoneHref . '"', $html);
$html = preg_replace('/href="mailto:[^"]*"/i', 'href="mailto:' . e($settings['company_email'] ?? 'info@salamproperties.com') . '"', $html);
$html = preg_replace('/(<p\b[^>]*class="[^"]*company-address[^"]*"[^>]*>)(.*?)(<\/p>)/is', '$1' . e($settings['company_address'] ?? 'Holding No - 0785, Haji Mohsin Road, Chandpur Sadar, Chandpur') . '$3', $html);

echo $html;
