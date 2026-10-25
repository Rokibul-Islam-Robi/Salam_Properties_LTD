<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'gallery';
$pageTitle = 'Media Gallery';
$data = cms_data();

// Helper to gather all existing media images from project
function get_all_media_images($data) {
    $images = [];
    $seen = [];

    // Custom uploaded gallery items in json
    if (!empty($data['gallery_items'])) {
        foreach ($data['gallery_items'] as $item) {
            $src = $item['src'] ?? '';
            if ($src && !isset($seen[$src])) {
                $seen[$src] = true;
                $images[] = [
                    'id' => $item['id'] ?? uniqid(),
                    'title' => $item['title'] ?? basename($src),
                    'src' => $src,
                    'tag' => $item['tag'] ?? 'General',
                    'date' => $item['date'] ?? date('Y-m-d'),
                    'is_custom' => true
                ];
            }
        }
    }

    // Images from pages
    foreach ($data['pages'] ?? [] as $pageName => $pd) {
        foreach ($pd['images'] ?? [] as $img) {
            $src = $img['src'] ?? '';
            if ($src && !isset($seen[$src])) {
                $seen[$src] = true;
                $images[] = [
                    'id' => 'page_' . md5($src),
                    'title' => $img['alt'] ?? basename($src),
                    'src' => $src,
                    'tag' => 'Page: ' . page_label($pageName),
                    'date' => 'System',
                    'is_custom' => false
                ];
            }
        }
    }

    // Images from properties
    foreach ($data['properties'] ?? [] as $prop) {
        $src = $prop['image'] ?? '';
        if ($src && !isset($seen[$src])) {
            $seen[$src] = true;
            $images[] = [
                'id' => 'prop_' . ($prop['id'] ?? 0),
                'title' => $prop['title'] ?? basename($src),
                'src' => $src,
                'tag' => 'Property',
                'date' => 'System',
                'is_custom' => false
            ];
        }
    }

    // Physical files in uploads folder
    $uploadFiles = glob(UPLOAD_DIR . '/*.*');
    if ($uploadFiles) {
        foreach ($uploadFiles as $filePath) {
            $rel = 'uploads/' . basename($filePath);
            if (!isset($seen[$rel]) && !str_ends_with($rel, '.htaccess')) {
                $seen[$rel] = true;
                $images[] = [
                    'id' => 'up_' . md5($rel),
                    'title' => basename($filePath),
                    'src' => $rel,
                    'tag' => 'Uploads',
                    'date' => date('Y-m-d', filemtime($filePath)),
                    'is_custom' => false
                ];
            }
        }
    }

    return $images;
}

if (!isset($data['gallery_items'])) {
    $data['gallery_items'] = [];
}

// Actions (Upload, Edit, Delete)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'upload') {
        $title = trim($_POST['title'] ?? '');
        $tag = trim($_POST['tag'] ?? 'General');

        if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $name = $_FILES['image']['name'];
            $tmp = $_FILES['image']['tmp_name'];
            $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));

            if (in_array($ext, ['jpg', 'jpeg', 'png', 'webp', 'gif', 'svg'])) {
                $safe = preg_replace('/[^a-zA-Z0-9._-]/', '-', pathinfo($name, PATHINFO_FILENAME));
                $dest = 'uploads/gallery-' . substr(sha1(microtime(true)), 0, 10) . '-' . $safe . '.' . $ext;

                if (move_uploaded_file($tmp, BASE_PATH . '/' . $dest)) {
                    $maxId = 0;
                    foreach ($data['gallery_items'] as $g) {
                        if (($g['id'] ?? 0) > $maxId) $maxId = $g['id'];
                    }
                    $data['gallery_items'][] = [
                        'id' => $maxId + 1,
                        'title' => $title !== '' ? $title : $name,
                        'tag' => $tag,
                        'src' => $dest,
                        'date' => date('Y-m-d H:i')
                    ];
                    cms_save($data);
                    header('Location: gallery.php?msg=uploaded');
                    exit;
                }
            }
        }
    } elseif ($action === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $title = trim($_POST['title'] ?? '');
        $tag = trim($_POST['tag'] ?? 'General');

        foreach ($data['gallery_items'] as &$item) {
            if (($item['id'] ?? 0) === $id) {
                $item['title'] = $title;
                $item['tag'] = $tag;
                break;
            }
        }
        unset($item);
        cms_save($data);
        header('Location: gallery.php?msg=updated');
        exit;
    } elseif ($action === 'delete') {
        $src = $_POST['src'] ?? '';
        // If in gallery_items, remove
        $data['gallery_items'] = array_values(array_filter($data['gallery_items'] ?? [], fn($i) => ($i['src'] ?? '') !== $src));
        cms_save($data);

        // If file exists in uploads, optionally delete
        if (str_starts_with($src, 'uploads/') && file_exists(BASE_PATH . '/' . $src)) {
            @unlink(BASE_PATH . '/' . $src);
        }
        header('Location: gallery.php?msg=deleted');
        exit;
    }
}

