<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'pages';
$pageTitle = 'Page Editor';
$data = cms_data();
if (!isset($data['pages'])) $data['pages'] = [];
if (!isset($data['custom_pages'])) $data['custom_pages'] = [];

$pages = $data['pages'];
$customPages = $data['custom_pages'];

// Helper to list available backups
function get_backup_list() {
    $backups = [];
    $files = glob(BACKUP_DIR . '/content_*.json');
    if ($files) {
        usort($files, fn($a, $b) => filemtime($b) - filemtime($a)); // Newest first
        foreach ($files as $f) {
            $base = basename($f);
            preg_match('/content_(\d{4}-\d{2}-\d{2})_(\d{2}-\d{2}-\d{2})\.json/', $base, $matches);
            $formattedTime = isset($matches[1]) ? $matches[1] . ' ' . str_replace('-', ':', $matches[2]) : date('Y-m-d H:i:s', filemtime($f));
            $backups[] = [
                'file' => $base,
                'path' => $f,
                'time' => $formattedTime,
                'timestamp' => filemtime($f),
                'size' => round(filesize($f) / 1024, 1) . ' KB'
            ];
        }
    }
    return $backups;
}

// Handle Page Actions: Create, Delete, Rollback, Undo
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $action = $_POST['action'];

    if ($action === 'create_page') {
        $title = trim($_POST['title'] ?? '');
        $rawSlug = trim($_POST['slug'] ?? '');
        $slug = preg_replace('/[^a-z0-9_-]/i', '', strtolower(str_replace(' ', '-', $rawSlug ?: $title)));
        $subtitle = trim($_POST['subtitle'] ?? '');
        $content = trim($_POST['content'] ?? '');
        $showInMenu = !empty($_POST['show_in_menu']);
        $featuredImage = '';

        if (empty($slug) || empty($title)) {
            header('Location: pages.php?msg=create_err');
            exit;
        }

        // Check reserved or existing names
        $reserved = ['index', 'admin', 'config', 'router', 'api_inquiry', 'service-details', 'project-details', 'leadership', 'why-choose-us'];
        if (in_array($slug, $reserved) || isset($data['pages'][$slug])) {
            header('Location: pages.php?msg=slug_exists');
            exit;
        }

        // Handle image upload if provided
        if (isset($_FILES['featured_image']) && $_FILES['featured_image']['error'] === UPLOAD_ERR_OK) {
            $ext = strtolower(pathinfo($_FILES['featured_image']['name'], PATHINFO_EXTENSION));
            if (in_array($ext, ['jpg', 'jpeg', 'png', 'webp', 'svg'])) {
                $imgName = 'uploads/page-' . $slug . '-' . time() . '.' . $ext;
                if (move_uploaded_file($_FILES['featured_image']['tmp_name'], BASE_PATH . '/' . $imgName)) {
                    $featuredImage = $imgName;
                }
            }
        }

        // 1. Generate PHP file in root: e.g. /my-page.php
        $phpFile = BASE_PATH . '/' . $slug . '.php';
        $phpContent = "<?php require __DIR__.'/includes/render.php'; render_page('" . $slug . "');\n";
        file_put_contents($phpFile, $phpContent);

        // 2. Generate HTML template in /templates/my-page.html
        $templatePath = BASE_PATH . '/templates/custom_page_template.html';
        $tplHtml = file_get_contents($templatePath);
        
        $imageHtml = !empty($featuredImage) 
            ? '<img src="' . htmlspecialchars($featuredImage) . '" alt="' . htmlspecialchars($title) . '" class="custom-featured-image" data-cms-image-key="' . $slug . '.image.1">' 
            : '';

        $formattedBody = !empty($content) ? nl2br(htmlspecialchars($content)) : '<p>Welcome to our ' . htmlspecialchars($title) . ' page. Detailed content will be published here shortly.</p>';
        $subText = !empty($subtitle) ? htmlspecialchars($subtitle) : 'Discover premier real estate excellence with Salam Properties Ltd.';

        $renderedHtml = str_replace([
            '{{PAGE_SLUG}}',
            '{{PAGE_TITLE}}',
            '{{PAGE_HEADING}}',
            '{{PAGE_BREADCRUMB}}',
            '{{PAGE_SUBTITLE}}',
            '{{PAGE_CONTENT}}',
            '{{FEATURED_IMAGE_HTML}}',
            '{{PAGE_META_DESCRIPTION}}'
        ], [
            $slug,
            htmlspecialchars($title),
            htmlspecialchars($title),
            htmlspecialchars($title),
            $subText,
            $formattedBody,
            $imageHtml,
            htmlspecialchars($subtitle ?: $title)
        ], $tplHtml);

        $htmlFile = BASE_PATH . '/templates/' . $slug . '.html';
        file_put_contents($htmlFile, $renderedHtml);

        // 3. Register page in data/content.json
        $data['pages'][$slug] = [
            'text' => [
                ['key' => $slug . '.text.1', 'tag' => 'h1', 'value' => $title, 'original' => $title],
                ['key' => $slug . '.text.2', 'tag' => 'span', 'value' => $title, 'original' => $title],
                ['key' => $slug . '.text.3', 'tag' => 'div', 'value' => $subText, 'original' => $subText],
                ['key' => $slug . '.text.4', 'tag' => 'div', 'value' => $content ?: 'Detailed content will be published here shortly.', 'original' => $content]
            ],
            'images' => !empty($featuredImage) ? [
                ['key' => $slug . '.image.1', 'src' => $featuredImage, 'alt' => $title]
            ] : []
        ];

        $data['custom_pages'][$slug] = [
            'slug' => $slug,
            'title' => $title,
            'subtitle' => $subtitle,
            'show_in_menu' => $showInMenu,
            'created_at' => date('Y-m-d H:i:s')
        ];

        cms_save($data);
        header('Location: pages.php?msg=created&new_slug=' . urlencode($slug));
        exit;

    } elseif ($action === 'delete_custom_page') {
        $slug = preg_replace('/[^a-z0-9_-]/i', '', $_POST['slug'] ?? '');
        if (!empty($slug) && isset($data['custom_pages'][$slug])) {
            unset($data['custom_pages'][$slug]);
            unset($data['pages'][$slug]);

            // Remove files safely
            $phpFile = BASE_PATH . '/' . $slug . '.php';
            $htmlFile = BASE_PATH . '/templates/' . $slug . '.html';
            if (file_exists($phpFile)) @unlink($phpFile);
            if (file_exists($htmlFile)) @unlink($htmlFile);

            cms_save($data);
            header('Location: pages.php?msg=deleted');
            exit;
        }
    } elseif ($action === 'rollback') {
        $backupName = basename($_POST['backup_file'] ?? '');
        $targetFile = BACKUP_DIR . '/' . $backupName;
        if (file_exists($targetFile)) {
            @copy(DATA_FILE, BACKUP_DIR . '/content_before_rollback_' . date('Y-m-d_H-i-s') . '.json');
            if (copy($targetFile, DATA_FILE)) {
                header('Location: pages.php?msg=restored');
                exit;
            }
        }
    } elseif ($action === 'quick_undo') {
        $backups = get_backup_list();
        if (!empty($backups)) {
            $latest = $backups[0]['path'];
            @copy(DATA_FILE, BACKUP_DIR . '/content_before_undo_' . date('Y-m-d_H-i-s') . '.json');
            if (copy($latest, DATA_FILE)) {
                header('Location: pages.php?msg=undone');
                exit;
            }
        }
    }
}

