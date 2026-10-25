<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'properties';
$pageTitle = 'Properties';
$data = cms_data();

if (!isset($data['properties'])) $data['properties'] = [];
if (!isset($data['property_types'])) $data['property_types'] = [];
if (!isset($data['locations'])) $data['locations'] = [];

$typeNames = array_column($data['property_types'], 'name');
$locNames = array_column($data['locations'], 'name');

// Handle Actions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'add' || $action === 'edit') {
        $id = ($action === 'edit') ? (int)($_POST['id'] ?? 0) : 0;
        $propData = [
            'title' => trim($_POST['title'] ?? ''),
            'type' => trim($_POST['type'] ?? ''),
            'location' => trim($_POST['location'] ?? ''),
            'price' => trim($_POST['price'] ?? ''),
            'beds' => (int)($_POST['beds'] ?? 0),
            'baths' => (int)($_POST['baths'] ?? 0),
            'area' => trim($_POST['area'] ?? ''),
            'description' => trim($_POST['description'] ?? ''),
            'featured' => isset($_POST['featured']) ? 1 : 0,
            'status' => $_POST['status'] ?? 'active'
        ];

        // Handle image upload
        if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $name = $_FILES['image']['name'];
            $tmp = $_FILES['image']['tmp_name'];
            $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
            if (in_array($ext, ['jpg','jpeg','png','webp','gif','svg'])) {
                $safe = preg_replace('/[^a-zA-Z0-9._-]/', '-', pathinfo($name, PATHINFO_FILENAME));
                $dest = 'uploads/property-' . substr(sha1(microtime(true)), 0, 10) . '-' . $safe . '.' . $ext;
                if (move_uploaded_file($tmp, BASE_PATH . '/' . $dest)) {
                    $propData['image'] = $dest;
                }
            }
        }

        if ($action === 'add') {
            $maxId = 0;
            foreach ($data['properties'] as $p) { if ($p['id'] > $maxId) $maxId = $p['id']; }
            $propData['id'] = $maxId + 1;
            if (empty($propData['image'])) $propData['image'] = 'assets/images/project_9.jpg';
            $data['properties'][] = $propData;
        } else {
            foreach ($data['properties'] as &$p) {
                if ($p['id'] === $id) {
                    if (empty($propData['image'])) $propData['image'] = $p['image'] ?? 'assets/images/project_9.jpg';
                    $propData['id'] = $id;
                    $p = $propData;
                    break;
                }
            }
            unset($p);
        }
        cms_save($data);
        header('Location: properties.php?msg=' . ($action === 'add' ? 'added' : 'updated')); exit;
    } elseif ($action === 'toggle') {
        $id = (int)($_POST['id'] ?? 0);
        foreach ($data['properties'] as &$p) {
            if ($p['id'] === $id) {
                $p['status'] = ($p['status'] ?? 'active') === 'active' ? 'inactive' : 'active';
                break;
            }
        }
        unset($p);
        cms_save($data);
        header('Location: properties.php?msg=toggled'); exit;
    } elseif ($action === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        $data['properties'] = array_values(array_filter($data['properties'], fn($p) => $p['id'] !== $id));
        cms_save($data);
        header('Location: properties.php?msg=deleted'); exit;
    }
}

// Filter
$filterType = $_GET['type'] ?? '';
$filterLoc = $_GET['location'] ?? '';
$filterStatus = $_GET['status'] ?? '';
$filterFeatured = $_GET['featured'] ?? '';
$search = trim($_GET['q'] ?? '');

$filtered = $data['properties'];
if ($filterType) $filtered = array_filter($filtered, fn($p) => ($p['type'] ?? '') === $filterType);
if ($filterLoc) $filtered = array_filter($filtered, fn($p) => ($p['location'] ?? '') === $filterLoc);
if ($filterStatus) $filtered = array_filter($filtered, fn($p) => ($p['status'] ?? 'active') === $filterStatus);
if ($filterFeatured !== '') $filtered = array_filter($filtered, fn($p) => !empty($p['featured']) == ($filterFeatured == '1'));
if ($search) $filtered = array_filter($filtered, fn($p) => stripos($p['title'] ?? '', $search) !== false);
$filtered = array_values($filtered);

$showForm = ($_GET['action'] ?? '') === 'add' || ($_GET['action'] ?? '') === 'edit';
$editProp = null;
if (($_GET['action'] ?? '') === 'edit' && isset($_GET['id'])) {
    $editId = (int)$_GET['id'];
    foreach ($data['properties'] as $p) {
        if ($p['id'] === $editId) { $editProp = $p; break; }
    }
}