$allImages = get_all_media_images($data);
$tags = ['All', 'General', 'Page', 'Property', 'Uploads'];

// Tag filter
$filterTag = $_GET['tag'] ?? 'All';
$search = trim($_GET['q'] ?? '');

$filteredImages = $allImages;
if ($filterTag !== 'All') {
    $filteredImages = array_filter($filteredImages, fn($img) => stripos($img['tag'], $filterTag) !== false);
}
if ($search !== '') {
    $filteredImages = array_filter($filteredImages, fn($img) => stripos($img['title'], $search) !== false || stripos($img['src'], $search) !== false);
}
$filteredImages = array_values($filteredImages);

$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<div class="page-title-box">
    <div>
        <h1 class="page-title">Media Gallery</h1>
        <p class="page-subtitle">Manage, preview, and upload high-resolution images for Salam Properties.</p>
    </div>
    <button class="btn btn-primary-corporate" data-bs-toggle="modal" data-bs-target="#uploadMediaModal">
        <i class="bi bi-cloud-arrow-up-fill me-1"></i> Upload Image
    </button>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php
        if ($msg === 'uploaded') echo 'New image uploaded successfully to media gallery.';
        elseif ($msg === 'updated') echo 'Image information updated.';
        elseif ($msg === 'deleted') echo 'Image removed from gallery.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<!-- Filter & Search Toolbar -->
<div class="corp-card mb-4">
    <div class="corp-card-body py-3">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
            <div class="d-flex flex-wrap align-items-center gap-2">
                <span class="text-muted fw-bold" style="font-size:12.5px;">FILTER:</span>
                <a href="gallery.php?tag=All" class="btn btn-sm <?= $filterTag === 'All' ? 'btn-primary-corporate' : 'btn-outline-corporate' ?>">All (<?= count($allImages) ?>)</a>
                <a href="gallery.php?tag=General" class="btn btn-sm <?= $filterTag === 'General' ? 'btn-primary-corporate' : 'btn-outline-corporate' ?>">Gallery Items</a>
                <a href="gallery.php?tag=Page" class="btn btn-sm <?= $filterTag === 'Page' ? 'btn-primary-corporate' : 'btn-outline-corporate' ?>">Website Pages</a>
                <a href="gallery.php?tag=Property" class="btn btn-sm <?= $filterTag === 'Property' ? 'btn-primary-corporate' : 'btn-outline-corporate' ?>">Properties</a>
            </div>

            <form method="get" class="d-flex gap-2">
                <input type="hidden" name="tag" value="<?= e($filterTag) ?>">
                <input type="text" name="q" class="form-control form-control-corporate" style="width:220px;" placeholder="Search images..." value="<?= e($search) ?>">
                <button class="btn btn-outline-corporate"><i class="bi bi-search"></i></button>
            </form>
        </div>
    </div>
</div>