// Check if editing a specific page
$editPage = $_GET['page'] ?? '';
if ($editPage) {
    $editPage = preg_replace('/[^a-z0-9_-]/i', '', $editPage);
    if (!isset($pages[$editPage])) { http_response_code(404); exit('Unknown page'); }
    $pd = $pages[$editPage];

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['action'])) {
        foreach (($pd['text'] ?? []) as $i => $item) {
            $k = $item['key'];
            if (array_key_exists($k, $_POST['text'] ?? [])) {
                $data['pages'][$editPage]['text'][$i]['value'] = trim($_POST['text'][$k]);
            }
        }
        foreach (($pd['images'] ?? []) as $i => $item) {
            $k = $item['key'];
            $alt = $_POST['alt'][$k] ?? $item['alt'];
            $data['pages'][$editPage]['images'][$i]['alt'] = trim($alt);
            if (isset($_FILES['image']['name'][$k]) && $_FILES['image']['error'][$k] === UPLOAD_ERR_OK) {
                $name = $_FILES['image']['name'][$k];
                $tmp = $_FILES['image']['tmp_name'][$k];
                $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
                if (in_array($ext, ['jpg','jpeg','png','webp','gif','svg'], true)) {
                    $safe = preg_replace('/[^a-zA-Z0-9._-]/', '-', pathinfo($name, PATHINFO_FILENAME));
                    $dest = 'uploads/' . $editPage . '-' . substr(sha1($k . microtime(true)), 0, 10) . '-' . $safe . '.' . $ext;
                    if (move_uploaded_file($tmp, BASE_PATH . '/' . $dest)) {
                        $data['pages'][$editPage]['images'][$i]['src'] = $dest;
                    }
                }
            }
        }
        cms_save($data);
        header('Location: pages.php?page=' . urlencode($editPage) . '&saved=1');
        exit;
    }
}

