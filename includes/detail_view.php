<?php
/**
 * detail_view.php — turns a database row or a CMS (content.json) record into
 * the placeholder set used by templates/service-details.html and
 * templates/project-details.html.
 *
 * Both sources produce the SAME shape, so the detail pages have a single
 * render path. Empty sections are reported as empty html so the page can drop
 * the whole <section> instead of printing a heading with nothing under it.
 *
 * Requires config.php (function e()) to be loaded first.
 */

/* ------------------------------------------------------------------ helpers */

/** Active CMS records for a detail collection, sorted like the page expects. */
function detail_json_list($key)
{
    $rows = cms_data()[$key] ?? [];
    if (!is_array($rows)) return [];

    $rows = array_values(array_filter($rows, function ($r) {
        return is_array($r) && !empty($r['is_active']);
    }));
    usort($rows, function ($a, $b) {
        return ($a['sort_order'] ?? 0) <=> ($b['sort_order'] ?? 0);
    });
    return $rows;
}

function detail_find_json(array $rows, $slug)
{
    foreach ($rows as $r) {
        if ((string)($r['slug'] ?? '') === (string)$slug) return $r;
    }
    return null;
}

/** Decode a DB JSON column (or accept an already-decoded array) into a list. */
function detail_json_array($value)
{
    if (is_array($value)) return $value;
    if (!is_string($value) || trim($value) === '') return [];

    $decoded = json_decode($value, true);
    return is_array($decoded) ? $decoded : [];
}

/** Two paragraph slots; falls back to a neutral line rather than an empty block. */
function detail_paragraphs($first, $second)
{
    $p1 = trim((string)$first);
    $p2 = trim((string)$second);

    if ($p1 === '' && $p2 !== '') { $p1 = $p2; $p2 = ''; }
    if ($p1 === '') { $p1 = 'More information about this entry is coming soon.'; $p2 = ''; }

    return [$p1, $p2];
}

function detail_status_label($status)
{
    switch (strtolower(trim((string)$status))) {
        case 'planning':     return 'PLANNING';
        case 'construction': return 'UNDER CONSTRUCTION';
        case 'completed':    return 'COMPLETED';
        case 'published':    return 'PUBLISHED';
        default:             return '';
    }
}

/* ------------------------------------------------------- block html builders */

function detail_offering_items(array $items)
{
    $html = '';
    foreach ($items as $item) {
        $title = trim((string)($item['title'] ?? ''));
        if ($title === '') continue;
        $desc  = trim((string)($item['desc'] ?? ''));
        $html .= '<li class="sd-offering-item">'
            . '<span class="sd-check"><i class="bi bi-check2"></i></span>'
            . '<div><h5>' . e($title) . '</h5>'
            . ($desc !== '' ? '<p>' . e($desc) . '</p>' : '')
            . '</div></li>';
    }
    return $html;
}

function detail_why_cards(array $items)
{
    $html = '';
    foreach ($items as $item) {
        $title = trim((string)($item['title'] ?? ''));
        if ($title === '') continue;
        $icon  = preg_replace('/[^a-z0-9\- ]/i', '', (string)($item['icon'] ?? 'bi bi-star'));
        if ($icon === '') $icon = 'bi bi-star';
        $desc  = trim((string)($item['desc'] ?? ''));
        $html .= '<article class="sd-why-card">'
            . '<span class="sd-why-icon"><i class="' . e($icon) . '"></i></span>'
            . '<h4>' . e($title) . '</h4>'
            . ($desc !== '' ? '<p>' . e($desc) . '</p>' : '')
            . '</article>';
    }
    return $html;
}

