<?php

require_once __DIR__ . '/db.php';

if (!defined('NEWS_PER_PAGE'))      define('NEWS_PER_PAGE', 6);
if (!defined('NEWS_RECENT_LIMIT'))  define('NEWS_RECENT_LIMIT', 5);
if (!defined('NEWS_RELATED_LIMIT')) define('NEWS_RELATED_LIMIT', 3);

function news_like_param($term)
{
    $term = (string)$term;
    $term = str_replace(['!', '%', '_'], ['!!', '!%', '!_'], $term);
    return '%' . $term . '%';
}

function news_categories()
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $sql = "SELECT c.id, c.name, c.slug, c.icon, c.sort_order,
                       COUNT(p.id) AS post_count
                  FROM categories c
                  LEFT JOIN posts p
                         ON p.category_id = c.id
                        AND p.status = 'published'
                 WHERE c.type = 'post'
                   AND c.is_active = 1
                 GROUP BY c.id, c.name, c.slug, c.icon, c.sort_order
                HAVING post_count > 0
                 ORDER BY c.sort_order ASC, c.name ASC";
        return $pdo->query($sql)->fetchAll();
    } catch (Throwable $e) {
        return null;
    }
}

function news_category_by_slug($slug)
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $stmt = $pdo->prepare(
            "SELECT id, name, slug
               FROM categories
              WHERE type = 'post' AND is_active = 1 AND slug = ?
              LIMIT 1"
        );
        $stmt->execute([(string)$slug]);
        $row = $stmt->fetch();
        return $row ? $row : null;
    } catch (Throwable $e) {
        return null;
    }
}

function news_total_posts()
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $stmt = $pdo->query("SELECT COUNT(*) FROM posts WHERE status = 'published'");
        return (int)$stmt->fetchColumn();
    } catch (Throwable $e) {
        return null;
    }
}

function news_search($term, $categoryId, $page, $perPage)
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $term = trim((string)$term);
        $perPage = max(1, (int)$perPage);
        $page = max(1, (int)$page);

        $where = ["p.status = 'published'"];
        $params = [];

        if ($categoryId !== null) {
            $where[] = 'p.category_id = ?';
            $params[] = (int)$categoryId;
        }

        if ($term !== '') {
            $where[] = "(p.title LIKE ? ESCAPE '!'
                         OR p.content LIKE ? ESCAPE '!'
                         OR p.tags LIKE ? ESCAPE '!')";
            $like = news_like_param($term);
            $params[] = $like;
            $params[] = $like;
            $params[] = $like;
        }

        $whereSql = implode(' AND ', $where);

        $countStmt = $pdo->prepare("SELECT COUNT(*) FROM posts p WHERE " . $whereSql);
        $countStmt->execute($params);
        $total = (int)$countStmt->fetchColumn();

        $pages = max(1, (int)ceil($total / $perPage));
        if ($page > $pages) $page = $pages;
        $offset = ($page - 1) * $perPage;

        $sql = "SELECT p.id, p.slug, p.title, p.excerpt, p.cover_image, p.tags,
                       p.reading_time, p.views_count, p.created_at, p.published_at,
                       c.name AS category_name, c.slug AS category_slug,
                       u.name AS author_name
                  FROM posts p
                  LEFT JOIN categories c ON c.id = p.category_id
                  LEFT JOIN users u ON u.id = p.author_id
                 WHERE " . $whereSql . "
                 ORDER BY p.created_at DESC, p.id DESC
                 LIMIT " . (int)$perPage . " OFFSET " . (int)$offset;

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);

        return [
            'rows'  => $stmt->fetchAll(),
            'total' => $total,
            'pages' => $pages,
            'page'  => $page,
        ];
    } catch (Throwable $e) {
        return null;
    }
}

function news_recent($limit = NEWS_RECENT_LIMIT)
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $limit = max(1, (int)$limit);
        $sql = "SELECT p.id, p.slug, p.title, p.cover_image, p.created_at,
                       p.reading_time, c.name AS category_name, c.slug AS category_slug
                  FROM posts p
                  LEFT JOIN categories c ON c.id = p.category_id
                 WHERE p.status = 'published'
                 ORDER BY p.created_at DESC, p.id DESC
                 LIMIT " . (int)$limit;
        return $pdo->query($sql)->fetchAll();
    } catch (Throwable $e) {
        return null;
    }
}

function news_by_slug($slug)
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $stmt = $pdo->prepare(
            "SELECT p.id, p.slug, p.title, p.excerpt, p.content, p.cover_image, p.category_id,
                    p.tags, p.status, p.reading_time, p.views_count,
                    p.created_at, p.published_at,
                    c.name AS category_name, c.slug AS category_slug,
                    u.name AS author_name
               FROM posts p
               LEFT JOIN categories c ON c.id = p.category_id
               LEFT JOIN users u ON u.id = p.author_id
              WHERE p.slug = ?
              LIMIT 1"
        );
        $stmt->execute([(string)$slug]);
        $row = $stmt->fetch();
        return $row ? $row : null;
    } catch (Throwable $e) {
        return null;
    }
}

function news_related($excludeId, $categoryId, $limit = NEWS_RELATED_LIMIT)
{
    $pdo = db_pdo();
    if (!$pdo) return null;
    try {
        $excludeId = (int)$excludeId;
        $limit = max(1, (int)$limit);
        $matchCat = $categoryId !== null ? (int)$categoryId : -1;

        $sql = "SELECT p.id, p.slug, p.title, p.cover_image, p.created_at,
                       c.name AS category_name, c.slug AS category_slug
                  FROM posts p
                  LEFT JOIN categories c ON c.id = p.category_id
                 WHERE p.status = 'published'
                   AND p.id <> ?
                 ORDER BY (p.category_id = ?) DESC, p.created_at DESC, p.id DESC
                 LIMIT " . (int)$limit;

        $stmt = $pdo->prepare($sql);
        $stmt->execute([$excludeId, $matchCat]);
        return $stmt->fetchAll();
    } catch (Throwable $e) {
        return null;
    }
}

function news_bump_views($id)
{
    $pdo = db_pdo();
    if (!$pdo) return;
    try {
        $stmt = $pdo->prepare('UPDATE posts SET views_count = views_count + 1 WHERE id = ?');
        $stmt->execute([(int)$id]);
    } catch (Throwable $e) {
        return;
    }
}