$backups = get_backup_list();
$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<?php if ($editPage): ?>
<!-- Edit Page Content -->
<div class="page-title-box">
    <div>
        <h1 class="page-title">Editing: <?= e(page_label($editPage)) ?></h1>
        <p class="page-subtitle">Modify text content and images for this page. Changes will reflect immediately on the live website.</p>
    </div>
    <div class="d-flex gap-2">
        <?php if (!empty($backups)): ?>
        <form method="post" onsubmit="return confirm('Do you want to Undo the last saved changes and restore the previous version?');" style="display:inline;">
            <input type="hidden" name="action" value="quick_undo">
            <button type="submit" class="btn btn-warning" style="font-weight:600;font-size:13px;color:#78350f;">
                <i class="bi bi-arrow-counterclockwise me-1"></i> 1-Click Undo Changes
            </button>
        </form>
        <?php endif; ?>
        <a href="/<?= e($editPage) ?>.php" target="_blank" class="btn btn-outline-corporate"><i class="bi bi-eye me-1"></i> View Live Page</a>
        <a href="pages.php" class="btn btn-outline-corporate"><i class="bi bi-arrow-left me-1"></i> Back to Pages</a>
    </div>
</div>

<?php if (isset($_GET['saved'])): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <i class="bi bi-check-circle me-1"></i> Page content saved successfully! The live website is updated.
        </div>
        <?php if (!empty($backups)): ?>
        <form method="post" onsubmit="return confirm('Revert and undo these changes now?');" class="ms-3">
            <input type="hidden" name="action" value="quick_undo">
            <button type="submit" class="btn btn-sm btn-outline-dark" style="font-size:12px;">
                <i class="bi bi-arrow-counterclockwise me-1"></i> Undo this edit
            </button>
        </form>
        <?php endif; ?>
    </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<form method="post" enctype="multipart/form-data">
    <!-- Text Content Section -->
    <div class="corp-card">
        <div class="corp-card-header">
            <h3 class="corp-card-title"><i class="bi bi-text-paragraph text-primary"></i> Text Content</h3>
            <span class="text-muted" style="font-size:13px;"><?= count($pd['text'] ?? []) ?> field(s)</span>
        </div>
        <div class="corp-card-body">
            <div class="row g-3">
                <?php foreach ($pd['text'] ?? [] as $item): ?>
                <div class="col-md-6">
                    <label class="form-label-corporate">
                        <span class="badge bg-light text-dark me-1">&lt;<?= e($item['tag']) ?>&gt;</span>
                        <?= e($item['key']) ?>
                    </label>
                    <textarea name="text[<?= e($item['key']) ?>]" class="form-control form-control-corporate" rows="3"><?= e($item['value']) ?></textarea>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

    <!-- Images Section -->
    <?php if (!empty($pd['images'])): ?>
    <div class="corp-card">
        <div class="corp-card-header d-flex justify-content-between align-items-center">
            <h3 class="corp-card-title"><i class="bi bi-images text-success"></i> Images</h3>
            <div class="d-flex gap-2 align-items-center">
                <span class="text-muted" style="font-size:13px;"><?= count($pd['images'] ?? []) ?> image(s)</span>
                <a href="gallery.php" target="_blank" class="btn btn-sm btn-outline-corporate ms-2"><i class="bi bi-images me-1"></i> Open Media Gallery</a>
            </div>
        </div>
        <div class="corp-card-body">
            <div class="row g-3">
                <?php foreach ($pd['images'] ?? [] as $item): ?>
                <div class="col-md-4 col-lg-3">
                    <div style="border:1px solid var(--corp-border);border-radius:var(--radius-md);padding:12px;">
                        <img src="<?= e(preg_match('#^https?://#i', $item['src']) ? $item['src'] : '/' . ltrim($item['src'], '/')) ?>" 
                             style="width:100%;height:130px;object-fit:cover;border-radius:8px;background:#f1f5f9;" 
                             onerror="this.src='/assets/images/Logo_Four.png'" alt="">
                        <small class="text-muted d-block mt-2" style="word-break:break-all;"><?= e($item['key']) ?></small>
                        <label class="form-label-corporate mt-2">Alt text</label>
                        <input name="alt[<?= e($item['key']) ?>]" value="<?= e($item['alt']) ?>" class="form-control form-control-corporate" style="font-size:12px;">
                        <label class="form-label-corporate mt-2">Replace image</label>
                        <input type="file" name="image[<?= e($item['key']) ?>]" accept="image/*" class="form-control form-control-corporate" style="font-size:12px;">
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <?php endif; ?>

    <div class="d-flex gap-2 mb-4">
        <button type="submit" class="btn btn-primary-corporate"><i class="bi bi-check-lg me-1"></i> Save Changes</button>
        <a href="pages.php" class="btn btn-outline-corporate">Cancel</a>
    </div>