<!-- Image Grid -->
<div class="corp-card">
    <div class="corp-card-header">
        <h3 class="corp-card-title"><i class="bi bi-images text-primary"></i> Image Library (<?= count($filteredImages) ?>)</h3>
        <span class="text-muted" style="font-size:13px;">Click on any image to copy its link or view full size</span>
    </div>
    <div class="corp-card-body">
        <?php if (empty($filteredImages)): ?>
            <div class="text-center text-muted py-5">
                <i class="bi bi-images" style="font-size:42px;color:#cbd5e1;"></i>
                <p class="mt-3">No images match your search or filter.</p>
            </div>
        <?php else: ?>
            <div class="row g-4">
                <?php foreach ($filteredImages as $idx => $img): 
                    $src = $img['src'];
                    $displaySrc = preg_match('#^https?://#i', $src) ? $src : '../' . $src;
                ?>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="gallery-card" style="border:1px solid var(--corp-border);border-radius:var(--radius-md);overflow:hidden;background:#fff;transition:transform 0.2s,box-shadow 0.2s;">
                        <div style="position:relative;height:160px;background:#f8fafc;overflow:hidden;cursor:pointer;" onclick="previewImage('<?= e($displaySrc) ?>', '<?= e($img['title']) ?>')">
                            <img src="<?= e($displaySrc) ?>" alt="<?= e($img['title']) ?>" style="width:100%;height:100%;object-fit:cover;" onerror="this.src='../assets/images/Logo_Four.png'">
                            <span class="badge bg-dark" style="position:absolute;top:8px;left:8px;font-size:10px;opacity:0.85;"><?= e($img['tag']) ?></span>
                        </div>
                        <div style="padding:12px;">
                            <strong style="font-size:13px;display:block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" title="<?= e($img['title']) ?>">
                                <?= e($img['title']) ?>
                            </strong>
                            <small class="text-muted d-block mt-1" style="font-size:11px;word-break:break-all;"><?= e($img['src']) ?></small>
                            <div class="d-flex align-items-center justify-content-between mt-3 pt-2 border-top" style="border-color:#f1f5f9 !important;">
                                <button type="button" class="btn btn-sm btn-outline-corporate py-1 px-2" style="font-size:11px;" onclick="copyToClipboard('<?= e($img['src']) ?>', this)">
                                    <i class="bi bi-clipboard me-1"></i> Copy Path
                                </button>
                                <div class="d-flex gap-1">
                                    <button type="button" class="btn btn-sm btn-outline-corporate py-1 px-2" onclick="previewImage('<?= e($displaySrc) ?>', '<?= e($img['title']) ?>')" title="Zoom">
                                        <i class="bi bi-arrows-fullscreen"></i>
                                    </button>
                                    <?php if (!empty($img['is_custom'])): ?>
                                    <form method="post" style="display:inline;" onsubmit="return confirm('Delete this image from gallery?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="src" value="<?= e($img['src']) ?>">
                                        <button class="btn btn-sm btn-danger-corporate py-1 px-2" title="Delete"><i class="bi bi-trash"></i></button>
                                    </form>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>
    </div>
</div>

<!-- Upload Modal -->
<div class="modal fade" id="uploadMediaModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" enctype="multipart/form-data" class="modal-content" style="border-radius:var(--radius-lg);">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Upload to Media Gallery</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="action" value="upload">
                <div class="mb-3">
                    <label class="form-label-corporate">Select Image File *</label>
                    <input type="file" name="image" class="form-control form-control-corporate" accept="image/*" required>
                    <small class="text-muted">Supported formats: JPG, PNG, WEBP, GIF, SVG</small>
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Image Title / Description</label>
                    <input type="text" name="title" class="form-control form-control-corporate" placeholder="e.g. Modern Architecture Exterior">
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Category / Tag</label>
                    <select name="tag" class="form-select form-select-corporate">
                        <option value="General">General</option>
                        <option value="Residential">Residential</option>
                        <option value="Commercial">Commercial</option>
                        <option value="Interior">Interior</option>
                        <option value="Exterior">Exterior</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary-corporate"><i class="bi bi-cloud-arrow-up-fill me-1"></i> Upload</button>
            </div>
        </form>
    </div>
</div>

<!-- Lightbox Modal -->
<div class="modal fade" id="imagePreviewModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content" style="border-radius:var(--radius-lg);overflow:hidden;">
            <div class="modal-header">
                <h5 class="modal-title" id="previewTitle" style="font-size:15px;font-weight:700;"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-0 text-center bg-dark">
                <img id="previewImg" src="" style="max-width:100%;max-height:75vh;object-fit:contain;" alt="">
            </div>
        </div>
    </div>
</div>

<script>
function copyToClipboard(text, btn) {
    navigator.clipboard.writeText(text).then(() => {
        const orig = btn.innerHTML;
        btn.innerHTML = '<i class="bi bi-check2 me-1"></i> Copied!';
        btn.classList.add('btn-success-corporate');
        btn.classList.remove('btn-outline-corporate');
        setTimeout(() => {
            btn.innerHTML = orig;
            btn.classList.remove('btn-success-corporate');
            btn.classList.add('btn-outline-corporate');
        }, 2000);
    });
}

function previewImage(src, title) {
    document.getElementById('previewImg').src = src;
    document.getElementById('previewTitle').innerText = title;
    new bootstrap.Modal(document.getElementById('imagePreviewModal')).show();
}
</script>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