function detail_faq_items(array $items, $prefix = 'sd')
{
    $html = '';
    $i = 0;
    foreach ($items as $faq) {
        $q = trim((string)($faq['question'] ?? ''));
        if ($q === '') continue;
        $a    = trim((string)($faq['answer'] ?? ''));
        $id   = $prefix . '-faq-' . $i;
        $html .= '<div class="sd-faq-item">'
            . '<button aria-controls="' . $id . '" aria-expanded="false" class="sd-faq-q" type="button">'
            . '<span>' . e($q) . '</span>'
            . '<span class="sd-faq-icon"><i class="bi bi-chevron-down"></i></span></button>'
            . '<div class="sd-faq-a" id="' . $id . '" role="region">'
            . ($a !== '' ? '<div class="sd-faq-a-wrap"><p>' . e($a) . '</p></div>' : '')
            . '</div></div>';
        $i++;
    }
    return $html;
}

function detail_card_image($path, $fallback = 'assets/images/project_2.jpg')
{
    $path = trim((string)$path);
    if ($path === '') return $fallback;
    if (preg_match('#^(https?:)?//#i', $path) || strpos($path, 'assets/') === 0 || strpos($path, 'uploads/') === 0) {
        return $path;
    }
    return $fallback;
}

/* ------------------------------------------------------------- service views */

function svc_view_from_db(array $r)
{
    $title  = trim((string)($r['title'] ?? ''));
    $image  = detail_card_image($r['image'] ?? '', 'assets/images/project_2.jpg');
    $paras  = detail_paragraphs($r['excerpt'] ?? '', $r['description'] ?? '');

    $offerings = [];
    foreach (detail_json_array($r['features'] ?? null) as $feat) {
        if (is_array($feat)) {
            $t = (string)($feat['title'] ?? '');
            $d = (string)($feat['desc'] ?? '');
        } else {
            $t = (string)$feat;
            $d = '';
        }
        if (trim($t) !== '') $offerings[] = ['title' => $t, 'desc' => $d];
    }

    return [
        'source'            => 'db',
        'title'             => $title,
        'hero_style'        => 'style="background-image:url(\'' . $image . '\')"',
        'featured_image'    => $image,
        'featured_alt'      => $title,
        'about_heading'     => $title !== '' ? 'About ' . $title : 'About the Service',
        'about_p1'          => $paras[0],
        'about_p2'          => $paras[1],
        'why_heading'       => 'Why Choose Us',
        'why_desc'          => '',
        'why_html'          => '',
        'offerings_heading' => 'Services Offered',
        'offerings_html'    => detail_offering_items($offerings),
        'faq_heading'       => 'Popular Questions',
        'faq_html'          => '',
        'status_badge'      => '',
        'location_chip'     => '',
    ];
}

function svc_view_from_json(array $s)
{
    $title  = trim((string)($s['title'] ?? ''));
    $image  = detail_card_image($s['hero_image'] ?? ($s['featured_image'] ?? ''), 'assets/images/h1_bg-1.jpg');
    $paras  = detail_paragraphs($s['about_paragraphs'][0] ?? '', $s['about_paragraphs'][1] ?? '');

    $offerings = [];
    foreach (($s['offerings'] ?? []) as $off) {
        $offerings[] = ['title' => $off['title'] ?? '', 'desc' => $off['desc'] ?? ''];
    }

    $why = [];
    foreach (($s['why']['items'] ?? []) as $item) {
        $why[] = ['icon' => $item['icon'] ?? 'bi bi-star', 'title' => $item['title'] ?? '', 'desc' => $item['desc'] ?? ''];
    }

    return [
        'source'            => 'cms',
        'title'             => $title,
        'hero_style'        => 'style="background-image:url(\'' . $image . '\')"',
        'featured_image'    => detail_card_image($s['featured_image'] ?? '', 'assets/images/project_2.jpg'),
        'featured_alt'      => trim((string)($s['featured_alt'] ?? ($title ?: 'Service'))),
        'about_heading'     => $s['about_heading'] ?? 'About the Service',
        'about_p1'          => $paras[0],
        'about_p2'          => $paras[1],
        'why_heading'       => $s['why']['heading'] ?? 'Why Choose Us',
        'why_desc'          => $s['why']['description'] ?? '',
        'why_html'          => detail_why_cards($why),
        'offerings_heading' => $s['offerings_heading'] ?? 'Services Offered',
        'offerings_html'    => detail_offering_items($offerings),
        'faq_heading'       => $s['faq_heading'] ?? 'Popular Questions',
        'faq_html'          => detail_faq_items($s['faqs'] ?? [], 'sd'),
        'status_badge'      => '',
        'location_chip'     => '',
    ];
}