</form>

<?php else: ?>
<!-- Pages List & Overview -->
<div class="page-title-box">
    <div>
        <h1 class="page-title">Website Content Manager</h1>
        <p class="page-subtitle">Create new pages, edit content, images, and manage real-time synchronization with website.</p>
    </div>
    <div class="d-flex gap-2">
        <button type="button" class="btn btn-primary" style="background:#2563eb;font-weight:700;font-size:13.5px;" data-bs-toggle="modal" data-bs-target="#addNewPageModal">
            <i class="bi bi-plus-circle me-1"></i> Add New Page
        </button>
        <a href="gallery.php" class="btn btn-outline-corporate">
            <i class="bi bi-images me-1"></i> Media Gallery
        </a>
        <?php if (!empty($backups)): ?>
        <form method="post" onsubmit="return confirm('Undo the last modification and restore the previous state immediately?');" style="display:inline;">
            <input type="hidden" name="action" value="quick_undo">
            <button type="submit" class="btn btn-warning" style="font-weight:600;font-size:13px;color:#78350f;">
                <i class="bi bi-arrow-counterclockwise me-1"></i> 1-Click Undo
            </button>
        </form>
        <button class="btn btn-outline-corporate" data-bs-toggle="modal" data-bs-target="#backupHistoryModal">
            <i class="bi bi-clock-history me-1"></i> Version History (<?= count($backups) ?>)
        </button>
        <?php endif; ?>
    </div>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php 
        if ($msg === 'created') echo 'New website page created successfully and connected to live frontend!';
        elseif ($msg === 'deleted') echo 'Custom page deleted successfully.';
        elseif ($msg === 'slug_exists') echo 'Error: A page with this URL slug already exists. Please choose another slug.';
        elseif ($msg === 'create_err') echo 'Error: Title and Slug cannot be empty.';
        elseif ($msg === 'restored') echo 'Previous content backup has been restored successfully!';
        elseif ($msg === 'undone') echo 'Last update was undone! Your previous version is active.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<!-- Central Media Gallery Banner Card -->
