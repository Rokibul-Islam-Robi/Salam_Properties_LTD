<?php

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/news_repo.php';

function news_request_state()
{
    $q = trim((string)($_GET['q'] ?? ''));
    if (function_exists('mb_strlen')) {
        if (mb_strlen($q) > 100) $q = mb_substr($q, 0, 100);
    } elseif (strlen($q) > 100) {
        $q = substr($q, 0, 100);
    }

    $category = strtolower((string)($_GET['category'] ?? ''));
    if (!preg_match('/^[a-z0-9\-]{1,140}$/', $category)) $category = '';

    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    if ($page < 1) $page = 1;

    return ['q' => $q, 'category' => $category, 'page' => $page, 'category_name' => ''];
}

function news_state_url(array $state, array $override = [])
{
    $state = array_merge($state, $override);
    $params = [];
    if (!empty($state['q'])) $params['q'] = (string)$state['q'];
    if (!empty($state['category'])) $params['category'] = (string)$state['category'];
    if (!empty($state['page']) && (int)$state['page'] > 1) $params['page'] = (int)$state['page'];
    return 'news.php' . ($params ? '?' . http_build_query($params) : '');
}

function news_date($value)
{
    $ts = strtotime((string)$value);
    return $ts ? date('M d, Y', $ts) : '';
}

function news_cover(array $row)
{
    $src = trim((string)($row['cover_image'] ?? ''));
    return $src !== '' ? $src : 'assets/images/blog_1.jpg';
}

function news_img_fallback()
{
    return " onerror=\"this.onerror=null;this.src='assets/images/blog_1.jpg'\"";
}

function news_excerpt(array $row, $length = 165)
{
    $text = trim((string)($row['excerpt'] ?? ''));
    if ($text === '') {
        $raw = str_replace('\\n', ' ', (string)($row['content'] ?? ''));
        $raw = preg_replace('/^#{1,6}\s*/m', '', $raw);
        $raw = preg_replace('/^\s*[-*]\s+/m', '', $raw);
        $raw = preg_replace('/^\s*\d+\.\s+/m', '', $raw);
        $text = trim(preg_replace('/\s+/', ' ', strip_tags($raw)));
    }
    if (function_exists('mb_strlen') && mb_strlen($text) > $length) {
        $text = rtrim(mb_substr($text, 0, $length)) . '&hellip;';
    } elseif (!function_exists('mb_strlen') && strlen($text) > $length) {
        $text = rtrim(substr($text, 0, $length)) . '&hellip;';
    }
    return e($text);
}

function news_category_icon($icon, $fallback = 'bi-folder2')
{
    $icon = trim(preg_replace('/[^a-z0-9 \-]/i', '', (string)$icon));
    if ($icon === '') return $fallback;

    $name = '';
    foreach (preg_split('/\s+/', $icon) as $part) {
        $lower = strtolower($part);
        if ($part === '' || $lower === 'bi' || $lower === 'bi-') continue;
        $name = $part;
    }
    if ($name === '') return $fallback;

    return 'bi-' . preg_replace('/^bi-/', '', $name);
}

function news_post_card(array $row)
{
    $slug = e($row['slug'] ?? '');
    $href = 'post.php?slug=' . $slug;
    $title = e($row['title'] ?? '');
    $cat = e($row['category_name'] ?? 'News');
    $author = e($row['author_name'] ?? 'Admin');
    $date = e(news_date($row['created_at'] ?? ''));
    $read = (int)($row['reading_time'] ?? 0);
    $alt = $title !== '' ? $title : 'News image';

    $html = '<article class="blog-card news-card">';
    $html .= '<a class="blog-img-wrap" href="' . $href . '">';
    $html .= '<img alt="' . $alt . '" class="blog-img" loading="lazy" src="' . e(news_cover($row)) . '"' . news_img_fallback() . '/>';
    $html .= '</a>';
    $html .= '<span class="blog-badge">' . $cat . '</span>';
    $html .= '<div class="blog-meta">';
    $html .= '<span><i class="fa-regular fa-user"></i> ' . $author . '</span>';
    $html .= '<span><i class="fa-regular fa-calendar"></i> ' . $date . '</span>';
    if ($read > 0) $html .= '<span><i class="fa-regular fa-clock"></i> ' . $read . ' min read</span>';
    $html .= '</div>';
    $html .= '<a href="' . $href . '"><h2 class="blog-title">' . $title . '</h2></a>';
    $html .= '<p class="blog-excerpt">' . news_excerpt($row) . '</p>';
    $html .= '<a class="read-more" href="' . $href . '">Read Article <i class="bi bi-arrow-right"></i></a>';
    $html .= '</article>';

    return $html;
}