/* ------------------------------------------------------------ project views */

function proj_view_from_db(array $r)
{
    $title    = trim((string)($r['title'] ?? ''));
    $image    = detail_card_image($r['cover_image'] ?? '', 'assets/images/h1_bg-1.jpg');
    $location = trim((string)($r['location'] ?? ''));
    $city     = trim((string)($r['city'] ?? ''));
    $country  = trim((string)($r['country'] ?? ''));
    $place    = $location !== '' ? $location : ($city !== '' ? ($city . ($country !== '' ? ', ' . $country : '')) : $country);

    $paras = detail_paragraphs($r['summary'] ?? '', $r['description'] ?? '');

    $badge = detail_status_label($r['status'] ?? '');
    $chip  = $place !== '' ? '<i class="bi bi-geo-alt-fill"></i> ' . e($place) : '';

    $money = function ($v) {
        return number_format((float)$v, 0, '.', ',');
    };

    $highlights = [];
    if (isset($r['price_from']) && $r['price_from'] !== null && $r['price_from'] !== '') {
        $currency = trim((string)($r['currency'] ?? ''));
        $highlights[] = [
            'icon'  => 'bi-currency-dollar',
            'title' => 'Starting Price',
            'desc'  => $money($r['price_from']) . ($currency !== '' ? ' ' . e($currency) : ''),
        ];
    }
    if (isset($r['units_available']) && $r['units_available'] !== null && $r['units_available'] !== '') {
        $total = (int)($r['total_units'] ?? 0);
        $highlights[] = [
            'icon'  => 'bi-building',
            'title' => 'Units Available',
            'desc'  => (string)(int)$r['units_available'] . ($total > 0 ? ' of ' . $total : ''),
        ];
    }
    if (isset($r['progress_pct']) && (int)$r['progress_pct'] > 0) {
        $highlights[] = [
            'icon'  => 'bi-graph-up-arrow',
            'title' => 'Construction Progress',
            'desc'  => (int)$r['progress_pct'] . '% complete',
        ];
    }
    if (!empty($r['handover_date'])) {
        $ts = strtotime((string)$r['handover_date']);
        $highlights[] = [
            'icon'  => 'bi-calendar-event',
            'title' => 'Expected Handover',
            'desc'  => $ts ? date('M Y', $ts) : (string)$r['handover_date'],
        ];
    }
    if (isset($r['expected_roi']) && $r['expected_roi'] !== null && $r['expected_roi'] !== '') {
        $highlights[] = [
            'icon'  => 'bi-percent',
            'title' => 'Expected ROI',
            'desc'  => rtrim(rtrim(number_format((float)$r['expected_roi'], 2, '.', ','), '0'), '.') . '%',
        ];
    }
    if (trim((string)($r['developer'] ?? '')) !== '') {
        $highlights[] = [
            'icon'  => 'bi-briefcase',
            'title' => 'Developer',
            'desc'  => (string)$r['developer'],
        ];
    }

    $features = [];
    if ($place !== '') $features[] = ['title' => 'Location', 'desc' => $place];
    if (trim((string)($r['developer'] ?? '')) !== '') $features[] = ['title' => 'Developer', 'desc' => (string)$r['developer']];
    if (trim((string)($r['payment_plan'] ?? '')) !== '') $features[] = ['title' => 'Payment Plan', 'desc' => (string)$r['payment_plan']];
    if (!empty($r['handover_date'])) {
        $ts = strtotime((string)$r['handover_date']);
        $features[] = ['title' => 'Handover', 'desc' => $ts ? date('d M Y', $ts) : (string)$r['handover_date']];
    }
    if ($city !== '' && $country !== '') $features[] = ['title' => 'City', 'desc' => $city . ', ' . $country];

    return [
        'source'            => 'db',
        'title'             => $title,
        'hero_style'        => 'style="background-image:url(\'' . $image . '\')"',
        'featured_image'    => detail_card_image($r['cover_image'] ?? '', 'assets/images/project_2.jpg'),
        'featured_alt'      => $title,
        'about_heading'     => $title !== '' ? 'About ' . $title : 'About the Project',
        'about_p1'          => $paras[0],
        'about_p2'          => $paras[1],
        'why_heading'       => 'Project Highlights',
        'why_desc'          => '',
        'why_html'          => detail_why_cards($highlights),
        'offerings_heading' => 'Features & Amenities',
        'offerings_html'    => detail_offering_items($features),
        'faq_heading'       => 'Popular Questions',
        'faq_html'          => '',
        'status_badge'      => $badge !== '' ? '<span class="pd-badge">' . e($badge) . '</span>' : '',
        'location_chip'     => $chip !== '' ? '<span class="pd-chip">' . $chip . '</span>' : '',
    ];
}