<div class="corp-card mb-4" style="background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%); color: #fff;">
    <div class="corp-card-body p-4 d-flex flex-wrap align-items-center justify-content-between gap-3">
        <div>
            <h3 style="font-size:20px;font-weight:700;margin:0 0 6px;"><i class="bi bi-images me-2"></i> Central Media Gallery</h3>
            <p style="margin:0;opacity:0.9;font-size:13.5px;">Upload and organize all site banners, property photos, and corporate media with 1-click copy path.</p>
        </div>
        <div class="d-flex gap-2">
            <a href="gallery.php" class="btn btn-light fw-bold px-3 py-2" style="color:var(--corp-primary);font-size:13.5px;">
                <i class="bi bi-folder2-open me-1"></i> Open Gallery
            </a>
            <a href="gallery.php?action=upload" class="btn btn-outline-light fw-bold px-3 py-2" style="font-size:13.5px;" data-bs-toggle="modal" data-bs-target="#quickUploadModal">
                <i class="bi bi-cloud-arrow-up me-1"></i> Quick Upload
            </a>
        </div>
    </div>
</div>

<!-- Primary Website Pages Grid -->
<div class="d-flex align-items-center justify-content-between mb-3">
    <h4 class="fw-bold" style="font-size:17px;color:#0f172a;"><i class="bi bi-layers-fill text-primary me-2"></i> Core System Pages</h4>
</div>
<div class="row g-4 mb-5">
    <?php
    $corePagesList = ['index', 'services', 'project', 'about', 'contact', 'news'];
    $pageIcons = [
        'index' => 'bi-house-door-fill',
        'about' => 'bi-info-circle-fill',
        'services' => 'bi-gear-fill',
        'project' => 'bi-buildings',
        'contact' => 'bi-envelope-fill',
        'news' => 'bi-newspaper'
    ];
    $pageColors = [
        'index' => '#2563eb',
        'about' => '#7c3aed',
        'services' => '#059669',
        'project' => '#d97706',
        'contact' => '#dc2626',
        'news' => '#0891b2'
    ];
    foreach ($corePagesList as $page):
        if (!isset($pages[$page])) continue;
        $pd = $pages[$page];
        $icon = $pageIcons[$page] ?? 'bi-file-earmark';
        $color = $pageColors[$page] ?? '#64748b';
        $textCount = count($pd['text'] ?? []);
        $imgCount = count($pd['images'] ?? []);
    ?>
    <div class="col-md-6 col-lg-4">
        <a href="pages.php?page=<?= e($page) ?>" class="text-decoration-none">
            <div class="corp-card h-100" style="transition:transform 0.2s,box-shadow 0.2s;cursor:pointer;">
                <div class="corp-card-body text-center py-4">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width:56px;height:56px;background:<?= $color ?>15;color:<?= $color ?>;font-size:24px;">
                        <i class="bi <?= $icon ?>"></i>
                    </div>
                    <h4 style="font-weight:700;color:var(--corp-dark);margin:0 0 8px;"><?= e(page_label($page)) ?></h4>
                    <p class="text-muted mb-3" style="font-size:13px;">
                        <?= $textCount ?> text fields · <?= $imgCount ?> images
                    </p>
                    <span class="btn btn-sm btn-outline-corporate">Edit Content <i class="bi bi-arrow-right ms-1"></i></span>
                </div>
            </div>
        </a>
    </div>
    <?php endforeach; ?>
</div>

<!-- Custom Created Pages & Subpages Section -->
<div class="d-flex align-items-center justify-content-between mb-3">
    <div>
        <h4 class="fw-bold" style="font-size:17px;color:#0f172a;"><i class="bi bi-file-earmark-plus-fill text-success me-2"></i> Custom & Sub Pages</h4>
        <p class="text-muted mb-0" style="font-size:13px;">Pages dynamically created from admin portal with live frontend routing.</p>
    </div>
    <button type="button" class="btn btn-sm btn-outline-primary fw-bold" data-bs-toggle="modal" data-bs-target="#addNewPageModal">
        <i class="bi bi-plus-lg me-1"></i> Create Another Page
    </button>
</div>