$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<?php if ($showForm): ?>
<!-- Add/Edit Property Form -->
<div class="page-title-box">
    <div>
        <h1 class="page-title"><?= $editProp ? 'Edit Property' : 'Add New Property' ?></h1>
        <p class="page-subtitle">Fill in the details below to <?= $editProp ? 'update' : 'create' ?> a property listing.</p>
    </div>
    <a href="properties.php" class="btn btn-outline-corporate"><i class="bi bi-arrow-left me-1"></i> Back to List</a>
</div>

<div class="corp-card">
    <div class="corp-card-body">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="<?= $editProp ? 'edit' : 'add' ?>">
            <?php if ($editProp): ?><input type="hidden" name="id" value="<?= $editProp['id'] ?>"><?php endif; ?>

            <div class="row g-3">
                <div class="col-md-8">
                    <label class="form-label-corporate">Property Title *</label>
                    <input type="text" name="title" class="form-control form-control-corporate" value="<?= e($editProp['title'] ?? '') ?>" placeholder="e.g. Salam Luxury Residency" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label-corporate">Price *</label>
                    <input type="text" name="price" class="form-control form-control-corporate" value="<?= e($editProp['price'] ?? '') ?>" placeholder="e.g. ৳ 3.5 Crore" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label-corporate">Property Type</label>
                    <select name="type" class="form-select form-select-corporate">
                        <option value="">Select Type</option>
                        <?php foreach ($typeNames as $tn): ?>
                        <option value="<?= e($tn) ?>" <?= ($editProp['type'] ?? '') === $tn ? 'selected' : '' ?>><?= e($tn) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label-corporate">Location</label>
                    <select name="location" class="form-select form-select-corporate">
                        <option value="">Select Location</option>
                        <?php foreach ($locNames as $ln): ?>
                        <option value="<?= e($ln) ?>" <?= ($editProp['location'] ?? '') === $ln ? 'selected' : '' ?>><?= e($ln) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label-corporate">Area / Size</label>
                    <input type="text" name="area" class="form-control form-control-corporate" value="<?= e($editProp['area'] ?? '') ?>" placeholder="e.g. 3,200 sqft">
                </div>
                <div class="col-md-3">
                    <label class="form-label-corporate">Bedrooms</label>
                    <input type="number" name="beds" class="form-control form-control-corporate" value="<?= e($editProp['beds'] ?? 0) ?>" min="0">
                </div>
                <div class="col-md-3">
                    <label class="form-label-corporate">Bathrooms</label>
                    <input type="number" name="baths" class="form-control form-control-corporate" value="<?= e($editProp['baths'] ?? 0) ?>" min="0">
                </div>
                <div class="col-md-3">
                    <label class="form-label-corporate">Status</label>
                    <select name="status" class="form-select form-select-corporate">
                        <option value="active" <?= ($editProp['status'] ?? 'active') === 'active' ? 'selected' : '' ?>>Active</option>
                        <option value="inactive" <?= ($editProp['status'] ?? '') === 'inactive' ? 'selected' : '' ?>>Inactive</option>
                        <option value="sold" <?= ($editProp['status'] ?? '') === 'sold' ? 'selected' : '' ?>>Sold</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label-corporate">Featured</label>
                    <div class="form-check mt-2">
                        <input type="checkbox" class="form-check-input" name="featured" id="featuredChk" <?= !empty($editProp['featured']) ? 'checked' : '' ?>>
                        <label class="form-check-label" for="featuredChk">Mark as Featured</label>
                    </div>
                </div>
                <div class="col-12">
                    <label class="form-label-corporate">Description</label>
                    <textarea name="description" class="form-control form-control-corporate" rows="4" placeholder="Enter property description..."><?= e($editProp['description'] ?? '') ?></textarea>
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate">Property Image</label>
                    <input type="file" name="image" class="form-control form-control-corporate" accept="image/*">
                    <?php if ($editProp && !empty($editProp['image'])): ?>
                    <div class="mt-2">
                        <img src="/<?= e(ltrim($editProp['image'], '/')) ?>" style="width:120px;height:80px;object-fit:cover;border-radius:8px;border:1px solid var(--corp-border);">
                        <small class="text-muted d-block mt-1">Current image</small>
                    </div>
                    <?php endif; ?>
                </div>
            </div>

            <div class="mt-4 d-flex gap-2">
                <button type="submit" class="btn btn-primary-corporate"><i class="bi bi-check-lg me-1"></i> <?= $editProp ? 'Update Property' : 'Add Property' ?></button>
                <a href="properties.php" class="btn btn-outline-corporate">Cancel</a>
            </div>
        </form>
    </div>
</div>

<?php else: ?>
<!-- Properties List -->
<div class="page-title-box">
    <div>
        <h1 class="page-title">Properties</h1>
        <p class="page-subtitle">Manage your real estate property listings.</p>
    </div>
    <a href="properties.php?action=add" class="btn btn-primary-corporate">
        <i class="bi bi-plus-lg me-1"></i> Add Property
    </a>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php
        if ($msg === 'added') echo 'Property added successfully.';
        elseif ($msg === 'updated') echo 'Property updated.';
        elseif ($msg === 'toggled') echo 'Status updated.';
        elseif ($msg === 'deleted') echo 'Property deleted.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<!-- Filters -->