function proj_view_from_json(array $p)
{
    $title    = trim((string)($p['title'] ?? ''));
    $image    = detail_card_image($p['hero_image'] ?? '', 'assets/images/h1_bg-1.jpg');
    $paras    = detail_paragraphs($p['about_paragraphs'][0] ?? '', $p['about_paragraphs'][1] ?? '');
    $location = trim((string)($p['location'] ?? ''));

    $highlights = [];
    foreach (($p['highlights']['items'] ?? []) as $item) {
        $highlights[] = ['icon' => $item['icon'] ?? 'bi bi-star', 'title' => $item['title'] ?? '', 'desc' => $item['desc'] ?? ''];
    }

    $features = [];
    foreach (($p['features'] ?? []) as $feat) {
        $features[] = ['title' => $feat['title'] ?? '', 'desc' => $feat['desc'] ?? ''];
    }

    $badge = trim((string)($p['status'] ?? ''));

    return [
        'source'            => 'cms',
        'title'             => $title,
        'hero_style'        => 'style="background-image:url(\'' . $image . '\')"',
        'featured_image'    => detail_card_image($p['featured_image'] ?? '', 'assets/images/project_2.jpg'),
        'featured_alt'      => trim((string)($p['featured_alt'] ?? ($title ?: 'Project'))),
        'about_heading'     => $p['about_heading'] ?? 'About the Project',
        'about_p1'          => $paras[0],
        'about_p2'          => $paras[1],
        'why_heading'       => $p['highlights']['heading'] ?? 'Project Highlights',
        'why_desc'          => $p['highlights']['description'] ?? '',
        'why_html'          => detail_why_cards($highlights),
        'offerings_heading' => $p['features_heading'] ?? 'Features & Amenities',
        'offerings_html'    => detail_offering_items($features),
        'faq_heading'       => $p['faq_heading'] ?? 'Popular Questions',
        'faq_html'          => detail_faq_items($p['faqs'] ?? [], 'pd'),
        'status_badge'      => $badge !== '' ? '<span class="pd-badge">' . e($badge) . '</span>' : '',
        'location_chip'     => $location !== '' ? '<span class="pd-chip"><i class="bi bi-geo-alt-fill"></i> ' . e($location) . '</span>' : '',
    ];
}

/* ----------------------------------------------------------- not-found view */

/**
 * Placeholder set for an unknown slug: keeps the page shell (hero, sidebar,
 * CTA) and turns the content column into a single message + back link.
 */