<?php if (empty($customPages)): ?>
<div class="corp-card text-center py-5 mb-4" style="background:#f8fafc;border:2px dashed #e2e8f0;">
    <div class="text-muted mb-3"><i class="bi bi-file-earmark-plus" style="font-size:42px;color:#94a3b8;"></i></div>
    <h5 class="fw-bold text-dark">No custom pages added yet</h5>
    <p class="text-muted" style="max-width:440px;margin:0 auto 16px;font-size:13.5px;">You can easily add new landing pages, career pages, terms or project sub-pages directly from here.</p>
    <button type="button" class="btn btn-primary-corporate" data-bs-toggle="modal" data-bs-target="#addNewPageModal">
        <i class="bi bi-plus-circle me-1"></i> Create Your First Page
    </button>
</div>
<?php else: ?>
<div class="row g-4 mb-4">
    <?php foreach ($customPages as $slug => $cp): ?>
    <div class="col-md-6 col-lg-4">
        <div class="corp-card h-100 position-relative">
            <div class="corp-card-body p-4 d-flex flex-column justify-content-between">
                <div>
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <span class="badge bg-success-subtle text-success border border-success-subtle fw-semibold" style="font-size:11px;">
                            <i class="bi bi-check-circle me-1"></i> Active Live Page
                        </span>
                        <?php if (!empty($cp['show_in_menu'])): ?>
                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle fw-semibold" style="font-size:11px;">
                            <i class="bi bi-menu-button-wide me-1"></i> In Navbar
                        </span>
                        <?php endif; ?>
                    </div>
                    <h4 class="fw-bold text-dark mb-1"><?= e($cp['title'] ?? ucfirst($slug)) ?></h4>
                    <p class="text-muted mb-2" style="font-size:12px;">
                        <i class="bi bi-link-45deg"></i> <code>/<?= e($slug) ?>.php</code>
                    </p>
                    <p class="text-secondary" style="font-size:13px;line-height:1.5;">
                        <?= e($cp['subtitle'] ?: 'Custom corporate content page.') ?>
                    </p>
                </div>
                <div class="d-flex align-items-center justify-content-between pt-3 border-top mt-3">
                    <div class="d-flex gap-2">
                        <a href="pages.php?page=<?= e($slug) ?>" class="btn btn-sm btn-outline-corporate">
                            <i class="bi bi-pencil-square me-1"></i> Edit
                        </a>
                        <a href="/<?= e($slug) ?>.php" target="_blank" class="btn btn-sm btn-outline-corporate">
                            <i class="bi bi-box-arrow-up-right me-1"></i> View
                        </a>
                    </div>
                    <form method="post" onsubmit="return confirm('Delete page &quot;<?= e($cp['title']) ?>&quot;? This will remove the page from the website.');" style="display:inline;">
                        <input type="hidden" name="action" value="delete_custom_page">
                        <input type="hidden" name="slug" value="<?= e($slug) ?>">
                        <button type="submit" class="btn btn-sm btn-danger-corporate" title="Delete Page">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php endforeach; ?>
</div>
<?php endif; ?>

