<?php
/**
 * project-details.php — Dynamic Project Details page.
 * URL: project-details.php?slug=greenview-apartments  (?id= kept as an alias
 *      so older links keep working)
 *
 * Lookup order (prepared statements only, never string interpolation):
 *   1. database  -> investment_projects.slug = :slug  (live statuses)
 *   2. CMS       -> data/content.json "project_details"
 *   3. neither   -> in-page "Project not found" notice with HTTP 404
 */
require_once __DIR__ . '/config.php';
require_once BASE_PATH . '/includes/detail_repo.php';
require_once BASE_PATH . '/includes/detail_view.php';

$rawSlug = (string)($_GET['slug'] ?? $_GET['id'] ?? '');
$hasSlug = trim($rawSlug) !== '';
$pdSlug  = detail_slug($rawSlug);
$slugBad = $hasSlug && $pdSlug === '';

$jsonList = detail_json_list('project_details');
$dbList   = projects_all();

$projectDb  = null;
$projectCms = null;

if ($hasSlug && !$slugBad) {
    $projectDb  = project_by_slug($pdSlug);          // PDO, prepared
    $projectCms = detail_find_json($jsonList, $pdSlug);
} elseif (!$hasSlug) {
    // No slug at all: keep the historic default (first CMS record),
    // otherwise fall back to the first live database row.
    if ($jsonList) $projectCms = $jsonList[0];
    elseif ($dbList) $projectDb = $dbList[0];
}

if ($projectDb) {
    $view = proj_view_from_db($projectDb);
} elseif ($projectCms) {
    $view = proj_view_from_json($projectCms);
} else {
    $view = detail_not_found_view('project', $hasSlug ? ($pdSlug !== '' ? $pdSlug : trim($rawSlug)) : '', 'project.php');
}

$currentSlug = $projectDb ? (string)$projectDb['slug']
             : ($projectCms ? (string)($projectCms['slug'] ?? '') : $pdSlug);

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
foreach ($sidebarList as $p) {
    $pSlug = (string)($p['slug'] ?? '');
    if ($pSlug === '') continue;
    $isActive = ($pSlug === $currentSlug);
    $sidebarItems .= '<a class="sd-service-item' . ($isActive ? ' active' : '') . '" href="project-details.php?slug=' . e($pSlug) . '">'
        . '<span>' . e($p['title'] ?? '') . '</span>'
        . '<i class="bi bi-arrow-up-right"></i>'
        . '</a>';
}

// --- Render template --------------------------------------------------------
$file = BASE_PATH . '/templates/project-details.html';
if (!file_exists($file)) { http_response_code(404); exit('Page not found'); }
$html = file_get_contents($file);

$html = detail_apply_view($html, $view);
$html = str_replace(
    ['{{MORE_PROJECTS}}', '{{PHONE_DISPLAY}}', '{{PHONE_HREF}}'],
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