function news_categories_list(array $cats, $activeSlug, $totalAll)
{
    $html = '';
    $allActive = ($activeSlug === '');
    $html .= '<a class="list-group-item list-group-item-action cat-item' . ($allActive ? ' is-active' : '') . '" href="news.php">';
    $html .= '<span class="cat-label"><i class="bi bi-collection"></i><span>All News</span></span>';
    if ($totalAll !== null) $html .= '<span class="badge rounded-pill cat-count">' . (int)$totalAll . '</span>';
    $html .= '</a>';

    foreach ($cats as $cat) {
        $slug = (string)($cat['slug'] ?? '');
        $isActive = ($activeSlug !== '' && $slug === $activeSlug);
        $html .= '<a class="list-group-item list-group-item-action cat-item' . ($isActive ? ' is-active' : '') . '"';
        $html .= ' href="news.php?category=' . e($slug) . '">';
        $html .= '<span class="cat-label"><i class="' . e(news_category_icon($cat['icon'] ?? '')) . '"></i>';
        $html .= '<span>' . e($cat['name'] ?? '') . '</span></span>';
        $html .= '<span class="badge rounded-pill cat-count">' . (int)($cat['post_count'] ?? 0) . '</span>';
        $html .= '</a>';
    }

    return $html;
}

function news_recent_list(array $rows)
{
    $html = '';
    foreach ($rows as $row) {
        $slug = e($row['slug'] ?? '');
        $href = 'post.php?slug=' . $slug;
        $html .= '<a class="list-group-item list-group-item-action recent-item" href="' . $href . '">';
        $html .= '<img alt="' . e($row['title'] ?? '') . '" class="recent-post-img" height="64" loading="lazy" src="' . e(news_cover($row)) . '" width="64"' . news_img_fallback() . '/>';
        $html .= '<span class="recent-post-info">';
        $html .= '<span class="recent-post-title">' . e($row['title'] ?? '') . '</span>';
        $html .= '<span class="recent-post-date"><i class="bi bi-calendar3"></i> ' . e(news_date($row['created_at'] ?? '')) . '</span>';
        $html .= '</span></a>';
    }
    return $html;
}

function news_results_bar(array $state, $total)
{
    $total = (int)$total;
    $label = $total === 1 ? 'post' : 'posts';
    $html = '<div class="results-bar card"><div class="card-body">';
    $html .= '<p class="results-count">Showing <strong>' . $total . '</strong> ' . $label;
    if ($state['q'] !== '') {
        $html .= ' for <span class="filter-chip"><i class="bi bi-search"></i> "' . e($state['q']) . '"</span>';
    }
    if (!empty($state['category_name'])) {
        $html .= ' in <span class="filter-chip"><i class="bi bi-folder2-open"></i> ' . e($state['category_name']) . '</span>';
    }
    $html .= '</p>';
    $html .= '<a class="btn-clear" href="news.php">Clear all <i class="bi bi-x-lg"></i></a>';
    $html .= '</div></div>';
    return $html;
}

function news_empty_state(array $state)
{
    $hasQuery = ($state['q'] !== '');
    $hasCat = !empty($state['category_name']);
    $title = $hasQuery ? 'No results found' : 'Nothing published yet';
    $text = 'We could not find any posts';
    if ($hasQuery) $text .= ' matching &ldquo;' . e($state['q']) . '&rdquo;';
    if ($hasCat) $text .= ' in ' . e($state['category_name']);
    $text .= '. Try a different keyword or browse all of our latest news.';
    $icon = $hasQuery ? 'bi-search' : 'bi-newspaper';

    $html = '<div class="news-empty card"><div class="card-body text-center">';
    $html .= '<span class="empty-icon"><i class="bi ' . $icon . '"></i></span>';
    $html .= '<h4 class="empty-title">' . $title . '</h4>';
    $html .= '<p class="empty-text">' . $text . '</p>';
    $html .= '<a class="btn-clear btn-clear-lg" href="news.php">Browse all news <i class="bi bi-arrow-right"></i></a>';
    $html .= '</div></div>';
    return $html;
}

