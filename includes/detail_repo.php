<?php
/**
 * detail_repo.php — data layer for service & project detail pages.
 *
 * Every lookup goes through PDO prepared statements keyed on the slug taken
 * from $_GET. Functions return null / [] when the database is unreachable so
 * callers can fall back to the CMS records instead of fataling.
 *
 * Requires includes/db.php (db_pdo()).
 */

require_once __DIR__ . '/db.php';

/**
 * Normalise a raw ?slug= value to the character set used by both tables.
 * Anything else (spaces, tags, path separators) is dropped, never interpolated.
 */
function detail_slug($raw)
{
    $raw = strtolower(trim((string)$raw));
    $raw = preg_replace('/[^a-z0-9\-]/', '', (string)$raw);
    return is_string($raw) ? $raw : '';
}

/* ----------------------------------------------------------------- services */

function services_all()
{
    $pdo = db_pdo();
    if (!$pdo) return [];

    try {
        $st = $pdo->query(
            'SELECT id, slug, title, subtitle, excerpt, description, icon, image, features, sort_order, is_active
               FROM services
              WHERE is_active = 1
              ORDER BY sort_order ASC, id ASC'
        );
        $rows = $st->fetchAll();
        return is_array($rows) ? $rows : [];
    } catch (Throwable $e) {
        return [];
    }
}

function service_by_slug($slug)
{
    $slug = detail_slug($slug);
    if ($slug === '') return null;

    $pdo = db_pdo();
    if (!$pdo) return null;

    try {
        $st = $pdo->prepare(
            'SELECT id, slug, title, subtitle, excerpt, description, icon, image, features, sort_order, is_active
               FROM services
              WHERE slug = :slug AND is_active = 1
              LIMIT 1'
        );
        $st->execute([':slug' => $slug]);
        $row = $st->fetch();
        return $row ?: null;
    } catch (Throwable $e) {
        return null;
    }
}

/* ------------------------------------------------------------------ projects */

const DETAIL_PROJECT_LIVE = "('planning','construction','completed','published')";

function projects_all()
{
    $pdo = db_pdo();
    if (!$pdo) return [];

    try {
        $st = $pdo->query(
            'SELECT id, slug, title, summary, description, status, location, city, country,
                    total_units, units_available, price_from, price_to, currency, expected_roi,
                    progress_pct, handover_date, developer, payment_plan, cover_image,
                    is_featured, views_count
               FROM investment_projects
              WHERE status IN ' . DETAIL_PROJECT_LIVE . '
              ORDER BY is_featured DESC, id ASC'
        );
        $rows = $st->fetchAll();
        return is_array($rows) ? $rows : [];
    } catch (Throwable $e) {
        return [];
    }
}

function project_by_slug($slug)
{
    $slug = detail_slug($slug);
    if ($slug === '') return null;

    $pdo = db_pdo();
    if (!$pdo) return null;

    try {
        $st = $pdo->prepare(
            'SELECT id, slug, title, summary, description, status, location, city, country,
                    total_units, units_available, price_from, price_to, currency, expected_roi,
                    progress_pct, handover_date, developer, payment_plan, cover_image,
                    is_featured, views_count
               FROM investment_projects
              WHERE slug = :slug AND status IN ' . DETAIL_PROJECT_LIVE . '
              LIMIT 1'
        );
        $st->execute([':slug' => $slug]);
        $row = $st->fetch();
        return $row ?: null;
    } catch (Throwable $e) {
        return null;
    }
}
