<?php

require_once __DIR__ . '/includes/render.php';
require_once __DIR__ . '/includes/news_view.php';

$pdSlug = preg_replace('/[^a-z0-9\-]/i', '', (string)($_GET['slug'] ?? ''));
$post = $pdSlug !== '' ? news_by_slug($pdSlug) : null;

if (!$post || ($post['status'] ?? '') !== 'published') {
    header('Location: news.php');
    exit;
}

news_bump_views((int)$post['id']);
$post['views_count'] = (int)$post['views_count'] + 1;

render_page('post', ['post' => $post, 'nav' => 'news']);