function news_pagination($page, $pages, array $state)
{
    $page = (int)$page;
    $pages = (int)$pages;
    if ($pages <= 1) return '';

    $html = '<nav aria-label="News pagination"><div class="pagination news-pagination">';
    if ($page > 1) {
        $html .= '<a aria-label="Previous page" class="page-dot" href="' . e(news_state_url($state, ['page' => $page - 1])) . '"><i class="fa-solid fa-chevron-left"></i></a>';
    }
    for ($i = 1; $i <= $pages; $i++) {
        if ($i === $page) {
            $html .= '<span aria-current="page" class="page-dot active">' . $i . '</span>';
        } else {
            $html .= '<a class="page-dot" href="' . e(news_state_url($state, ['page' => $i])) . '">' . $i . '</a>';
        }
    }
    if ($page < $pages) {
        $html .= '<a aria-label="Next page" class="page-dot" href="' . e(news_state_url($state, ['page' => $page + 1])) . '"><i class="fa-solid fa-chevron-right"></i></a>';
    }
    $html .= '</div></nav>';
    return $html;
}

function news_replace_block($html, $marker, $content)
{
    $pattern = '#<!--' . $marker . '_START-->.*?<!--' . $marker . '_END-->#s';
    return preg_replace_callback($pattern, function () use ($content) {
        return $content;
    }, $html);
}

function news_inject($html, $state = null)
{
    $state = $state ? $state : news_request_state();

    $html = str_replace(['{{NEWS_Q}}', '{{NEWS_CAT}}'], [e($state['q']), e($state['category'])], $html);

    $cats = news_categories();
    $recent = news_recent();
    if ($cats === null || $recent === null) return $html;

    $needsList = (bool)preg_match('/<!--NEWS_(POSTS|FILTER_BAR|PAGINATION)/', $html);

    $search = null;
    $activeCat = null;
    if ($needsList) {
        $catId = null;
        if ($state['category'] !== '') {
            $activeCat = news_category_by_slug($state['category']);
            $catId = $activeCat ? (int)$activeCat['id'] : -1;
        }
        $search = news_search($state['q'], $catId, $state['page'], NEWS_PER_PAGE);
        if ($search === null) return $html;
        if ($activeCat) {
            $state['category_name'] = (string)$activeCat['name'];
        } elseif ($state['category'] !== '') {
            $state['category_name'] = ucwords(str_replace('-', ' ', $state['category']));
        }
    }

    $totalAll = news_total_posts();

    $html = news_replace_block($html, 'NEWS_CATEGORIES', news_categories_list($cats, $state['category'], $totalAll));
    $html = news_replace_block($html, 'NEWS_RECENT', news_recent_list($recent));

    if ($search === null) return $html;

    if (strpos($html, '<!--NEWS_FILTER_BAR-->') !== false) {
        $hasFilter = ($state['q'] !== '' || $state['category'] !== '');
        $bar = $hasFilter ? news_results_bar($state, $search['total']) : '';
        $html = str_replace('<!--NEWS_FILTER_BAR-->', $bar, $html);
    }

    $postsHtml = $search['total'] > 0
        ? implode('', array_map('news_post_card', $search['rows']))
        : news_empty_state($state);

    $html = news_replace_block($html, 'NEWS_POSTS', $postsHtml);
    $html = news_replace_block($html, 'NEWS_PAGINATION', news_pagination($search['page'], $search['pages'], $state));

    return $html;
}

function news_md_inline($text)
{
    $text = preg_replace('/\*\*(.+?)\*\*/s', '<strong>$1</strong>', $text);
    $text = preg_replace('/(^|[^*])\*([^*\n]+)\*/s', '$1<em>$2</em>', $text);
    $text = preg_replace('/`([^`]+)`/', '<code>$1</code>', $text);
    return $text;
}

function news_md_to_html($markdown)
{
    $text = str_replace('\\n', "\n", (string)$markdown);
    $text = str_replace(["\r\n", "\r"], "\n", $text);
    $text = htmlspecialchars($text, ENT_QUOTES, 'UTF-8');

    $out = '';
    $para = [];
    $listType = null;

    $flushPara = function () use (&$out, &$para) {
        if ($para) {
            $out .= '<p>' . news_md_inline(implode(' ', $para)) . '</p>';
            $para = [];
        }
    };
    $flushList = function () use (&$out, &$listType) {
        if ($listType) {
            $out .= '</' . $listType . '>';
            $listType = null;
        }
    };

    foreach (explode("\n", $text) as $line) {
        $trim = trim($line);
        if ($trim === '') {
            $flushPara();
            $flushList();
            continue;
        }
        if (preg_match('/^(#{1,6})\s+(.*)$/', $trim, $m)) {
            $flushPara();
            $flushList();
            $level = min(6, max(2, strlen($m[1])));
            $out .= '<h' . $level . '>' . news_md_inline($m[2]) . '</h' . $level . '>';
            continue;
        }
        if (preg_match('/^[-*]\s+(.*)$/', $trim, $m)) {
            $flushPara();
            if ($listType !== 'ul') {
                $flushList();
                $out .= '<ul>';
                $listType = 'ul';
            }
            $out .= '<li>' . news_md_inline($m[1]) . '</li>';
            continue;
        }
        if (preg_match('/^\d+\.\s+(.*)$/', $trim, $m)) {
            $flushPara();
            if ($listType !== 'ol') {
                $flushList();
                $out .= '<ol>';
                $listType = 'ol';
            }
            $out .= '<li>' . news_md_inline($m[1]) . '</li>';
            continue;
        }
        $flushList();
        $para[] = $trim;
    }
    $flushPara();
    $flushList();

    return $out;
}