<!-- ADD NEW PAGE MODAL -->
<div class="modal fade" id="addNewPageModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <form method="post" enctype="multipart/form-data" class="modal-content" style="border-radius:var(--radius-lg);">
            <input type="hidden" name="action" value="create_page">
            <div class="modal-header border-0 pb-0">
                <div>
                    <h5 class="modal-title fw-bold"><i class="bi bi-file-earmark-plus text-primary me-2"></i> Add New Website Page / Subpage</h5>
                    <p class="text-muted mb-0" style="font-size:13px;">Create a new page with automatic URL generation and CMS content management.</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-md-7">
                        <label class="form-label-corporate">Page Title *</label>
                        <input type="text" name="title" id="newPageTitle" class="form-control form-control-corporate" placeholder="e.g. Careers, Quality Policy, Landowner Partnership" required>
                    </div>
                    <div class="col-md-5">
                        <label class="form-label-corporate">URL Slug (Address) *</label>
                        <div class="input-group">
                            <span class="input-group-text" style="font-size:12px;background:#f8fafc;color:#64748b;">/</span>
                            <input type="text" name="slug" id="newPageSlug" class="form-control form-control-corporate" placeholder="careers" required>
                            <span class="input-group-text" style="font-size:12px;background:#f8fafc;color:#64748b;">.php</span>
                        </div>
                    </div>
                    <div class="col-12">
                        <label class="form-label-corporate">Subtitle / Page Intro</label>
                        <input type="text" name="subtitle" class="form-control form-control-corporate" placeholder="Brief 1-line introduction shown below the heading">
                    </div>
                    <div class="col-12">
                        <label class="form-label-corporate">Main Content (Text / Paragraphs)</label>
                        <textarea name="content" class="form-control form-control-corporate" rows="6" placeholder="Write page content, descriptions, requirements, or corporate overview..."></textarea>
                    </div>
                    <div class="col-md-7">
                        <label class="form-label-corporate">Featured Banner / Body Image (Optional)</label>
                        <input type="file" name="featured_image" class="form-control form-control-corporate" accept="image/*">
                    </div>
                    <div class="col-md-5 d-flex align-items-center">
                        <div class="form-check mt-3">
                            <input class="form-check-input" type="checkbox" name="show_in_menu" id="showInMenuCheck" value="1" checked>
                            <label class="form-check-label fw-bold text-dark" for="showInMenuCheck" style="font-size:13.5px;">
                                Show in Main Navbar Menu
                            </label>
                            <small class="text-muted d-block" style="font-size:11px;">Automatically adds this page link to site navigation</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" style="background:#2563eb;font-weight:700;">
                    <i class="bi bi-check-circle me-1"></i> Create Page & Publish
                </button>
            </div>
        </form>
    </div>
</div>

<script>
// Auto generate slug from title
document.getElementById('newPageTitle').addEventListener('input', function() {
    const slugInput = document.getElementById('newPageSlug');
    if (!slugInput.dataset.manual) {
        slugInput.value = this.value.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
    }
});
document.getElementById('newPageSlug').addEventListener('input', function() {
    this.dataset.manual = 'true';
});
</script>

<!-- Version History / Rollback Modal -->
<div class="modal fade" id="backupHistoryModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="border-radius:var(--radius-lg);">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold"><i class="bi bi-clock-history text-primary me-2"></i> Content Version History & Rollback</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p class="text-muted" style="font-size:13px;">
                    Whenever you save changes, a snapshot backup is automatically stored here. If any update doesn't look right, you can restore to any previous snapshot with 1 click!
                </p>
                <div class="table-responsive">
                    <table class="table-corporate">
                        <thead>
                            <tr>
                                <th>Saved Timestamp</th>
                                <th>Backup File</th>
                                <th>Size</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($backups as $b): ?>
                            <tr>
                                <td><i class="bi bi-calendar-event me-1 text-muted"></i> <strong><?= e($b['time']) ?></strong></td>
                                <td style="font-size:12px;color:#64748b;"><?= e($b['file']) ?></td>
                                <td style="font-size:12px;"><?= e($b['size']) ?></td>
                                <td>
                                    <form method="post" onsubmit="return confirm('Restore this version? All website content will immediately revert to this saved state.');">
                                        <input type="hidden" name="action" value="rollback">
                                        <input type="hidden" name="backup_file" value="<?= e($b['file']) ?>">
                                        <button type="submit" class="btn btn-sm btn-outline-corporate text-primary">
                                            <i class="bi bi-arrow-counterclockwise me-1"></i> Restore This
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Quick Upload Modal -->
<div class="modal fade" id="quickUploadModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" action="gallery.php" enctype="multipart/form-data" class="modal-content" style="border-radius:var(--radius-lg);">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Quick Image Upload</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="action" value="upload">
                <div class="mb-3">
                    <label class="form-label-corporate">Select Image *</label>
                    <input type="file" name="image" class="form-control form-control-corporate" accept="image/*" required>
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Title</label>
                    <input type="text" name="title" class="form-control form-control-corporate" placeholder="Image description">
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Tag</label>
                    <select name="tag" class="form-select form-select-corporate">
                        <option value="General">General</option>
                        <option value="Residential">Residential</option>
                        <option value="Commercial">Commercial</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary-corporate">Upload to Gallery</button>
            </div>
        </form>
    </div>
</div>

<?php endif; ?>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