<div class="corp-card">
    <div class="corp-card-body py-3">
        <form method="get" class="row g-2 align-items-end">
            <div class="col-md-3">
                <label class="form-label-corporate">Type</label>
                <select name="type" class="form-select form-select-corporate">
                    <option value="">All Types</option>
                    <?php foreach ($typeNames as $tn): ?>
                    <option value="<?= e($tn) ?>" <?= $filterType === $tn ? 'selected' : '' ?>><?= e($tn) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label-corporate">Location</label>
                <select name="location" class="form-select form-select-corporate">
                    <option value="">All Locations</option>
                    <?php foreach ($locNames as $ln): ?>
                    <option value="<?= e($ln) ?>" <?= $filterLoc === $ln ? 'selected' : '' ?>><?= e($ln) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label-corporate">Search</label>
                <input type="text" name="q" class="form-control form-control-corporate" value="<?= e($search) ?>" placeholder="Search by title...">
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary-corporate w-100"><i class="bi bi-search me-1"></i> Filter</button>
            </div>
        </form>
    </div>
</div>

<div class="corp-card">
    <div class="corp-card-header">
        <h3 class="corp-card-title"><i class="bi bi-house-door text-primary"></i> Property Listings</h3>
        <span class="text-muted" style="font-size:13px;"><?= count($filtered) ?> result(s)</span>
    </div>
    <div class="corp-card-body p-0">
        <table class="table-corporate">
            <thead>
                <tr>
                    <th>Property</th>
                    <th>Type</th>
                    <th>Location</th>
                    <th>Price</th>
                    <th>Beds/Baths</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($filtered)): ?>
                <tr><td colspan="7" class="text-center text-muted py-4">No properties found.</td></tr>
                <?php else: foreach ($filtered as $prop): ?>
                <tr>
                    <td>
                        <div class="d-flex align-items-center gap-3">
                            <img src="/<?= e(ltrim($prop['image'] ?? 'assets/images/project_9.jpg', '/')) ?>" style="width:50px;height:50px;object-fit:cover;border-radius:8px;" alt="">
                            <div>
                                <strong style="font-size:13px;"><?= e($prop['title'] ?? '') ?></strong>
                                <?php if (!empty($prop['featured'])): ?>
                                <span class="badge bg-warning text-dark ms-1" style="font-size:10px;"><i class="bi bi-star-fill"></i> Featured</span>
                                <?php endif; ?>
                                <div class="text-muted" style="font-size:11.5px;"><?= e($prop['area'] ?? '') ?></div>
                            </div>
                        </div>
                    </td>
                    <td><span class="badge bg-light text-dark"><?= e($prop['type'] ?? '') ?></span></td>
                    <td style="font-size:13px;"><?= e($prop['location'] ?? '') ?></td>
                    <td><strong style="color:var(--corp-accent);"><?= e($prop['price'] ?? '') ?></strong></td>
                    <td style="font-size:13px;">
                        <?php if (($prop['beds'] ?? 0) > 0): ?><i class="bi bi-door-open me-1"></i><?= $prop['beds'] ?> <?php endif; ?>
                        <?php if (($prop['baths'] ?? 0) > 0): ?><i class="bi bi-droplet ms-2 me-1"></i><?= $prop['baths'] ?> <?php endif; ?>
                    </td>
                    <td>
                        <span class="badge-status <?= ($prop['status'] ?? 'active') === 'active' ? 'badge-active' : 'badge-inactive' ?>">
                            <?= ucfirst(e($prop['status'] ?? 'active')) ?>
                        </span>
                    </td>
                    <td>
                        <div class="d-flex gap-1">
                            <a href="properties.php?action=edit&id=<?= $prop['id'] ?>" class="btn btn-sm btn-outline-corporate"><i class="bi bi-pencil"></i></a>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="id" value="<?= $prop['id'] ?>">
                                <button class="btn btn-sm <?= ($prop['status'] ?? 'active') === 'active' ? 'btn-success-corporate' : 'btn-outline-corporate' ?>" title="Toggle status">
                                    <i class="bi <?= ($prop['status'] ?? 'active') === 'active' ? 'bi-toggle-on' : 'bi-toggle-off' ?>"></i>
                                </button>
                            </form>
                            <form method="post" style="display:inline;" onsubmit="return confirm('Delete this property?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<?= $prop['id'] ?>">
                                <button class="btn btn-sm btn-danger-corporate"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
                <?php endforeach; endif; ?>
            </tbody>
        </table>
    </div>
</div>
<?php endif; ?>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