function news_tags_html($tags)
{
    $tags = trim((string)$tags);
    if ($tags === '') return '';
    $html = '';
    foreach (explode(',', $tags) as $tag) {
        $tag = trim($tag);
        if ($tag === '') continue;
        $html .= '<a class="tag-chip" href="' . e(news_state_url(['q' => $tag, 'category' => '', 'page' => 1])) . '">#' . e($tag) . '</a>';
    }
    return $html;
}

function news_related_card(array $row)
{
    $href = 'post.php?slug=' . e($row['slug'] ?? '');
    $html = '<a class="related-card" href="' . $href . '">';
    $html .= '<span class="related-img"><img alt="' . e($row['title'] ?? '') . '" loading="lazy" src="' . e(news_cover($row)) . '"' . news_img_fallback() . '/></span>';
    $html .= '<span class="related-body">';
    $html .= '<span class="related-date"><i class="bi bi-calendar3"></i> ' . e(news_date($row['created_at'] ?? '')) . '</span>';
    $html .= '<span class="related-title">' . e($row['title'] ?? '') . '</span>';
    $html .= '</span></a>';
    return $html;
}

function news_post_inject($html, array $vars)
{
    $post = $vars['post'] ?? null;
    if (!$post) return $html;

    $related = news_related(
        (int)$post['id'],
        (isset($post['category_id']) && $post['category_id'] !== null) ? (int)$post['category_id'] : null
    );

    $relatedSection = '';
    if (is_array($related) && $related) {
        $relatedSection = '<h3 class="sidebar-title">Related Posts</h3><div class="related-grid">'
            . implode('', array_map('news_related_card', $related))
            . '</div>';
    }

    $date = news_date($post['created_at'] ?? '');
    $reading = (int)($post['reading_time'] ?? 0);
    $views = (int)($post['views_count'] ?? 0);
    $author = e($post['author_name'] ?? 'Admin');

    $metaParts = [];
    if ($author !== '') $metaParts[] = '<span><i class="fa-regular fa-user"></i> ' . $author . '</span>';
    if ($date !== '') $metaParts[] = '<span><i class="fa-regular fa-calendar"></i> ' . $date . '</span>';
    if ($reading > 0) $metaParts[] = '<span><i class="fa-regular fa-clock"></i> ' . $reading . ' min read</span>';
    if ($views > 0) $metaParts[] = '<span><i class="fa-regular fa-eye"></i> ' . number_format($views) . ' views</span>';

    $replacements = [
        '{{POST_TITLE}}'       => e($post['title'] ?? ''),
        '{{POST_EXCERPT}}'     => e($post['excerpt'] ?? ''),
        '{{POST_BADGE}}'       => e($post['category_name'] ?? 'News'),
        '{{POST_DATE}}'        => e($date),
        '{{POST_META}}'        => implode('', $metaParts),
        '{{POST_COVER}}'       => e(news_cover($post)),
        '{{POST_ALT}}'         => e($post['title'] ?? 'News cover'),
        '{{POST_CONTENT}}'     => news_md_to_html($post['content'] ?? ''),
        '{{POST_TAGS}}'        => news_tags_html($post['tags'] ?? ''),
        '{{POST_SLUG}}'        => e($post['slug'] ?? ''),
        '{{RELATED_POSTS}}'    => $relatedSection,
        '{{NEWS_Q}}'           => '',
        '{{NEWS_CAT}}'         => e($post['category_slug'] ?? ''),
    ];

    $html = str_replace(array_keys($replacements), array_values($replacements), $html);

    return news_inject($html, [
        'q'        => '',
        'category' => (string)($post['category_slug'] ?? ''),
        'page'     => 1,
        'category_name' => '',
    ]);
}