function detail_not_found_view($kind, $slug, $backHref)
{
    $slug    = trim((string)$slug);
    $backLbl = $kind === 'project' ? 'all projects' : 'all services';
    $shown   = $slug !== '' ? '"' . e($slug) . '"' : 'that entry';

    return [
        'source'            => '',
        'not_found'         => true,
        'title'             => $kind === 'project' ? 'Project not found' : 'Service not found',
        'hero_style'        => '',
        'featured_image'    => '',
        'featured_alt'      => '',
        'about_heading'     => $kind === 'project' ? 'Project not found' : 'Service not found',
        'about_p1'          => 'We could not find ' . $shown . '. It may have been renamed, unpublished or the link may be out of date.',
        'about_p2'          => '<a href="' . e($backHref) . '">&larr; Back to ' . $backLbl . '</a>',
        'why_heading'       => '',
        'why_desc'          => '',
        'why_html'          => '',
        'offerings_heading' => '',
        'offerings_html'    => '',
        'faq_heading'       => '',
        'faq_html'          => '',
        'status_badge'      => '',
        'location_chip'     => '',
    ];
}

/* ------------------------------------------------------------- post-process */

/** Drop one <section class="sd-block {cls}">…</section> block from the page. */
function detail_strip_section($html, $cls)
{
    $pattern = '#<section class="sd-block ' . preg_quote($cls, '#') . '">.*?</section>#s';
    $out = preg_replace($pattern, '', (string)$html, 1);
    return is_string($out) ? $out : (string)$html;
}

/**
 * Apply a view to the template html: inject placeholders, then remove the
 * sections whose content came back empty plus any empty image/paragraph shell.
 */
function detail_apply_view($html, array $v)
{
    $map = [
        '{{PAGE_TITLE}}'         => $v['title'],
        '{{HERO_STYLE}}'         => $v['hero_style'],
        '{{BREADCRUMB_TITLE}}'   => $v['title'],
        '{{FEATURED_IMAGE}}'     => $v['featured_image'],
        '{{FEATURED_ALT}}'       => $v['featured_alt'],
        '{{STATUS_BADGE}}'       => $v['status_badge'],
        '{{LOCATION_CHIP}}'      => $v['location_chip'],
        '{{ABOUT_HEADING}}'      => $v['about_heading'],
        '{{ABOUT_P1}}'           => $v['about_p1'],
        '{{ABOUT_P2}}'           => $v['about_p2'],
        '{{WHY_HEADING}}'        => $v['why_heading'],
        '{{WHY_DESC}}'           => $v['why_desc'],
        '{{WHY_CARDS}}'          => $v['why_html'],
        '{{HIGHLIGHTS_HEADING}}' => $v['why_heading'],
        '{{HIGHLIGHTS_DESC}}'    => $v['why_desc'],
        '{{HIGHLIGHT_CARDS}}'    => $v['why_html'],
        '{{OFFERINGS_HEADING}}'  => $v['offerings_heading'],
        '{{OFFERINGS}}'          => $v['offerings_html'],
        '{{FEATURES_HEADING}}'   => $v['offerings_heading'],
        '{{FEATURES}}'           => $v['offerings_html'],
        '{{FAQ_HEADING}}'        => $v['faq_heading'],
        '{{FAQS}}'               => $v['faq_html'],
    ];

    $html = str_replace(array_keys($map), array_values($map), (string)$html);

    if ($v['why_html'] === '')      $html = detail_strip_section($html, 'sd-why');
    if ($v['offerings_html'] === '') $html = detail_strip_section($html, 'sd-offerings');
    if ($v['faq_html'] === '')      $html = detail_strip_section($html, 'sd-faq');

    if ($v['featured_image'] === '') {
        $out = preg_replace('#<img[^>]*class="sd-featured"[^>]*>#', '', $html, 1);
        if (is_string($out)) $html = $out;
    }

    $html = str_replace('<p></p>', '', $html);

    return $html;
}
